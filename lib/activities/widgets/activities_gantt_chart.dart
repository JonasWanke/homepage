import 'package:align_positioned/align_positioned.dart';
import 'package:dartx/dartx.dart'
    show
        ComparableSmallerEqualsExtension,
        IntRangeToExtension,
        IterableMinBy,
        IterableSortedByDescending;
import 'package:tuple/tuple.dart';

import '../../app/_.dart';
import '../activity.dart';
import '../local_month.dart';
import 'activity_card.dart';

class ActivitiesGanttChart extends StatelessWidget {
  ActivitiesGanttChart({super.key, required this.activities})
      : assert(activities.isNotEmpty);

  static const _activityHeight = 32.0;

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    final currentMonth = LocalMonth.current;
    final firstMonth = activities.map((it) => it.start).min;
    final lastMonth = currentMonth.plus(months: 1);
    final monthWidth = 1 / lastMonth.difference(firstMonth);

    final yearLabelsAndDividers =
        (firstMonth.year + 1).rangeTo(lastMonth.year).map((year) {
      return AlignPositioned(
        alignment: Alignment(
          LocalMonth(year, 01)
              .difference(firstMonth)
              .toDouble()
              .mapRange(0, lastMonth.difference(firstMonth).toDouble(), -1, 1),
          0,
        ),
        childHeightRatio: 1,
        child: Column(children: [
          SizedBox(
            height: _activityHeight * 0.75,
            child: Center(
              child: Text(year.toString(), textAlign: TextAlign.center),
            ),
          ),
          const Expanded(child: VerticalDivider()),
        ]),
      );
    });

    final maxYAndPositions = activities
        .groupListsBy((it) => it.type)
        .entries
        .sortedBy<num>((it) => it.key.index)
        .fold(const Tuple2(0, <Activity, int>{}), (state, it) {
      final positions = _calculateActivityPositions(it.value, state.item1);
      positions.addAll(state.item2);
      return Tuple2(positions.values.max + 1, positions);
    });
    final maxY = maxYAndPositions.item1;
    final positions = maxYAndPositions.item2;
    final activityChildren = positions.entries.map((it) {
      final activity = it.key;
      final position = it.value;

      final duration =
          (activity.end ?? currentMonth).difference(activity.start) + 1;
      return AlignPositioned(
        alignment: Alignment.topLeft,
        moveByContainerWidth:
            activity.start.difference(firstMonth) * monthWidth,
        dy: (position + 1) * _activityHeight,
        childWidthRatio: duration * monthWidth,
        childHeight: _activityHeight,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: _ActivityEntry(activity),
        ),
      );
    });

    return SizedBox(
      height: (maxY + 1.25) * _activityHeight,
      child: Stack(children: [...yearLabelsAndDividers, ...activityChildren]),
    );
  }

  Map<Activity, int> _calculateActivityPositions(
    List<Activity> activities,
    int minY,
  ) {
    final yPositions = <Activity, int>{};
    for (final activity in activities.sortedByEndLength()) {
      var y = minY;
      while (true) {
        final intersectingActivities =
            yPositions.entries.where((it) => it.value == y).map((it) => it.key);
        if (intersectingActivities.none(activity.intersects)) {
          yPositions[activity] = y;
          break;
        }

        y++;
      }
    }
    return yPositions;
  }
}

class _ActivityEntry extends StatelessWidget {
  const _ActivityEntry(this.activity);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final representativeTag = activity.tags.minBy((it) => it.index);
    return ActivityTypeColoredCard(
      activity.type,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(children: [
        const SizedBox(width: 8),
        if (representativeTag != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 8, bottom: 4),
            child: AspectRatio(
              aspectRatio: 1,
              child: representativeTag.icon.widget,
            ),
          ),
        Expanded(
          child: Text(
            activity.title,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.fade,
          ),
        ),
      ]),
    );
  }
}

extension on Activity {
  bool intersects(Activity other) {
    final currentMonth = LocalMonth.current;
    final thisEnd = end ?? currentMonth;
    final otherEnd = other.end ?? currentMonth;
    return start <= otherEnd && other.start <= thisEnd;
  }
}

extension on List<Activity> {
  List<Activity> sortedByEndLength() {
    return sortedByDescending((it) => it.end ?? LocalMonth.current)
        .thenByDescending((it) => it.start);
  }
}

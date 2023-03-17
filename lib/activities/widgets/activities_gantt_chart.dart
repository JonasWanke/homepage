import 'package:align_positioned/align_positioned.dart';
import 'package:dartx/dartx.dart'
    show
        ComparableSmallerEqualsExtension,
        IntRangeToExtension,
        IterableMinBy,
        IterableSortedByDescending;

import '../../app/_.dart';
import '../activity.dart';
import '../local_month.dart';

class ActivitiesGanttChart extends StatelessWidget {
  const ActivitiesGanttChart({super.key, required this.activities});

  static const _activityHeight = 32.0;

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) return const SizedBox();

    final currentMonth = LocalMonth.current;
    final yPositions = _calculateActivityPositions();

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

    final activityChildren = yPositions.entries.map((it) {
      final activity = it.key;
      final yPosition = it.value;

      final duration =
          (activity.end ?? currentMonth).difference(activity.start) + 1;
      return AlignPositioned(
        alignment: Alignment.topLeft,
        moveByContainerWidth:
            activity.start.difference(firstMonth) * monthWidth,
        dy: (yPosition + 1) * _activityHeight,
        childWidthRatio: duration * monthWidth,
        childHeight: _activityHeight,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: _ActivityEntry(activity),
        ),
      );
    });

    return SizedBox(
      height: (yPositions.values.max + 2.25) * _activityHeight,
      child: Stack(children: [...yearLabelsAndDividers, ...activityChildren]),
    );
  }

  Map<Activity, int> _calculateActivityPositions() {
    final yPositions = <Activity, int>{};
    for (final activity in activities.sortedByEndLength()) {
      var y = 0;
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
    return Card(
      color: activity.type.getCardColor(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(children: [
        const SizedBox(width: 8),
        if (representativeTag != null) ...[
          AspectRatio(aspectRatio: 1, child: representativeTag.icon),
          const SizedBox(width: 8),
        ],
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

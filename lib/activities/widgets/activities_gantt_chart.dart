import 'package:align_positioned/align_positioned.dart';
import 'package:dartx/dartx.dart'
    show
        ComparableSmallerEqualsExtension,
        IterableMinBy,
        IterableSortedByDescending;

import '../../app/_.dart';
import '../activities.dart';
import '../activity.dart';
import '../local_month.dart';

class ActivitiesGanttChart extends StatelessWidget {
  const ActivitiesGanttChart({super.key});

  static const _activityHeight = 32.0;

  @override
  Widget build(BuildContext context) {
    final currentMonth = LocalMonth.current;
    final yPositions = _calculateActivityPositions();

    final firstMonth =
        activities.map((it) => it.start).minOrNull ?? currentMonth;
    final lastMonth = currentMonth.plus(months: 1);
    final monthWidth = 1 / lastMonth.difference(firstMonth);

    return SizedBox(
      height: ((yPositions.values.maxOrNull ?? -1) + 1) * _activityHeight,
      child: Stack(
        children: yPositions.entries.map((it) {
          final activity = it.key;
          final yPosition = it.value;

          final duration =
              (activity.end ?? currentMonth).difference(activity.start) + 1;
          return AlignPositioned(
            alignment: Alignment.topLeft,
            moveByContainerWidth:
                activity.start.difference(firstMonth) * monthWidth,
            dy: yPosition * _activityHeight,
            childWidthRatio: duration * monthWidth,
            childHeight: _activityHeight,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: _ActivityEntry(activity),
            ),
          );
        }).toList(),
      ),
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

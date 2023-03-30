import 'package:align_positioned/align_positioned.dart';
import 'package:dartx/dartx.dart'
    show
        ComparableCoerceAtLeastExtension,
        ComparableSmallerEqualsExtension,
        IntRangeToExtension,
        IterableMinBy;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:tuple/tuple.dart';

import '../../app/_.dart';
import '../activity.dart';
import '../local_month.dart';
import '../tag.dart';
import 'activity_card.dart';

class ActivitiesGanttChart extends HookWidget {
  ActivitiesGanttChart({
    super.key,
    required this.activities,
    required this.primaryTagFilters,
    required this.tagFilters,
  }) : assert(activities.isNotEmpty);

  static const _activityHeight = 32.0;
  static const _activityPadding = 2.0;
  static const _minMonth = LocalMonth(2016, 01);

  final List<Activity> activities;
  final ValueNotifier<Set<PrimaryTag>> primaryTagFilters;
  final ValueNotifier<Set<Tag>> tagFilters;

  @override
  Widget build(BuildContext context) {
    final currentMonth = LocalMonth.current;
    final firstMonth =
        activities.map((it) => it.start).min.coerceAtLeast(_minMonth);
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

      final start = activity.start.coerceAtLeast(firstMonth);
      final duration = (activity.end ?? currentMonth).difference(start) + 1;
      return AlignPositioned(
        alignment: Alignment.topLeft,
        moveByContainerWidth: start.difference(firstMonth) * monthWidth,
        dy: (position + 1) * _activityHeight,
        childWidthRatio: duration * monthWidth,
        minChildWidth: _activityHeight,
        childHeight: _activityHeight,
        child: Padding(
          padding: const EdgeInsets.all(_activityPadding),
          child: _ActivityEntry(
            activity,
            primaryTagFilters: primaryTagFilters,
            tagFilters: tagFilters,
          ),
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

class _ActivityEntry extends HookWidget {
  const _ActivityEntry(
    this.activity, {
    required this.primaryTagFilters,
    required this.tagFilters,
  });

  final Activity activity;
  final ValueNotifier<Set<PrimaryTag>> primaryTagFilters;
  final ValueNotifier<Set<Tag>> tagFilters;

  @override
  Widget build(BuildContext context) {
    final representativeIcon = activity.primaryTag?.icon ??
        activity.tags.minBy(Tag.values.indexOf)?.icon;
    final child = ActivityColoredCard(
      activity,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (representativeIcon != null)
            Padding(
              padding: const EdgeInsets.all(4),
              child:
                  AspectRatio(aspectRatio: 1, child: representativeIcon.widget),
            ),
          Flexible(
            child: Text(
              activity.title,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
    return JustTheTooltip(
      borderRadius: const BorderRadius.all(Radius.circular(cardBorderRadius)),
      backgroundColor: activity.type.color,
      content: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: ActivityCard.maxWidth),
        child: ActivityCard(
          activity,
          primaryTagFilters: primaryTagFilters,
          tagFilters: tagFilters,
        ),
      ),
      child: SizedBox(
        // Seems to be required for JustTheTooltip to work properly
        height: ActivitiesGanttChart._activityHeight -
            ActivitiesGanttChart._activityPadding * 2,
        child: child,
      ),
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

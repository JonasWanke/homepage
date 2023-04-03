import 'package:dartx/dartx.dart' show IterableContainsAny;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../app/_.dart';
import '../activity.dart';
import '../tag.dart';
import 'activities_gantt_chart.dart';
import 'chips.dart';
import 'sliver_activities_grid.dart';

class SliverActivities extends HookWidget {
  const SliverActivities({super.key});

  @override
  Widget build(BuildContext context) {
    final typeFilters = useState(<ActivityType>{});
    final typeFilterWidget = _ChipGroupFilterWidget(
      ActivityType.values,
      buildChip: (it) => ActivityTypeChip(it, filters: typeFilters),
    );

    final primaryTagFilters = useState(<PrimaryTag>{});
    final primaryTagFilterWidget = _ChipGroupFilterWidget(
      PrimaryTag.values,
      buildChip: (it) => TagChip(it, filters: primaryTagFilters),
    );

    final tagFilters = useState(<Tag>{});
    final tagFilterWidget = _ChipGroupFilterWidget(
      Tag.values.sortedBy((it) => it.title.toLowerCase()),
      buildChip: (it) => TagChip(it, filters: tagFilters),
    );

    final filteredActivities = Activity.values
        .whereFiltersMatch(
          typeFilters.value,
          getFromActivity: (it) => [it.type],
        )
        .whereFiltersMatch(
          primaryTagFilters.value,
          getFromActivity: (it) => [if (it.primaryTag != null) it.primaryTag!],
        )
        .whereFiltersMatch(tagFilters.value, getFromActivity: (it) => it.tags)
        .toList();
    return MultiSliver(children: [
      SliverToBoxAdapter(
        child: Column(children: [
          typeFilterWidget,
          const SizedBox(height: 16),
          primaryTagFilterWidget,
          const SizedBox(height: 16),
          tagFilterWidget,
          const SizedBox(height: 16),
          if (filteredActivities.isEmpty)
            const Text('No activities match your filters')
          else ...[
            ActivitiesGanttChart(
              activities: filteredActivities,
              primaryTagFilters: primaryTagFilters,
              tagFilters: tagFilters,
            ),
            const SizedBox(height: 16),
          ],
        ]),
      ),
      if (filteredActivities.isNotEmpty)
        SliverActivitiesGrid(
          activities: filteredActivities,
          primaryTagFilters: primaryTagFilters,
          tagFilters: tagFilters,
        ),
    ]);
  }
}

extension Filters<T> on ValueNotifier<Set<T>> {
  // ignore: avoid_positional_boolean_parameters
  void set(T filter, bool isIncluded) {
    value =
        isIncluded ? value.addImmutable(filter) : value.removeImmutable(filter);
  }
}

extension on Iterable<Activity> {
  Iterable<Activity> whereFiltersMatch<T>(
    Set<T> filters, {
    required Iterable<T> Function(Activity) getFromActivity,
  }) {
    if (filters.isEmpty) return this;

    return where((it) => getFromActivity(it).containsAny(filters));
  }
}

class _ChipGroupFilterWidget<T> extends StatelessWidget {
  const _ChipGroupFilterWidget(this.values, {required this.buildChip});

  final List<T> values;
  final Widget Function(T) buildChip;

  @override
  Widget build(BuildContext context) {
    return ChipGroup(
      alignment: WrapSuperAlignment.center,
      children: [for (final value in values) buildChip(value)],
    );
  }
}

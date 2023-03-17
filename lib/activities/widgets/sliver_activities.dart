import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../app/_.dart';
import '../activities.dart';
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
    final typeFilterWidget = ChipGroup(
      alignment: WrapSuperAlignment.center,
      children: [
        for (final type in ActivityType.values)
          ActivityTypeChip(type, filters: typeFilters),
      ],
    );

    final tagFilters = useState(<Tag>{});
    final tagFilterWidget = ChipGroup(
      alignment: WrapSuperAlignment.center,
      children: [
        for (final tag in Tag.values.sortedBy((it) => it.title))
          TagChip(tag, filters: tagFilters),
      ],
    );

    final filteredActivities = activities
        .where(
          (it) =>
              typeFilters.value.isEmpty || typeFilters.value.contains(it.type),
        )
        .where((it) => it.tags.containsAll(tagFilters.value))
        .toList();
    return MultiSliver(children: [
      SliverToBoxAdapter(
        child: Column(children: [
          typeFilterWidget,
          const SizedBox(height: 16),
          tagFilterWidget,
          const SizedBox(height: 16),
          if (filteredActivities.isEmpty)
            const Text('No activities match your filters')
          else ...[
            ActivitiesGanttChart(activities: filteredActivities),
            const SizedBox(height: 16),
          ],
        ]),
      ),
      if (filteredActivities.isNotEmpty)
        SliverActivitiesGrid(
          activities: filteredActivities,
          tagFilters: tagFilters,
        ),
    ]);
  }
}

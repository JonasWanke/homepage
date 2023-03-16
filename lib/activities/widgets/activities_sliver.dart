import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../app/_.dart';
import '../activities.dart';
import '../tag.dart';
import 'activity_card.dart';

class ActivitiesSliver extends HookWidget {
  const ActivitiesSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final tagFilters = useState(<Tag>{});

    final filteredActivities = activities
        .where((it) => it.tags.containsAll(tagFilters.value))
        .toList();
    return SliverMasonryGrid.extent(
      maxCrossAxisExtent: 384,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childCount: filteredActivities.length,
      itemBuilder: (context, index) =>
          ActivityCard(filteredActivities[index], tagFilters: tagFilters),
    );
  }
}

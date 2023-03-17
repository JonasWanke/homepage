import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../app/_.dart';
import '../activity.dart';
import '../tag.dart';
import 'activity_card.dart';

class SliverActivitiesGrid extends StatelessWidget {
  const SliverActivitiesGrid({
    super.key,
    required this.activities,
    required this.tagFilters,
  });

  final List<Activity> activities;
  final ValueNotifier<Set<Tag>> tagFilters;

  @override
  Widget build(BuildContext context) {
    final activities = this.activities.sortedByEndLength();
    return SliverMasonryGrid.extent(
      maxCrossAxisExtent: ActivityCard.maxWidth,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childCount: activities.length,
      itemBuilder: (context, index) =>
          ActivityCard(activities[index], tagFilters: tagFilters),
    );
  }
}

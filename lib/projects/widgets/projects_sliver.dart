import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../app/_.dart';
import '../projects.dart';
import '../tag.dart';
import 'project_card.dart';

class ProjectsSliver extends HookWidget {
  const ProjectsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final tagFilters = useState(<Tag>{});

    final filteredProjects =
        projects.where((it) => it.tags.containsAll(tagFilters.value)).toList();
    return SliverMasonryGrid.extent(
      maxCrossAxisExtent: 384,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childCount: filteredProjects.length,
      itemBuilder: (context, index) =>
          ProjectCard(filteredProjects[index], tagFilters: tagFilters),
    );
  }
}

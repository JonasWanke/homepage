import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../app/_.dart';
import 'data.dart';

class ProjectsSliver extends HookWidget {
  const ProjectsSliver({super.key});

  @override
  Widget build(BuildContext context) {
    final tagFilters = useState(<Tag>{});

    final projects = Project.values
        .where((project) => project.tags.containsAll(tagFilters.value))
        .toList();
    return SliverMasonryGrid.extent(
      maxCrossAxisExtent: 384,
      childCount: projects.length,
      itemBuilder: (context, index) =>
          ProjectCard(projects[index], tagFilters: tagFilters),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard(this.project, {required this.tagFilters});

  final Project project;
  final ValueNotifier<Set<Tag>> tagFilters;

  @override
  Widget build(BuildContext context) {
    final title = Text.rich(
      TextSpan(
        text: project.title,
        children: [
          if (project.tags.isNotEmpty)
            const WidgetSpan(child: SizedBox(width: 8)),
          for (final tag in project.links)
            WidgetSpan(
              child: _LinkButton(tag),
              alignment: PlaceholderAlignment.middle,
            ),
        ],
      ),
      style: context.textTheme.titleLarge,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            title,
            Text(project.description),
            const SizedBox(height: 8),
            WrapSuper(
              spacing: 16,
              children: [
                for (final tag in project.tags.sortedBy<num>((it) => it.index))
                  _TagChip(
                    tag,
                    isSelected: tagFilters.value.contains(tag),
                    onSelectedChange: (isSelected) {
                      tagFilters.value = isSelected
                          ? tagFilters.value.addImmutable(tag)
                          : tagFilters.value.removeImmutable(tag);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip(
    this.tag, {
    required this.isSelected,
    required this.onSelectedChange,
  });

  final Tag tag;
  final bool isSelected;
  final ValueChanged<bool> onSelectedChange;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      side: BorderSide(
        color: context.theme.colorScheme.surface.contrastColor.withOpacity(0.1),
      ),
      backgroundColor: Colors.transparent,
      selected: isSelected,
      selectedColor: context.theme.primaryColor.withOpacity(0.15),
      showCheckmark: false,
      onSelected: onSelectedChange,
      avatar: tag.icon,
      label: Text(tag.title),
    );
  }
}

class _LinkButton extends StatelessWidget {
  const _LinkButton(this.link);

  final Link link;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: () async => tryLaunchingUrl(link.url),
      tooltip: link.tooltip,
      iconSize: 20,
      icon: SizedBox.square(dimension: 20, child: link.icon),
    );
  }
}

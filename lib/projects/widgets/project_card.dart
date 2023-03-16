import '../../app/_.dart';
import '../project.dart';
import '../tag.dart';

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

    final tags = WrapSuper(
      spacing: 8,
      lineSpacing: 8,
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
    );

    Widget child = Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title,
          Text(project.description),
          const SizedBox(height: 8),
          tags,
        ],
      ),
    );
    if (project.isArchived) {
      child = Tooltip(
        message: 'This project is archived.',
        child: Opacity(opacity: 0.5, child: child),
      );
    }
    return Card(child: child);
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
      tooltip: tag.tooltip,
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

import '../../app/_.dart';
import '../activity.dart';
import '../tag.dart';

class ActivityTypeChip extends StatelessWidget {
  const ActivityTypeChip(this.type, {required this.filters});

  final ActivityType type;
  final ValueNotifier<Set<ActivityType>> filters;

  @override
  Widget build(BuildContext context) {
    return _Chip(
      type,
      filters,
      type.title,
      backgroundColor: type.getCardColor(context),
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip(this.tag, {required this.filters});

  final Tag tag;
  final ValueNotifier<Set<Tag>> filters;

  @override
  Widget build(BuildContext context) {
    return _Chip(
      tag,
      filters,
      tag.title,
      avatar: tag.icon,
      tooltip: tag.tooltip,
    );
  }
}

class _Chip<T> extends StatelessWidget {
  const _Chip(
    this.value,
    this.filters,
    this.label, {
    this.avatar,
    this.tooltip,
    this.backgroundColor,
  });

  final T value;
  final ValueNotifier<Set<T>> filters;
  final String label;
  final Widget? avatar;
  final String? tooltip;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = this.backgroundColor ??
        context.theme.colorScheme.surface.contrastColor.withOpacity(0);
    return FilterChip(
      tooltip: tooltip,
      side: BorderSide(
        color: context.theme.colorScheme.surface.contrastColor.withOpacity(0.1),
      ),
      backgroundColor: backgroundColor,
      selected: filters.value.contains(value),
      selectedColor: backgroundColor.withOpacity(0.15),
      // emphasize outline
      onSelected: (isSelected) {
        filters.value = isSelected
            ? filters.value.addImmutable(value)
            : filters.value.removeImmutable(value);
      },
      avatar: avatar,
      label: Text(label),
    );
  }
}

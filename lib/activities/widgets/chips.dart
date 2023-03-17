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
      backgroundColor: type.backgroundColor,
      borderColor: type.borderColor,
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
      avatar: tag.icon.widget,
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
    this.borderColor,
  });

  final T value;
  final ValueNotifier<Set<T>> filters;
  final String label;
  final Widget? avatar;
  final String? tooltip;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final isSelected = filters.value.contains(value);
    return Theme(
      data: ThemeData(canvasColor: Colors.transparent),
      child: FilterChip(
        tooltip: tooltip,
        side: isSelected
            ? BorderSide.none
            : BorderSide(
                color: borderColor ??
                    context.theme.colorScheme.surface.contrastColor
                        .withOpacity(0.1),
              ),
        backgroundColor: backgroundColor ?? Colors.transparent,
        selected: isSelected,
        selectedColor: borderColor,
        onSelected: (isSelected) {
          filters.value = isSelected
              ? filters.value.addImmutable(value)
              : filters.value.removeImmutable(value);
        },
        avatar: avatar,
        label: Text(
          label,
          style: TextStyle(color: context.textTheme.labelMedium!.color),
        ),
      ),
    );
  }
}

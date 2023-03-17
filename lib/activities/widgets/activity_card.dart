import '../../app/_.dart';
import '../activity.dart';
import '../local_month.dart';
import '../tag.dart';
import 'chips.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard(this.activity, {required this.tagFilters});

  static const maxWidth = 384.0;

  final Activity activity;
  final ValueNotifier<Set<Tag>> tagFilters;

  @override
  Widget build(BuildContext context) {
    final title = Text.rich(
      TextSpan(
        text: activity.title,
        children: [
          if (activity.tags.isNotEmpty)
            const WidgetSpan(child: SizedBox(width: 8)),
          for (final tag in activity.links)
            WidgetSpan(
              child: _LinkButton(tag),
              alignment: PlaceholderAlignment.middle,
            ),
        ],
      ),
      style: context.textTheme.titleLarge,
    );

    const format = LocalMonthFormat.long;
    final String rangeText;
    if (activity.end == null) {
      rangeText = 'since ${format.format(activity.start)}';
    } else if (activity.start == activity.end) {
      rangeText = format.format(activity.start);
    } else {
      rangeText =
          '${format.format(activity.start)} – ${format.format(activity.end!)}';
    }
    final range = Text(
      rangeText,
      style: context.textTheme.bodySmall!.copyWith(
        color: context.theme.colorScheme.brightness.mediumEmphasisOnColor,
      ),
    );

    final tags = ChipGroup(children: [
      for (final tag in activity.tags) TagChip(tag, filters: tagFilters),
    ]);

    return ActivityColoredCard(
      activity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            title,
            const SizedBox(height: 4),
            range,
            const SizedBox(height: 4),
            if (activity.description != null) ...[
              Text(activity.description!),
              const SizedBox(height: 8),
            ],
            tags,
          ],
        ),
      ),
    );
  }
}

class ActivityColoredCard extends StatelessWidget {
  const ActivityColoredCard(
    this.activity, {
    this.borderRadius,
    required this.child,
  });

  final Activity activity;
  final BorderRadius? borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: activity.isHighlight
            ? BorderSide(color: activity.type.borderColor)
            : BorderSide.none,
        borderRadius: borderRadius ??
            const BorderRadius.all(Radius.circular(cardBorderRadius)),
      ),
      surfaceTintColor: Colors.transparent,
      color: activity.type.backgroundColor
          .alphaBlendOn(context.theme.colorScheme.surface),
      child: child,
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

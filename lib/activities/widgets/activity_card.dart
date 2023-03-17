import '../../app/_.dart';
import '../activity.dart';
import '../tag.dart';
import 'chips.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard(this.activity, {required this.tagFilters});

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

    final tags = ChipGroup(children: [
      for (final tag in activity.tags) TagChip(tag, filters: tagFilters),
    ]);

    Widget child = Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          title,
          Text(activity.description),
          const SizedBox(height: 8),
          tags,
        ],
      ),
    );
    if (!activity.isOngoing) {
      child = Tooltip(
        message: 'This activity has ended.',
        child: Opacity(opacity: 0.5, child: child),
      );
    }
    return Card(color: activity.type.getCardColor(context), child: child);
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

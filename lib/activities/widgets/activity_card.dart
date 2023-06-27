import 'package:supernova_flutter/supernova_flutter.dart';

import '../../app/_.dart';
import '../activity.dart';
import '../link.dart';
import '../tag.dart';
import 'chips.dart';
import 'sliver_activities.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard(
    this.activity, {
    required this.primaryTagFilters,
    required this.tagFilters,
  });

  static const maxWidth = 384.0;
  static const _horizontalPadding = 16.0;

  final Activity activity;
  final ValueNotifier<Set<PrimaryTag>> primaryTagFilters;
  final ValueNotifier<Set<Tag>> tagFilters;

  @override
  Widget build(BuildContext context) {
    final title = Text.rich(
      TextSpan(
        text: activity.fullTitle,
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

    final range = Text(
      LocalMonthFormat.long.formatRange(activity.start, activity.end),
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
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: _buildColumn(shouldPadHorizontally: false, [
          _buildColumn([
            title,
            const SizedBox(height: 4),
            range,
            const SizedBox(height: 8),
          ]),
          if (activity.primaryTag != null) ...[
            _PrimaryTagTile(
              activity.primaryTag!,
              primaryTagFilters: primaryTagFilters,
            ),
            const SizedBox(height: 8),
          ],
          _buildColumn([
            if (activity.description != null) ...[
              Text(activity.description!),
              const SizedBox(height: 8),
            ],
            tags,
          ]),
        ]),
      ),
    );
  }

  Widget _buildColumn(
    List<Widget> children, {
    bool shouldPadHorizontally = true,
  }) {
    Widget child = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
    if (shouldPadHorizontally) {
      child = Padding(
        padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: child,
      );
    }
    return child;
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

class _PrimaryTagTile extends StatelessWidget {
  const _PrimaryTagTile(this.primaryTag, {required this.primaryTagFilters});

  final PrimaryTag primaryTag;
  final ValueNotifier<Set<PrimaryTag>> primaryTagFilters;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => primaryTagFilters.set(primaryTag, true),
      leading: primaryTag.icon == null
          ? null
          : SizedBox.square(dimension: 48, child: primaryTag.icon!.widget),
      title: Text(primaryTag.description, style: context.textTheme.bodyMedium),
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

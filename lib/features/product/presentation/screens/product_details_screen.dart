import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/features/product/presentation/screens/utils/product_app_bar_leading.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_view_model.dart';
import 'package:google_play/features/shared/presentation/widgets/components/app_bars/simple_app_bar.dart';
import 'package:google_play/features/shared/presentation/widgets/product_widgets/elements/product_card_components.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductDetailsScreen extends ConsumerWidget {
  final String productId;
  final VoidCallback? onPermissionsTap;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
    this.onPermissionsTap,
  });

  List<Widget> _withSpacing(List<Widget> widgets, {double spacing = 25}) {
    if (widgets.isEmpty) return [];
    return widgets.expand((w) => [w, SizedBox(height: spacing)]).toList()
      ..removeLast();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productViewModelProvider(productId));

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Constants.sliderMaxContentWidth,
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SimpleSliverAppBar(
                  showBackButton: true,
                  showLogo: false,
                  titleLeading: ProductAppBarLeading(state: state),
                  title: Text(
                    state.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: Constants.defaultFontWeight,
                    ),
                  ),
                  subtitle: Text(
                    context.l10n.detailsInfo,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  onLeadingPressed: () => context.pop(),
                ),

                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 22,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      // Заголовок
                      Text(
                        state.descriptionSectionTitle,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),

                      // Краткое описание
                      Text(
                        state.shortDescription,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),

                      // Полное описание
                      Text(
                        state.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Divider(),

                      // Что нового
                      if (state.showWhatsNewSection) ...[
                        Row(
                          children: [
                            Text(
                              context.l10n.whatsNew,
                              style: const TextStyle(fontSize: 16),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '●',
                              style: TextStyle(
                                fontSize: 20,
                                color: Constants.googleBlue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          state.whatsNewText ?? context.l10n.noInformation,
                          style: const TextStyle(fontSize: 14),
                        ),
                        const Divider(),

                        // Дополнительно
                        Text(
                          context.l10n.detailsSectionExtra,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 20),

                        _DetailRow(
                          title: state.ageRating ?? '',
                          icon: AgeBadge(age: state.ageRating!, fontSize: 20),
                          subtitle: state.ageRatingReasons,
                          actionText: context.l10n.detailsMore,
                          onActionPressed:
                              () {}, // TODO: [link] на страницу с отзывами
                        ),

                        if (state.showAds) ...[
                          const SizedBox(height: 20),
                          _DetailRow(
                            icon: const Icon(Icons.ad_units),
                            title: context.l10n.hasAds,
                            subtitle: context.l10n.adsDisclaimer,
                            actionText: context.l10n.detailsMore,
                          ),
                        ],

                        if (state.showAchievements) ...[
                          const SizedBox(height: 20),
                          _DetailRow(
                            icon: const Icon(Icons.emoji_events),
                            title: context.l10n.achievements,
                            subtitle: context.l10n.achievementsDescription,
                          ),
                        ],

                        const Divider(),
                      ],

                      Text(
                        state.aboutSectionTitle,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),

                      ..._withSpacing(
                        state.infoRows.map((row) {
                          return _InfoRow(
                            label: row.label,
                            value: row.value,
                            hasTextButton: row.hasTextButton,
                            onTextButtonPressed: row.hasTextButton
                                ? () => onPermissionsTap?.call()
                                : null,
                          );
                        }).toList(),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onActionPressed;
  final String? actionText;

  const _DetailRow({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onActionPressed,
    this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Фиксированная ширина для зоны иконок, чтобы тексты были выровнены
        SizedBox(width: 45, child: Center(child: icon)),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(subtitle!, style: const TextStyle(fontSize: 14)),
              ],
              if (onActionPressed != null && actionText != null)
                TextButton(
                  onPressed: onActionPressed,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    actionText!,
                    style: const TextStyle(color: Constants.googleBlue),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final TextAlign textAlign;
  final bool hasTextButton;
  final VoidCallback? onTextButtonPressed;

  const _InfoRow({
    required this.label,
    required this.value,
    // ignore: unused_element_parameter
    this.textAlign = TextAlign.end,
    this.hasTextButton = false,
    this.onTextButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Expanded(
          child: hasTextButton
              ? TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: onTextButtonPressed,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        value,
                        style: const TextStyle(color: Constants.googleBlue),
                      ),
                    ],
                  ),
                )
              : Text(value, textAlign: textAlign),
        ),
      ],
    );
  }
}

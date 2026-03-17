import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/core/utils/url_launcher.dart';
import 'package:google_play/presentation/screens/product_screens/utils/product_support_data.dart';
import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class ProductPageSupportSection extends StatelessWidget {
  final ProductState state;
  final VoidCallback? onAboutAuthorTap;

  const ProductPageSupportSection({
    super.key,
    required this.state,
    this.onAboutAuthorTap,
  });

  @override
  Widget build(BuildContext context) {
    if (state.supportSectionType == SupportSectionType.none) {
      return const SizedBox.shrink();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.supportSectionType == SupportSectionType.aboutAuthor &&
            onAboutAuthorTap != null) ...[
          ProductSectionHeader(
            title: context.l10n.aboutAuthor,
            padding: EdgeInsets.zero,
            subtitle: state.creator,
            onTap: onAboutAuthorTap!,
          ),
        ],
        if (state.supportSectionType == SupportSectionType.appSupport) ...[
          CustomExpansionTile(
            items: state.supportItems
                .map((item) => _mapSupportItemToUi(item))
                .toList(),
            title: Text(
              context.l10n.appSupport,
              style: TextStyle(
                fontWeight: Constants.defaultFontWeight,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ],
    );
  }

  SupportItem _mapSupportItemToUi(SupportItemData item) {
    switch (item.type) {
      case SupportItemDataType.link:
        final icon = item.iconCodePoint != null
            ? IconData(item.iconCodePoint!, fontFamily: 'MaterialIcons')
            : null;
        return SupportItem.link(
          icon: icon,
          title: item.title ?? '',
          subtitle: item.subtitle,
          onTap: item.url != null ? () => launchMyUrl(item.url!) : null,
        );
      case SupportItemDataType.sectionHeader:
        return SupportItem.sectionHeader(
          title: item.title ?? '',
        );
      case SupportItemDataType.infoText:
        return SupportItem.infoText(
          title: item.title ?? '',
        );
    }
  }
}

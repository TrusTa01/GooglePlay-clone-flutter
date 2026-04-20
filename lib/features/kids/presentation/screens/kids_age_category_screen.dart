import 'package:flutter/material.dart';
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/presentation/widgets/widgets.dart';
import 'package:google_play/features/category/data/product_categories_data.dart';
import 'package:google_play/features/kids/presentation/viewmodels/kids_age_category_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KidsAgeCategoryScreen extends ConsumerWidget {
  final String ageKey;

  const KidsAgeCategoryScreen({super.key, required this.ageKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionsAsync = ref.watch(kidsAgeCategoryProvider(ageKey));
    final title = resolveProductCategoryTitle(
      context.l10n,
      ProductCategoriesData(titleL10nKey: ageKey),
    );

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
                  title: AppBarTitle(title: title.isEmpty ? ageKey : title),
                ),
                // TODO: [logic]
                sectionsAsync.when(
                  data: (sections) => SectionWidgetBuilder.asSliver(
                    sections: sections,
                    storageId: 'kids_age_$ageKey',
                  ),
                  loading: () => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (err, stack) => SliverFillRemaining(
                    child: Center(child: Text('Ошибка: $err')),
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

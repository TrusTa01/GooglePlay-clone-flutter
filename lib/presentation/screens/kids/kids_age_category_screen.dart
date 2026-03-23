import 'package:flutter/material.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/presentation/viewmodels/kids/kids_age_category_view_model.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KidsAgeCategoryScreen extends ConsumerWidget {
  final String ageKey;

  const KidsAgeCategoryScreen({super.key, required this.ageKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sectionsAsync = ref.watch(kidsAgeCategoryProvider(ageKey));

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
                  title: AppBarTitle(title: ageKey),
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

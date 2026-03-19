import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class KidsAgeCategoryScreen extends StatelessWidget {
  final String ageLabel;
  final List<ResolvedSection> sections;

  const KidsAgeCategoryScreen({
    super.key,
    required this.ageLabel,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
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
                  title: AppBarTitle(title: ageLabel),
                ),
                SectionWidgetBuilder.asSliver(
                  sections: sections,
                  storageId: 'kids_age_$ageLabel',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

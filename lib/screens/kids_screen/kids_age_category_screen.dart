import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import '/models/models.dart';
import '/screens/screens.dart';

class KidsAgeCategoryScreen extends StatelessWidget {
  final String ageLabel;
  final List<HomeSection> sections;

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
                GenericTabScreen.asSliver(sections: sections),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

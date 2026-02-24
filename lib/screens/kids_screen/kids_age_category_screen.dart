import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/data/models/dtos.dart';
import 'package:google_play/screens/screens.dart';
import 'package:google_play/widgets/widgets.dart';

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

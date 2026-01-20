import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(ageLabel),
      ),
      body: GenericTabScreen(sections: sections),
    );
  }
}
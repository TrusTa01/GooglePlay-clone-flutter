import 'package:flutter/material.dart';
import 'package:google_play/presentation/viewmodels/product/ui_models/about_author_ui_model.dart';

class AboutAuthorScreen extends StatelessWidget {
  final AboutAuthorUiModel model;

  const AboutAuthorScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.authorName)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        child: Column(children: [Text(model.authorDescription)]),
      ),
    );
  }
}

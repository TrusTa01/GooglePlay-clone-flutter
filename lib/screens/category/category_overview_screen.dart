import 'package:flutter/material.dart';

import '/screens/screens.dart';
import '../../widgets/widgets.dart';

class CategoryOverviewScreen extends StatelessWidget {
  final String title;

  const CategoryOverviewScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        type: AppBarType.transparent,
        showBackButton: true,
        onLeadingPressed: () => Navigator.pop(context),
        title: AppBarTitle(title: title),
      ),
      body: TopChartsScreen(type: FilterType.books)
    );
  }
}

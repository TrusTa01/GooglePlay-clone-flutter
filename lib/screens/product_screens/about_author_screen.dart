import 'package:flutter/material.dart';

import '../../models/models.dart';

class AboutAuthorScreen extends StatelessWidget {
  final Product product;
  
  const AboutAuthorScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.creator),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        child: Column(
          children: [
            Text(product.creatorDescription),
          ],
        ),
      ),
    );
  }
}
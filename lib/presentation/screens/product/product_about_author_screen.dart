import 'package:flutter/material.dart';
import 'package:google_play/presentation/viewmodels/product/product_view_model.dart';
import 'package:google_play/presentation/viewmodels/product/ui_mappers/about_author_mapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutAuthorScreen extends ConsumerWidget {
  final String productId;

  const AboutAuthorScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productViewModelProvider(productId));
    final model = const AboutAuthorMapper().fromState(state);

    return Scaffold(
      appBar: AppBar(title: Text(model.authorName)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
        child: Column(children: [Text(model.authorDescription)]),
      ),
    );
  }
}

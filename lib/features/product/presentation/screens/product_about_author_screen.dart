import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_view_model.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/about_author_mapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AboutAuthorScreen extends ConsumerWidget {
  final String productId;
  final ProductKind productType;

  const AboutAuthorScreen({
    super.key,
    required this.productId,
    required this.productType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productViewModelProvider((productId, productType)));
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

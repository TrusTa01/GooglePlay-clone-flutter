import 'package:google_play/presentation/viewmodels/product/product_details_state.dart';
import 'package:google_play/presentation/viewmodels/product/product_details_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final productDetailsViewModelProvider =
    StateNotifierProvider<ProductDetailsViewModel, ProductDetailsState>((ref) {
  return ProductDetailsViewModel();
});

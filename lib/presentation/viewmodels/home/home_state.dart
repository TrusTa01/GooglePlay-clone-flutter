import 'package:google_play/domain/entities/products/product_entity.dart';
import 'package:google_play/domain/entities/sections/tab_config_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeState {
  final bool isLoading;
  final Object? error;
  final List<ProductEntity> products;
  final String selectedCategoryId;
  final Map<String, AsyncValue<List<SectionEntity>>> sectionsByTab;

  const HomeState({
    this.isLoading = false,
    this.error,
    this.products = const [],
    this.selectedCategoryId = '',
    this.sectionsByTab = const {},
  });

  HomeState copyWith({
    bool? isLoading,
    Object? error,
    List<ProductEntity>? products,
    String? selectedCategoryId,
    Map<String, AsyncValue<List<SectionEntity>>>? sectionsByTab,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      products: products ?? this.products,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      sectionsByTab: sectionsByTab ?? this.sectionsByTab,
    );
  }
}

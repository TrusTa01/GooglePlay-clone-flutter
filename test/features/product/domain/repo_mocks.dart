import 'package:mocktail/mocktail.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/domain/repositories/i_products_repository.dart';

class MockProductRepository extends Mock implements IProductsRepository {}

class FakeProduct extends ProductEntity {
  FakeProduct({required super.id, required super.title})
    : super(
        type: 'book',
        creator: 'creator',
        shortDescription: 'short',
        description: 'description',
        releaseDate: DateTime(2020),
        reviewsCount: 0,
        iconUrl: '',
        isPaid: false,
        price: null,
        creatorDescription: '',
        url: '',
        tags: const [],
        categories: const [],
      );

  @override
  String get technicalInfo => '';
}

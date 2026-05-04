import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/product/domain/entities/filters/product_sort.dart';
import 'package:google_play/features/sections/domain/mappers/product_sort_mapper.dart';

void main() {
  test('maps sort aliases to expected ProductSort implementations', () {
    expect(ProductSortMapper.fromRaw('popular'), isA<Popular>());
    expect(ProductSortMapper.fromRaw('top_rated'), isA<TopRated>());
    expect(ProductSortMapper.fromRaw('toprated'), isA<TopRated>());
    expect(ProductSortMapper.fromRaw('new'), isA<NewRelease>());
    expect(ProductSortMapper.fromRaw('new_release'), isA<NewRelease>());
    expect(ProductSortMapper.fromRaw('newrelease'), isA<NewRelease>());
    expect(ProductSortMapper.fromRaw('last_updated'), isA<LastUpdated>());
    expect(ProductSortMapper.fromRaw('lastupdated'), isA<LastUpdated>());
    expect(ProductSortMapper.fromRaw('updated'), isA<LastUpdated>());
  });

  test('returns null for unknown or null sort keys', () {
    expect(ProductSortMapper.fromRaw(null), isNull);
    expect(ProductSortMapper.fromRaw('unknown_sort'), isNull);
  });
}

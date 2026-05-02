import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/features/product/domain/entities/filters/product_filters.dart';
import 'package:google_play/features/sections/domain/mappers/product_filter_mapper.dart';

void main() {
  test('maps category/genre values', () {
    final byCategory = ProductFilterMapper.fromRaw('category', 'Adventure');
    final byGenre = ProductFilterMapper.fromRaw('genre', 'Drama');

    expect(byCategory, isA<CategoryFilter>());
    expect((byCategory as CategoryFilter).genre, 'Adventure');
    expect(byGenre, isA<CategoryFilter>());
    expect((byGenre as CategoryFilter).genre, 'Drama');
  });

  test('maps tag and paid filters', () {
    final tag = ProductFilterMapper.fromRaw('tag', 'Action');
    final paidTrue = ProductFilterMapper.fromRaw('is_paid', '1');
    final paidFalse = ProductFilterMapper.fromRaw('paid', false);

    expect(tag, isA<TagFilter>());
    expect((tag as TagFilter).tag, 'Action');
    expect(paidTrue, isA<IsPaidFilter>());
    expect((paidTrue as IsPaidFilter).isPaid, isTrue);
    expect((paidFalse as IsPaidFilter).isPaid, isFalse);
  });

  test('maps age aliases and returns UnknownFilter for invalid values', () {
    final age = ProductFilterMapper.fromRaw('age_limit', '16');
    final ageRating = ProductFilterMapper.fromRaw('agerating', 18);
    final invalidAge = ProductFilterMapper.fromRaw('age', 0);
    final unknown = ProductFilterMapper.fromRaw('other', 'x');

    expect(age, isA<AgeLimitFilter>());
    expect((age as AgeLimitFilter).age, 16);
    expect(ageRating, isA<AgeLimitFilter>());
    expect((ageRating as AgeLimitFilter).age, 18);
    expect(invalidAge, isA<UnknownFilter>());
    expect(unknown, isA<UnknownFilter>());
  });
}

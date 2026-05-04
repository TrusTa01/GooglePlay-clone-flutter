import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/features/sections/domain/entities/resolved_section.dart';
import 'package:google_play/features/sections/presentation/viewmodels/section_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kids_age_category_view_model.g.dart';

@riverpod
class KidsAgeCategory extends _$KidsAgeCategory {
  @override
  Future<List<ResolvedSection>> build(String ageKey) async =>
      ref.read(resolvedSectionsProvider(ProductKind.game, ageKey).future);
}

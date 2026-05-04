import 'package:google_play/features/category/domain/use_cases/build_category_overview_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

@riverpod
BuildCategoryOverviewUseCase buildCategoryOverviewUseCase(Ref ref) =>
    const BuildCategoryOverviewUseCase();

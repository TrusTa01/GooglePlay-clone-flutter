import 'package:google_play/features/section_more/domain/use_cases/build_section_more_state_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'di.g.dart';

@riverpod
BuildSectionMoreStateUseCase buildSectionMoreStateUseCase(Ref ref) =>
    const BuildSectionMoreStateUseCase();

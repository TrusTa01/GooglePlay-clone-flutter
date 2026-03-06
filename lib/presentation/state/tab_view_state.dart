import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';

part 'tab_view_state.freezed.dart';

@freezed
class TabViewState with _$TabViewState {
  const factory TabViewState.loading() = _Loading;
  const factory TabViewState.content({
    required List<ResolvedSection> sections,
  }) = _Content;
  const factory TabViewState.error(String message) = _Error;
}

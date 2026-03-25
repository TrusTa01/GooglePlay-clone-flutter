import 'package:google_play/features/events/presentation/viewmodels/ui_models/event_section_ui_model.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_models/event_hero_banner_ui_model.dart';

class ProductEventState {
  final bool isLoading;
  final Object? error;
  final EventHeroBannerUiModel? heroModel;
  final String description;
  final List<EventSectionUiModel> sections;

  const ProductEventState({
    this.isLoading = true,
    this.error,
    this.heroModel,
    this.description = '',
    this.sections = const [],
  });

  ProductEventState copyWith({
    bool? isLoading,
    Object? error,
    bool clearError = false,
    EventHeroBannerUiModel? heroModel,
    String? description,
    List<EventSectionUiModel>? sections,
  }) {
    return ProductEventState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      heroModel: heroModel ?? this.heroModel,
      description: description ?? this.description,
      sections: sections ?? this.sections,
    );
  }
}

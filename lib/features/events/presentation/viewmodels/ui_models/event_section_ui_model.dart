import 'package:google_play/features/sections/presentation/viewmodels/section_payload.dart';

class EventSectionUiModel {
  final String id;
  final String title;
  final String subtitle;
  final SectionPayload payload;

  const EventSectionUiModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.payload,
  });
}

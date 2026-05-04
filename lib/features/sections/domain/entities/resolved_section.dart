import 'package:google_play/core/domain/entities/base_entity.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';

class ResolvedSection {
  final SectionEntity config;
  final List<Entity> items;

  const ResolvedSection({required this.config, required this.items});
}

import 'package:google_play/features/banners/data/mappers/network/action_banner_mapper.dart';
import 'package:google_play/features/banners/data/mappers/network/event_banner_mapper.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

extension BannerDtoMapper on BannerDto {
  BannerEntity toEntity(String locale) {
    return map(
      event: (dto) => dto.toEntity(locale),
      action: (dto) => dto.toEntity(locale),
    );
  }
}

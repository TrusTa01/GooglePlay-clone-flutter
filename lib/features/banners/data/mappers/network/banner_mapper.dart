import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/banners/data/mappers/network/action_banner_mapper.dart';
import 'package:google_play/features/banners/data/mappers/network/event_banner_mapper.dart';
import 'package:google_play/features/banners/data/models/network/banner_dto.dart';
import 'package:google_play/features/banners/domain/entities/banner_entity.dart';

extension BannerDtoMapper on BannerDto {
  BannerEntity toEntity(String locale) {
    final entity = map(
      event: (dto) => dto.toEntity(locale),
      action: (dto) => dto.toEntity(locale),
    );
    FeatureTalker.mapperOut(
      'banners.banner_mapper',
      'BannerDto -> BannerEntity',
      context: {'locale': locale, 'mapped': entity.runtimeType},
    );
    return entity;
  }
}

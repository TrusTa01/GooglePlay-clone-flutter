import 'package:google_play/data/models/banner_dtos/banner_dto.dart';
import 'package:google_play/data/mappers/banner_mappers/action_banner_mapper.dart';
import 'package:google_play/data/mappers/banner_mappers/simple_banner_mapper.dart';
import 'package:google_play/domain/entities/banners/banner_entity.dart';

extension BannerDtoMapper on BannerDto {
  BannerEntity toEntity() {
    return map(
      simple: (dto) => dto.toEntity(),
      action: (dto) => dto.toEntity(),
    );
  }
}


import 'package:google_play/features/banners/domain/entities/banner_entity.dart';
import 'package:google_play/features/banners/domain/repositories/i_banners_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockBannersRepository extends Mock implements IBannersRepository {}

class FakeBannerEntity extends BannerEntity {
  const FakeBannerEntity({required super.id})
    : super(
        type: BannerType.action,
        imageAssetPath: 'banner.png',
        title: 'title',
        topTooltipText: 'tooltip',
        description: 'description',
      );
}

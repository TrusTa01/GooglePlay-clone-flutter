import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/features/product/data/models/network/product_dto.dart';
import 'package:google_play/features/product/domain/entities/developer_entity.dart';

/// Собирает [DeveloperEntity] из плоских полей [GameDto] / [AppDto]
extension GameDeveloperMapper on GameDto {
  DeveloperEntity toDeveloperEntity(String locale) {
    final entity = DeveloperEntity(
      company: developer?.company.display(locale) ?? '',
      address: developer?.address.display(locale) ?? '',
      city: developer?.city.display(locale) ?? '',
      country: developer?.country.display(locale) ?? '',
      phone: developer?.phone ?? '',
      websiteUrl: developer?.websiteUrl ?? '',
      emailSupport: developer?.emailSupport ?? '',
      privacyPolicyUrl: developer?.privacyPolicyUrl ?? '',
    );
    FeatureTalker.mapperOut(
      'product.developer_mapper',
      'GameDto -> DeveloperEntity',
      context: {'id': id, 'locale': locale, 'company': entity.company},
    );
    return entity;
  }
}

extension AppDeveloperMapper on AppDto {
  DeveloperEntity toDeveloperEntity(String locale) {
    final entity = DeveloperEntity(
      company: developer?.company.display(locale) ?? '',
      address: developer?.address.display(locale) ?? '',
      city: developer?.city.display(locale) ?? '',
      country: developer?.country.display(locale) ?? '',
      phone: developer?.phone ?? '',
      websiteUrl: developer?.websiteUrl ?? '',
      emailSupport: developer?.emailSupport ?? '',
      privacyPolicyUrl: developer?.privacyPolicyUrl ?? '',
    );
    FeatureTalker.mapperOut(
      'product.developer_mapper',
      'AppDto -> DeveloperEntity',
      context: {'id': id, 'locale': locale, 'company': entity.company},
    );
    return entity;
  }
}

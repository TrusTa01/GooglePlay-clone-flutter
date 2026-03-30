import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/product/data/models/product_dto.dart';
import 'package:google_play/features/product/domain/entities/developer_entity.dart';

/// Собирает [DeveloperEntity] из плоских полей [GameDto] / [AppDto]
extension GameDeveloperMapper on GameDto {
  DeveloperEntity toDeveloperEntity(String locale) => DeveloperEntity(
    company: developer.company.display(locale),
    address: developer.address.display(locale),
    city: developer.city.display(locale),
    country: developer.country.display(locale),
    phone: developer.phone,
    websiteUrl: developer.websiteUrl,
    emailSupport: developer.emailSupport,
    privacyPolicyUrl: developer.privacyPolicyUrl,
  );
}

extension AppDeveloperMapper on AppDto {
  DeveloperEntity toDeveloperEntity(String locale) => DeveloperEntity(
    company: developer.company.display(locale),
    address: developer.address.display(locale),
    city: developer.city.display(locale),
    country: developer.country.display(locale),
    phone: developer.phone,
    websiteUrl: developer.websiteUrl,
    emailSupport: developer.emailSupport,
    privacyPolicyUrl: developer.privacyPolicyUrl,
  );
}

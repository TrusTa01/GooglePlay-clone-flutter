import 'package:google_play/core/extensions/localized_str_ext.dart';
import 'package:google_play/features/product/data/models/product_dto.dart';
import 'package:google_play/features/product/domain/entities/developer_entity.dart';

/// Собирает [DeveloperEntity] из плоских полей [GameDto] / [AppDto]
extension GameDeveloperMapper on GameDto {
  DeveloperEntity toDeveloperEntity(String locale) => DeveloperEntity(
    company: developerCompany.display(locale),
    address: developerAddress.display(locale),
    city: developerCity.display(locale),
    country: developerCountry.display(locale),
    phone: developerPhone,
    websiteUrl: websiteUrl,
    emailSupport: emailSupport,
    privacyPolicyUrl: privacyPolicyUrl,
  );
}

extension AppDeveloperMapper on AppDto {
  DeveloperEntity toDeveloperEntity(String locale) => DeveloperEntity(
    company: developerCompany.display(locale),
    address: developerAddress.display(locale),
    city: developerCity.display(locale),
    country: developerCountry.display(locale),
    phone: developerPhone,
    websiteUrl: websiteUrl,
    emailSupport: emailSupport,
    privacyPolicyUrl: privacyPolicyUrl,
  );
}

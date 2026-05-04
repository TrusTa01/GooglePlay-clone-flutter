import 'package:google_play/core/local_database/app_database.dart';
import 'package:google_play/features/product/data/constants/product_local_cache_constants.dart';

/// Гарантирует строку в [developers] для FK из кэша, когда API не прислал
/// разработчика ([kPlaceholderDeveloperId]).
Future<void> ensurePlaceholderDeveloperExists(AppDatabase db) async {
  await db.into(db.developers).insertOnConflictUpdate(
    DevelopersCompanion.insert(
      id: kPlaceholderDeveloperId,
      city: const {},
      phone: '',
      address: const {},
      company: const {'en': 'Unknown'},
      country: const {},
      websiteUrl: '',
      emailSupport: '',
      privacyPolicyUrl: '',
    ),
  );
}

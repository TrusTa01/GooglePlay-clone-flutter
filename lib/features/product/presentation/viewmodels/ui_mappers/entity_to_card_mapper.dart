import 'dart:ui';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/features/product/domain/entities/product_entity.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_card_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_mappers/product_state_mapper.dart';
import 'package:google_play/features/product/presentation/viewmodels/ui_models/product_card_ui_model.dart';

ProductCardUiModel mapEntityToCard(
  ProductEntity entity,
  AppLocalizations l10n,
  Locale locale,
) {
  final cardState = const ProductStateMapper().fromEntity(entity, l10n, locale);
  return const ProductCardMapper().mapToProductCardUi(cardState);
}

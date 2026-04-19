import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/presentation/providers/locale_provider.dart';
import 'package:google_play/features/tabs/di/di.dart';
import 'package:google_play/features/tabs/domain/entities/tabs_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'available_tabs.g.dart';

@riverpod
Future<List<TabsEntity>> availableTabs(Ref ref, ProductKind productKind) async {
  final useCase = ref.read(getTabsUseCaseProvider);
  final locale =
      ref.watch(localeProvider) ??
      WidgetsBinding.instance.platformDispatcher.locale;

  return useCase.call(productKind: productKind, locale: locale.languageCode);
}

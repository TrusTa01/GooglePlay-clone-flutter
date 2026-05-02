import 'package:flutter/widgets.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/logging/feature_talker.dart';
import 'package:google_play/core/presentation/providers/locale_provider.dart';
import 'package:google_play/features/sections/di/di.dart';
import 'package:google_play/features/sections/domain/entities/resolved_section.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'section_state.g.dart';

@riverpod
Future<List<ResolvedSection>> resolvedSections(
  Ref ref,
  ProductKind productKind,
  String tabId,
) async {
  final locale =
      ref.watch(localeProvider) ??
      WidgetsBinding.instance.platformDispatcher.locale;
  final useCase = ref.read(resolvedSectionsUseCaseProvider);
  FeatureTalker.providerStart(
    'sections.viewmodel',
    'resolvedSections',
    context: {
      'productKind': productKind.name,
      'tabId': tabId,
      'locale': locale.languageCode,
    },
  );
  final result = await useCase(
    productKind: productKind,
    tabId: tabId,
    locale: locale.languageCode,
  );
  FeatureTalker.providerDone(
    'sections.viewmodel',
    'resolvedSections',
    context: {'productKind': productKind.name, 'count': result.length},
  );
  return result;
}

import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/routes/app_router.dart';

abstract class SectionMoreNavigation {
  static void push(
    BuildContext context, {
    required ProductKind kind,
    required String key,
    required String title,
  }) => switch (kind) {
    ProductKind.app => AppsSectionMoreRoute(
      categoryKey: key,
      title: title,
    ).push(context),
    ProductKind.game => GamesSectionMoreRoute(
      categoryKey: key,
      title: title,
    ).push(context),
    ProductKind.book => BooksSectionMoreRoute(
      categoryKey: key,
      title: title,
    ).push(context),
  };
}

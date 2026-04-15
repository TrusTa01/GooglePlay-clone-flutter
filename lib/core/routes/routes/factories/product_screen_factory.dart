import 'package:flutter/material.dart';
import 'package:google_play/core/domain/entities/product_kind.dart';
import 'package:google_play/core/routes/app_router.dart';

abstract class ProductScreenFactory {
  static void push(
    BuildContext context, {
    required ProductKind kind,
    required String id,
  }) => switch (kind) {
    ProductKind.game => GamesProductRoute(productId: id).push(context),
    ProductKind.app => AppsProductRoute(productId: id).push(context),
    ProductKind.book => BooksProductRoute(productId: id).push(context),
  };
}

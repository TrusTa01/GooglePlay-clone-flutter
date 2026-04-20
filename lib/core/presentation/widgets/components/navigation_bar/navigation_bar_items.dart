import 'package:flutter/material.dart';
import 'package:google_play/core/constants/global_constants.dart';
import 'package:google_play/core/constants/network_images_constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/core/presentation/widgets/components/images/network_image_builders.dart';

List<NavigationDestination> buildNavDestinations(BuildContext context) => [
  NavigationDestination(
    icon: Image.network(
      NetworkImagesConstants.gamepad,
      color: Constants.uiUnselectedColor,
      width: 20,
      height: 20,
      loadingBuilder: NetworkImageBuilders.shimmer(
        width: 20,
        height: 20,
        borderRadius: 4,
      ),
      errorBuilder: NetworkImageBuilders.icon(
        size: 20,
        color: Constants.uiUnselectedColor,
      ),
    ),
    selectedIcon: Image.network(
      NetworkImagesConstants.gamepadOutlined,
      color: Constants.uiSelectedIconColor,
      width: 20,
      height: 20,
      loadingBuilder: NetworkImageBuilders.shimmer(
        width: 20,
        height: 20,
        borderRadius: 4,
      ),
      errorBuilder: NetworkImageBuilders.icon(
        size: 20,
        color: Constants.uiSelectedIconColor,
      ),
    ),
    label: context.l10n.navGames,
  ),
  NavigationDestination(
    icon: Image.network(
      NetworkImagesConstants.app,
      color: Constants.uiUnselectedColor,
      width: 16,
      height: 16,
      loadingBuilder: NetworkImageBuilders.shimmer(
        width: 16,
        height: 16,
        borderRadius: 4,
      ),
      errorBuilder: NetworkImageBuilders.icon(
        size: 16,
        color: Constants.uiUnselectedColor,
      ),
    ),
    selectedIcon: Image.network(
      NetworkImagesConstants.appOutlined,
      color: Constants.uiSelectedIconColor,
      width: 16,
      height: 16,
      loadingBuilder: NetworkImageBuilders.shimmer(
        width: 16,
        height: 16,
        borderRadius: 4,
      ),
      errorBuilder: NetworkImageBuilders.icon(
        size: 16,
        color: Constants.uiSelectedIconColor,
      ),
    ),
    label: context.l10n.navApps,
  ),
  NavigationDestination(
    icon: Icon(Icons.search, color: Constants.uiUnselectedColor),
    selectedIcon: Icon(Icons.search, color: Constants.uiSelectedIconColor),
    label: context.l10n.navSearch,
  ),
  NavigationDestination(
    icon: Icon(Icons.book_outlined, color: Constants.uiUnselectedColor),
    selectedIcon: Icon(Icons.book, color: Constants.uiSelectedIconColor),
    label: context.l10n.navBooks,
  ),
];

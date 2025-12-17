import 'package:flutter/material.dart';

import '../constants/app_bar_constants.dart';
import '../constants/global_constants.dart';

abstract interface class AppBarUtils {
  // Метод построения логотипа
  static Widget buildLogo({
    double height = 32,
    double width = 32,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Image.asset(
        'assets/icons/logo.png',
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) {
          return const Text(
            'GP',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4285F4),
            ),
          );
        },
      ),
    );
  }

  // Метод построения заголовка
  static Widget buildTitle(String? title) {
    if (title != null) {
      return Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight(500),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  // Метод построения leading
  static Widget? buildLeading({
    required BuildContext context,
    Widget? leadingIcon,
    VoidCallback? onLeadingPressed,
    bool showBackButton = false,
  }) {
    if (leadingIcon != null) {
      return IconButton(
        onPressed: onLeadingPressed ?? () {},
        icon: leadingIcon,
      );
    }

    if (showBackButton) {
      return IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onLeadingPressed ?? () => Navigator.pop(context),
      );
    }

    return null;
  }

  // Метод для Row с логотипом и заголовком
  static Widget buildLogoTitleRow({
    required bool showLogo,
    required Widget? title,
  }) {
    return Row(
      children: [
        if (showLogo) buildLogo(),
        const SizedBox(width: 8),
        Expanded(child: buildTitle('')),
      ],
    );
  }

  // Метод построения кастомного инпута для поиска
  static Widget buildSearchContainer({
    required List<Widget>? inputLeading,
    required String searchHint,
    required List<Widget>? inputActions,
  }) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 50,
      decoration: AppBarConstants.searchAppBarBoxDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            ...(inputLeading ?? []),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  searchHint,
                  style: const TextStyle(
                    color: AppBarConstants.searchLabelColor,
                    fontWeight: Constants.defaultFontWeight,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            ...(inputActions ?? []),
          ],
        ),
      ),
    );
  }

  // Метод построения разделителя
  static Widget buildAppBarDivider({required Widget child}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromARGB(31, 0, 0, 0), width: 1.5),
        ),
      ),
      child: child,
    );
  }
}

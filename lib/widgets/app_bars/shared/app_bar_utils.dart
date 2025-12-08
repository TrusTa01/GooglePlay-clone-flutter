import 'package:flutter/material.dart';

class AppBarUtils {
  // Метод построения логотипа
  static Widget buildLogo({
    required String logoAssetPath,
    double height = 32,
    double width = 32,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Image.asset(
        logoAssetPath,
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
          fontWeight: FontWeight.bold,
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
    required String logoAssetPath,
    required String? title,
  }) {
    return Row(
      children: [
        if (showLogo) buildLogo(logoAssetPath: logoAssetPath),
        const SizedBox(width: 8),
        Expanded(child: buildTitle(title)),
      ],
    );
  }

  // static Widget tabsChange(BuildContext context) {
  //   return Expanded(
  //     child: GestureDetector(
  //       onTap: () => setState(() => _selectedIndex = index),
  //     ),
  //   );
  // }
}

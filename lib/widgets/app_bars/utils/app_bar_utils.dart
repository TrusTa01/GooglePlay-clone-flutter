import 'package:flutter/material.dart';

import '../../widgets.dart';

// Логотип
class AppBarLogo extends StatelessWidget {
  final double width;
  final double height;

  const AppBarLogo({super.key, this.width = 32, this.height = 32});

  @override
  Widget build(BuildContext context) {
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
}

// Заголовка
class AppBarTitle extends StatelessWidget {
  final String? title;
  const AppBarTitle({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Text(
        title!,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

// Leading
class AppBarLeading extends StatelessWidget {
  final Widget? leadingIcon;
  final VoidCallback? onLeadingPressed;
  final bool showBackButton;

  const AppBarLeading({
    super.key,
    this.leadingIcon,
    this.onLeadingPressed,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    if (leadingIcon != null) {
      return IconButton(
        onPressed: onLeadingPressed ?? () {},
        icon: leadingIcon!,
      );
    }

    if (showBackButton) {
      return IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onLeadingPressed ?? () => Navigator.pop(context),
      );
    }

    return const SizedBox.shrink();
  }
}

// Row с логотипом и заголовком
class AppBarLogoTitleRow extends StatelessWidget {
  final bool showLogo;
  final Widget? title;

  const AppBarLogoTitleRow({super.key, required this.showLogo, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showLogo) AppBarLogo(),
        const SizedBox(width: 8),
        Expanded(child: AppBarTitle()),
      ],
    );
  }
}

// Кастомный инпут для поиска
class AppBarSearchContainer extends StatelessWidget {
  final List<Widget>? inputLeading;
  final String searchHint;
  final List<Widget>? inputActions;

  const AppBarSearchContainer({
    super.key,
    this.inputLeading,
    required this.searchHint,
    this.inputActions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
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
                  maxLines: 1,
                  style: const TextStyle(
                    color: AppBarConstants.searchLabelColor,
                    fontWeight: Constants.defaultFontWeight,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            if (inputActions != null) ...inputActions!,
          ],
        ),
      ),
    );
  }
}

// Разделитель
class AppBarDivider extends StatelessWidget {
  final Widget child;

  const AppBarDivider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
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

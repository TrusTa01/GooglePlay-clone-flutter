import 'package:flutter/material.dart';

import '../../widgets.dart';

// Логотип
class AppBarLogo extends StatelessWidget {
  final double width;
  final double height;
  final Offset translate;

  const AppBarLogo({
    super.key,
    this.width = 34,
    this.height = 34,
    this.translate = Offset.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-translate.dx, -translate.dy),
      child: Image.asset(
        'assets/icons/logo.png',
        height: height,
        width: width,
        errorBuilder: (context, error, stackTrace) {
          return const Text(
            'GP',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Constants.googleBlue,
            ),
          );
        },
      ),
    );
  }
}

// Заголовок
class AppBarTitle extends StatelessWidget {
  final String? title;
  const AppBarTitle({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          title!,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
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
        if (showLogo) const AppBarLogo(translate: Offset(8, 0)),
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
                    fontSize: 18,
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
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.35), width: 1),
        ),
      ),
      child: child,
    );
  }
}

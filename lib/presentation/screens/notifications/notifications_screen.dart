import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SimpleSliverAppBar(
              showBackButton: true,
              onLeadingPressed: () => Navigator.pop(context),
              title: AppBarTitle(title: l10n.notificationsTitle),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/notifications/verify.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      l10n.notificationsEmptyTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: Constants.defaultFontWeight,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      l10n.notificationsEmptyDescription,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SimpleSliverAppBar(
              showBackButton: true,
              onLeadingPressed: () => Navigator.pop(context),
              title: AppBarTitle(title: 'Уведомления и предложения'),
            ),
            SliverToBoxAdapter(
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
                      'Ничего нет',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: Constants.defaultFontWeight,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Здесь будут появляться уведомления о вашем\n аккаунте Google Play.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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

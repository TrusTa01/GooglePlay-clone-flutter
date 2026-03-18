import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/core/extensions/l10n_extension.dart';
import 'package:google_play/presentation/screens/product/utils/product_app_bar_leading.dart';
import 'package:google_play/presentation/viewmodels/product/product_state.dart';
import 'package:google_play/presentation/widgets/widgets.dart';

class PermissionsScreen extends StatelessWidget {
  final ProductState state;

  const PermissionsScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 1,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Constants.sliderMaxContentWidth,
          ),

          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SimpleSliverAppBar(
                  showBackButton: true,
                  showLogo: false,
                  titleLeading: ProductAppBarLeading(state: state),
                  title: Text(
                    state.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: Constants.defaultFontWeight,
                    ),
                  ),
                  subtitle: Text(
                    context.l10n.permissionsTitle,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  onLeadingPressed: () => Navigator.pop(context),
                ),

                // Заголовок списка
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 10),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      context.l10n.permissionsForVersion(state.version),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Сам список разрешений
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  sliver: SliverList.builder(
                    itemCount: state.permissions.length,
                    itemBuilder: (context, index) {
                      return _BulletItem(
                        permission: state.permissions[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BulletItem extends StatelessWidget {
  final String permission;

  const _BulletItem({required this.permission});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(" • ", style: TextStyle(fontSize: 14)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              permission,
              style: const TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}

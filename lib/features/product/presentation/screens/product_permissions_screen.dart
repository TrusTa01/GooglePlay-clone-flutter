import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/core/extensions/l10n_ext.dart';
import 'package:google_play/features/product/presentation/screens/utils/product_app_bar_leading.dart';
import 'package:google_play/features/product/presentation/viewmodels/product_view_model.dart';
import 'package:google_play/presentation/widgets/app_bars/app_bar/simple_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductPermissionsScreen extends ConsumerWidget {
  final String productId;

  const ProductPermissionsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productViewModelProvider(productId));

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
                  onLeadingPressed: () => context.pop(),
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

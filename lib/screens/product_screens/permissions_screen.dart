import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';
import 'utils/product_app_bar_leading.dart';

class PermissionsScreen extends StatelessWidget {
  final Product product;

  const PermissionsScreen({super.key, required this.product});

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
                  forceShowDivider: true,
                  titleLeading: ProductAppBarLeading(product: product),
                  title: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: Constants.defaultFontWeight,
                    ),
                  ),
                  subtitle: const Text(
                    'Разрешения для приложения',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  onLeadingPressed: () => Navigator.pop(context),
                ),
            
                // Заголовок списка
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(22, 20, 22, 10),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Возможные разрешения для версии ${product.version}',
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
                    itemCount: product.permissions.length,
                    itemBuilder: (context, index) {
                      return _BulletItem(permission: product.permissions[index]);
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

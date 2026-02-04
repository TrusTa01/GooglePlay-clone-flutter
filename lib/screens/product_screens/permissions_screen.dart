import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../widgets/widgets.dart';

class PermissionsScreen extends StatelessWidget {
  final Product product;

  const PermissionsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductAppBar(
        product: product,
        subtitle: 'Разрешения для приложения',
      ),

      body: Center(
        heightFactor: 1,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: product.permissions.length + 1, // +1 для заголовка
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Возможные разрешения для версии ${product.version}',
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }
              return _BulletItem(
                permission: product.permissions[index - 1],
              );
            },
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
        crossAxisAlignment:
            CrossAxisAlignment.center,
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

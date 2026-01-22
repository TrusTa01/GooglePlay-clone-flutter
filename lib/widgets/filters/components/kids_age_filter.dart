import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/screens/screens.dart';
import '/widgets/widgets.dart';
import '/providers/providers.dart';
import '/services/section_builder_service.dart';
import '/services/product_query_service.dart';

class KidsAgeFilter extends StatelessWidget {
  final String label;

  const KidsAgeFilter({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final productsProvider = context.read<ProductsProvider>();
    
    // Создаем SectionBuilderService для построения секций
    final sectionBuilder = SectionBuilderService(
      allProducts: productsProvider.allProducts,
      allBanners: productsProvider.allBanners,
      recommendations: productsProvider.recommendations,
      pageConfigs: productsProvider.pageConfigs,
      queryService: ProductQueryService(),
    );
    
    final sections = sectionBuilder.buildKidsCategoryPage(label);

    return CustomFilterChip(
      label: label,
      onSelected: () => Navigator.of(
        context,
      ).push(MaterialPageRoute(
        builder: (context) => KidsAgeCategoryScreen(
          ageLabel: label,
          sections: sections,
        ),
      )),
    );
  }
}

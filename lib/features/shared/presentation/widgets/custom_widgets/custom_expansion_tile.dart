import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/features/product/presentation/screens/utils/product_support_data.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';

class CustomExpansionTile extends HookWidget {
  final Widget title;
  final List<SupportItem> items;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final customIcon = useState<bool>(false);
    final controller = useMemoized(() => ExpansibleController(), []);
    useEffect(() => controller.dispose);

    return ExpansionTile(
      controller: controller,
      shape: Border(),
      tilePadding: EdgeInsets.zero,
      title: title,
      trailing: CustomIconButton(
        onTap: () {
          if (customIcon.value) {
            controller.collapse();
          } else {
            controller.expand();
          }
        },
        icon: customIcon.value ? Icons.expand_less : Icons.expand_more,
        iconSize: 22,
      ),
      children: items.map((item) => _buildItem(item)).toList(),
      onExpansionChanged: (bool expanded) => customIcon.value = expanded,
    );
  }

  Widget _buildItem(SupportItem item) {
    switch (item.type) {
      case SupportItemType.link:
        return CustomTextButton(
          icon: item.icon,
          title: item.title,
          subtitle: item.subtitle,
          onTap: item.onTap,
          iconSize: 18,
          titleFontSize: 14,
          subtitleFontSize: 14,
        );

      case SupportItemType.sectionHeader:
        return Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.title ?? '',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: Constants.defaultFontWeight,
                color: Colors.black,
              ),
            ),
          ),
        );

      case SupportItemType.infoText:
        return Align(
          alignment: Alignment.centerLeft,
          child: SelectableText(
            item.title ?? '',
            style: const TextStyle(fontSize: 14, color: Colors.black),
            cursorColor: Constants.googleBlue,
          ),
        );
    }
  }
}

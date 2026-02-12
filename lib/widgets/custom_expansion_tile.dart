import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';
import 'package:google_play/screens/product_screens/utils/product_support_data.dart';
import 'package:google_play/widgets/widgets.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget title;
  final List<SupportItem> items;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  CustomExpansionTileState createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  final ExpansibleController _controller = ExpansibleController();
  bool customIcon = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      controller: _controller,
      shape: Border(),
      tilePadding: EdgeInsets.zero,
      title: widget.title,
      trailing: CustomIconButton(
        onTap: () {
          if (customIcon) {
            _controller.collapse();
          } else {
            _controller.expand();
          }
        },
        icon: customIcon ? Icons.expand_less : Icons.expand_more,
        iconSize: 22,
      ),
      children: widget.items.map((item) => _buildItem(item)).toList(),
      onExpansionChanged: (bool expanded) {
        setState(() => customIcon = expanded);
      },
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
        return InkWell(
          onTap: item.onTap,
          borderRadius: BorderRadius.circular(8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              item.title ?? '',
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  final bool isPaid;
  final String? price;
  final VoidCallback? onPressed;
  final String defaultButtonText;
  final bool isOutlined;
  final bool isActionRow;

  const CustomElevatedButton({
    super.key,
    required this.isPaid,
    this.price,
    this.onPressed,
    required this.defaultButtonText,
    this.isOutlined = false,
    this.isActionRow = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.white : Constants.googleBlue,
        foregroundColor: isOutlined ? Constants.googleBlue : Colors.white,
        elevation: 0,
        minimumSize: const Size(0, 32),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        tapTargetSize: MaterialTapTargetSize
            .shrinkWrap, // Область нажатия кнопки не больше ее размера
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isOutlined ? Constants.defaultTextColor : Colors.transparent,
            width: isOutlined ? 1 : 0,
          ),
        ),
      ),
      onPressed: onPressed ?? () {},
      child: Padding(
        padding: EdgeInsets.all(isActionRow ? 0 : 8),
        child: Text(
          isPaid ? price.toString() : defaultButtonText,
          style: TextStyle(fontWeight: Constants.defaultFontWeight, fontSize: 13),
        ),
      ),
    );
  }
}

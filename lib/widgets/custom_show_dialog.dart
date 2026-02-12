import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

class AlertDialogs {
  static Future<T?> showAlertDialog<T>({
    required BuildContext context,
    required String title,
    required String content,
    required String detailsText,
    required String confirmText,
    required VoidCallback onDetails,
  }) {
    return showDialog<T>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: Text(
          title,
          style: const TextStyle(
            color: Constants.defaultTextColor,
            fontSize: 16,
            fontWeight: Constants.defaultFontWeight,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(color: Constants.defaultTextColor, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: Text(
              detailsText,
              style: const TextStyle(color: Constants.googleBlue, fontWeight: Constants.defaultFontWeight),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
            },
            child: Text(
              confirmText,
              style: const TextStyle(color: Constants.googleBlue, fontWeight: Constants.defaultFontWeight),
            ),
          ),
        ],
      ),
    );
  }
}

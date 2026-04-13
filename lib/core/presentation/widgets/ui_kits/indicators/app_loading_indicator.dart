import 'package:flutter/material.dart';
import 'package:google_play/core/constants/global_constants.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(backgroundColor: Constants.googleBlue),
    );
  }
}

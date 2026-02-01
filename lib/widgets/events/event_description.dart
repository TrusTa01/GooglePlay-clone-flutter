import 'package:flutter/material.dart';

import '/core/constants/global_constants.dart';

class EventDescription extends StatelessWidget {
  final String text;

  const EventDescription({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.horizontalContentPadding.copyWith(top: 20, bottom: 10),
      child: Text(
        text,
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18,
          height: 1.5,
          fontWeight: FontWeight.w600,
          color: Colors.black.withValues(alpha: 0.75),
        ),
      ),
    );
  }
}

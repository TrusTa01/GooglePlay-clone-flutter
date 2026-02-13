import 'package:flutter/material.dart';
import 'package:google_play/core/constants.dart';

class EventDescription extends StatelessWidget {
  final String text;

  const EventDescription({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Constants.sliderMaxContentWidth),
        child: Padding(
          padding: Constants.horizontalContentPadding.copyWith(top: 20, bottom: 10),
          child: Text(
            text,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18,
              height: 1.5,
              fontWeight: Constants.defaultFontWeight,
              color: Colors.black.withValues(alpha: 0.75),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EventDescription extends StatelessWidget {
  final String text;

  const EventDescription({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 10),
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

import 'package:flutter/material.dart';
import 'package:google_play/core/shimers/shimer_box.dart';

class GamePreviewSkeleton extends StatelessWidget {
  const GamePreviewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 210,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(right: 12),
              child: ShimmerBox(width: 140, height: 210, borderRadius: 16),
            ),
          ),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: ShimmerBox(width: double.infinity, height: 50, borderRadius: 12),
        ),
      ],
    );
  }
}
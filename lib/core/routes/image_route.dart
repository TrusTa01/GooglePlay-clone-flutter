import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_play/presentation/widgets/full_screen_image.dart';

part 'image_route.g.dart';

@TypedGoRoute<ImageRoute>(path: '/image')
class ImageRoute extends GoRouteData with $ImageRoute {
  final String imageUrl;
  final String heroTag;

  const ImageRoute({required this.imageUrl, required this.heroTag});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FullScreenImage(imageUrl: imageUrl, heroTag: heroTag);
  }
}

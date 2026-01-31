import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import '/screens/screens.dart';
import '/models/models.dart';
import '/providers/products_provider.dart';
import '../../widgets.dart';

class BannerSection extends StatefulWidget {
  final List<AppBanner> banners;
  final BannerType type;
  final double heightFactor;
  final String title;
  final String subtitle;
  final bool showButton;
  final int? maxItems;

  const BannerSection({
    super.key,
    required this.banners,
    this.type = BannerType.simple,
    this.heightFactor = 3.5,
    required this.title,
    this.subtitle = '',
    required this.showButton,
    this.maxItems,
  });

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  late final PageController _controller;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.92, initialPage: 0);
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    final displayBannersLength =
        widget.maxItems != null && widget.maxItems! < widget.banners.length
        ? widget.maxItems!
        : widget.banners.length;
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (_controller.hasClients) {
        _currentPage++;
        if (_currentPage >= displayBannersLength) {
          _currentPage = 0;
        }
        _controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _handleBannerTap(BuildContext context, AppBanner banner) {
    debugPrint('Banner tapped: ${banner.id}, type: ${banner.runtimeType}');

    if (banner is ActionBanner) {
      debugPrint(
        'ActionBanner detected, navigating to product: ${banner.productId}',
      );
      // Navigate to product page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductPageScreen(productId: banner.productId),
        ),
      );
    } else if (banner is SimpleBanner) {
      debugPrint(
        'SimpleBanner detected, eventId: ${banner.eventId}, eventCategory: ${banner.eventCategory}',
      );

      if (banner.eventId != null) {
        // Navigate to event screen with sections
        final provider = context.read<ProductsProvider>();
        final sections = provider.getEventSections(banner);

        debugPrint('Event sections count: ${sections.length}');

        if (sections.isEmpty) {
          debugPrint('No sections available for event ${banner.eventId}');
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductEventScreen(eventBanner: banner, sections: sections),
          ),
        );
      } else {
        debugPrint('SimpleBanner ${banner.id} has no eventId');
      }
    } else {
      // Default simple banner without event - show a placeholder or do nothing
      debugPrint('Banner ${banner.id} has no action or event');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    final double adaptiveHeight =
        MediaQuery.of(context).size.height / widget.heightFactor;

    final displayBanners =
        widget.maxItems != null && widget.maxItems! < widget.banners.length
        ? widget.banners.sublist(0, widget.maxItems!)
        : widget.banners;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty)
          ProductSectionHeader(
            title: widget.title,
            subtitle: widget.subtitle,
            onTap: () {
              debugPrint('Banner section header tapped - no action');
            },
            showButton: false,
          ),
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollStartNotification) {
              _timer?.cancel();
            } else if (notification is ScrollEndNotification) {
              _startTimer();
            }
            return true;
          },
          child: SizedBox(
            height: adaptiveHeight,
            child: PageView.builder(
              key: PageStorageKey('banner_${widget.type.toString()}'),
              onPageChanged: (index) => _currentPage = index,
              scrollDirection: Axis.horizontal,
              controller: _controller,
              clipBehavior: Clip
                  .none, // Элементы будут визуально выезжать за пределы контейнера
              itemCount: displayBanners.length,
              itemBuilder: (context, index) {
                final banner = displayBanners[index];
                return BannerItem(
                  banner: banner,
                  type: widget.type,
                  onTap: () => _handleBannerTap(context, banner),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

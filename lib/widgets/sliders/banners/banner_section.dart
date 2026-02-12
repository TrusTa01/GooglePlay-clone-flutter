import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/screens/screens.dart';
import '/models/models.dart';
import '/providers/products_provider.dart';
import '../../widgets.dart';
import 'utils/banner_layout_config.dart';

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

class _BannerSectionState extends State<BannerSection>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  PageController? _controller;
  Timer? _timer;
  int _currentPage = 1;
  double _lastViewportFraction = 0;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller?.dispose();
    super.dispose();
  }

  void _updateController(double viewportFraction) {
    if (_controller == null || _lastViewportFraction != viewportFraction) {
      // Сохраняем текущую реальную позицию перед dispose
      int currentRealPage = _currentPage;
      if (_controller != null && _controller!.hasClients) {
        currentRealPage = _controller!.page?.round() ?? _currentPage;
      }
      
      _controller?.dispose();
      _lastViewportFraction = viewportFraction;
      _controller = PageController(
        viewportFraction: viewportFraction,
        initialPage: currentRealPage,
      );
      _currentPage = currentRealPage;
    }
  }

  void _startTimer() {
    _timer?.cancel();
    if (!_isVisible) return; // Не запускаем таймер если виджет не видим

    final displayBannersLength =
        widget.maxItems != null && widget.maxItems! < widget.banners.length
        ? widget.maxItems!
        : widget.banners.length;
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (_controller != null && _controller!.hasClients && _isVisible) {
        _currentPage++;
        if (_currentPage >= displayBannersLength - 1) {
          _currentPage = 1;
        }
        _controller!.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    final isVisible =
        info.visibleFraction > 0.1; // Считаем видимым если видно хотя бы 10%
    if (_isVisible != isVisible) {
      _isVisible = isVisible;
      if (isVisible) {
        // Синхронизируем _currentPage с реальной позицией PageView БЕЗ анимации
        if (_controller != null && _controller!.hasClients) {
          final realPage = _controller!.page?.round() ?? 0;
          _currentPage = realPage;
          debugPrint('Banner became visible, synced to page: $_currentPage');
        }
        _startTimer();
      } else {
        _timer?.cancel();
        debugPrint('Banner hidden, timer cancelled');
      }
    }
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
    super.build(context);
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    final screenHeight = MediaQuery.of(context).size.height;

    final displayBanners =
        widget.maxItems != null && widget.maxItems! < widget.banners.length
        ? widget.banners.sublist(0, widget.maxItems!)
        : widget.banners;

    final double maxContentWidth = Constants.sliderMaxContentWidth;

    return VisibilityDetector(
      key: Key('banner_section_${widget.title}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final config = getBannerLayoutConfigForWidth(width);
              _updateController(config.viewportFraction);

              debugPrint(
                'Banner: width=$width, viewport=${config.viewportFraction}, height=${config.heightFactor}',
              );

              final adaptiveHeight = screenHeight / config.heightFactor;

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
                      padding: EdgeInsets.symmetric(
                        horizontal: config.horizontalPadding,
                      ).copyWith(top: 10, bottom: 20),
                      showButton: false,
                    ),
                  Padding(
                    padding: EdgeInsets.only(left: width > 1000 ? 23 : 0),
                    child: NotificationListener<ScrollNotification>(
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
                          key: ValueKey(
                            'banner_${widget.type}_${config.viewportFraction}',
                          ),
                          onPageChanged: (index) => _currentPage = index,
                          scrollDirection: Axis.horizontal,
                          controller: _controller,
                          itemCount: displayBanners.length,
                          itemBuilder: (context, index) {
                            final banner = displayBanners[index];
                            return BannerItem(
                              banner: banner,
                              type: widget.type,
                              horizontalPadding: config.bannerPadding,
                              onTap: () => _handleBannerTap(context, banner),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

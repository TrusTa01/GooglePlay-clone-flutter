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

// Класс для хранения адаптивных параметров баннера
class _BannerLayoutConfig {
  final double viewportFraction;
  final double heightFactor;
  final double bannerPadding;
  final double horizontalPadding;

  const _BannerLayoutConfig({
    required this.viewportFraction,
    required this.heightFactor,
    required this.bannerPadding,
    required this.horizontalPadding,
  });
}

class _BannerSectionState extends State<BannerSection> {
  PageController? _controller;
  Timer? _timer;
  int _currentPage = 0;
  double _lastViewportFraction = 0;

  // Breakpoints и их конфигурации (от меньшего к большему)
  static const List<(int, _BannerLayoutConfig)> _breakpoints = [
    (0, _BannerLayoutConfig(     // < 400
      viewportFraction: 0.92,
      heightFactor: 3.5,
      bannerPadding: 6,
      horizontalPadding: 16,
    )),
    (400, _BannerLayoutConfig(   // 400-500
      viewportFraction: 0.88,
      heightFactor: 3.2,
      bannerPadding: 8,
      horizontalPadding: 18,
    )),
    (500, _BannerLayoutConfig(   // 500-600
      viewportFraction: 0.80,
      heightFactor: 2.9,
      bannerPadding: 12,
      horizontalPadding: 22,
    )),
    (600, _BannerLayoutConfig(   // 600-800
      viewportFraction: 0.70,
      heightFactor: 2.6,
      bannerPadding: 16,
      horizontalPadding: 28,
    )),
    (800, _BannerLayoutConfig(   // 800-1000
      viewportFraction: 0.55,
      heightFactor: 2.6,
      bannerPadding: 20,
      horizontalPadding: 36,
    )),
    (1000, _BannerLayoutConfig(  // > 1000
      viewportFraction: 0.45,
      heightFactor: 2.6,
      bannerPadding: 24,
      horizontalPadding: 44,
    )),
  ];

  // Получить конфигурацию для текущей ширины
  _BannerLayoutConfig _getConfig(double width) {
    _BannerLayoutConfig config = _breakpoints.first.$2;
    for (final (breakpoint, cfg) in _breakpoints) {
      if (width >= breakpoint) {
        config = cfg;
      } else {
        break;
      }
    }
    return config;
  }

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
      _controller?.dispose();
      _lastViewportFraction = viewportFraction;
      _controller = PageController(
        viewportFraction: viewportFraction,
        initialPage: _currentPage,
      );
    }
  }

  void _startTimer() {
    _timer?.cancel();
    final displayBannersLength =
        widget.maxItems != null && widget.maxItems! < widget.banners.length
        ? widget.maxItems!
        : widget.banners.length;
    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (_controller != null && _controller!.hasClients) {
        _currentPage++;
        if (_currentPage >= displayBannersLength) {
          _currentPage = 0;
        }
        _controller!.animateToPage(
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

  // Константы для расчёта maxContentWidth
  static const double _cardWidth = 115;
  static const double _cardMargin = 12;
  static const int _maxVisibleItems = 8;

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink();

    final screenHeight = MediaQuery.of(context).size.height;

    final displayBanners =
        widget.maxItems != null && widget.maxItems! < widget.banners.length
        ? widget.banners.sublist(0, widget.maxItems!)
        : widget.banners;

    // Рассчитываем максимальную ширину контента
    final double horizontalPadding =
        Constants.horizontalContentPadding.horizontal;
    final double maxContentWidth =
        _maxVisibleItems * _cardWidth +
        (_maxVisibleItems - 1.5) * _cardMargin +
        horizontalPadding;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxContentWidth),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final config = _getConfig(width);
            _updateController(config.viewportFraction);
            
            debugPrint('Banner: width=$width, viewport=${config.viewportFraction}, height=${config.heightFactor}');

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
                    padding: EdgeInsets.symmetric(horizontal: config.horizontalPadding).copyWith(
                      top: 10,
                      bottom: 20,
                    ),
                    showButton: false,
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width > 1000 ? config.horizontalPadding : 0,
                  ),
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
                        key: ValueKey('banner_${widget.type}_${config.viewportFraction}'),
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
    );
  }
}

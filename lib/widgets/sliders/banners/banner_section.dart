import 'package:flutter/material.dart';
import 'dart:async';

import '/screens/screens.dart';
import '/models/models.dart';
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductEventScreen()),
            ),
            padding: const EdgeInsets.fromLTRB(22, 10, 22, 20),
            showButton: widget.showButton,
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
              itemCount: displayBanners.length,
              itemBuilder: (context, index) {
                final banner = displayBanners[index];
                final actionBanner = banner is ActionBanner ? banner : null;
                return BannerItem(
                  banner: banner,
                  type: widget.type,
                  onTap: actionBanner != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPageScreen(
                                productId: actionBanner.productId,
                              ),
                            ),
                          );
                        }
                      : () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductEventScreen(),
                          ),
                        ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

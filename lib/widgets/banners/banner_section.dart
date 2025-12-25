import 'package:flutter/material.dart';
import '/models/models.dart';
import 'dart:async';

import '../widgets.dart';

class BannerSection extends StatefulWidget {
  final List<AppBanner> banners;
  final BannerType type;
  final double heightFactor;

  const BannerSection({
    super.key,
    required this.banners,
    this.type = BannerType.simple,
    this.heightFactor = 3.5,
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
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_controller.hasClients) {
        _currentPage++;
        if (_currentPage >= widget.banners.length) {
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
    final double adaptiveHeight =
        MediaQuery.of(context).size.height / widget.heightFactor;

    return NotificationListener<ScrollNotification>(
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
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: PageView.builder(
            key: PageStorageKey('banner_${widget.type.toString()}'),
            onPageChanged: (index) => _currentPage = index,
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: widget.banners.length,
            itemBuilder: (context, index) {
              return BannerItem(banner: widget.banners[index], type: widget.type);
            },
          ),
        ),
      ),
    );
  }
}

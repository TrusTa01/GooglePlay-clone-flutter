import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:google_play/core/constants/constants.dart';
import 'package:google_play/features/banners/presentation/view_models/ui_models/banner_item_ui_model.dart';
import 'package:google_play/features/shared/presentation/widgets/widgets.dart';
import 'package:google_play/features/banners/presentation/widgets/configs/banner_layout_config.dart';

class BannerSection extends HookWidget {
  final List<BannerItemUiModel> banners;
  final double heightFactor;
  final String title;
  final String subtitle;
  final int? maxItems;
  final ValueChanged<BannerItemUiModel>? onBannerTap;

  const BannerSection({
    super.key,
    required this.banners,
    this.heightFactor = 3.5,
    required this.title,
    this.subtitle = '',
    this.maxItems,
    this.onBannerTap,
  });

  @override
  Widget build(BuildContext context) {
    // Сохранение состояния при скролле списка
    useAutomaticKeepAlive();

    if (banners.isEmpty) return const SizedBox.shrink();

    // Состояния
    final currentPage = useState(1);
    final isVisible = useState(true);
    final bannersCount = maxItems != null && maxItems! < banners.length
        ? maxItems!
        : banners.length;

    // Адаптивность
    final screenHeight = MediaQuery.sizeOf(context).height;
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final contentWidth = viewportWidth.clamp(
      0.0,
      Constants.sliderMaxContentWidth,
    );
    final config = getBannerLayoutConfigForWidth(contentWidth);

    // Контроллер
    final controller = useMemoized(
      () => PageController(
        viewportFraction: config.viewportFraction,
        initialPage: currentPage.value,
      ),
      [config.viewportFraction],
    );
    useEffect(() => controller.dispose, [controller]);

    // Таймер (Автопрокрутка)
    // useEffect запустится заново, если изменится контроллер, видимость или кол-во баннеров
    useEffect(() {
      if (!isVisible.value) return null;

      final timer = Timer.periodic(const Duration(seconds: 7), (timer) {
        if (controller.hasClients) {
          int nextPage = currentPage.value + 1;
          if (nextPage >= bannersCount - 1) {
            nextPage = 1;
          }
          currentPage.value = nextPage;
          controller.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeInOutCubic,
          );
        }
      });

      return timer.cancel; // Чистим таймер автоматически!
    }, [controller, isVisible.value, bannersCount]);

    return VisibilityDetector(
      key: Key('banner_section_$title'),
      onVisibilityChanged: (info) {
        isVisible.value = info.visibleFraction > 0.1;
      },
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Constants.sliderMaxContentWidth,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title.isNotEmpty)
                ProductSectionHeader(
                  title: title,
                  subtitle: subtitle,
                  onTap: () {
                    debugPrint('Banner section header tapped - no action');
                  },
                  padding: EdgeInsets.symmetric(
                    horizontal: config.horizontalPadding,
                  ).copyWith(top: 10, bottom: 20),
                  showButton: false,
                ),
              Padding(
                padding: EdgeInsets.only(left: contentWidth > 1000 ? 23 : 0),
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    // Пауза таймера при ручном скролле
                    if (notification is ScrollStartNotification) {
                      isVisible.value = false;
                    } else if (notification is ScrollEndNotification) {
                      isVisible.value = true;
                    }
                    return true;
                  },
                  child: SizedBox(
                    height: screenHeight / config.heightFactor,
                    child: PageView.builder(
                      key: ValueKey('banner_${config.viewportFraction}'),
                      onPageChanged: (index) => currentPage.value = index,
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      itemCount: bannersCount,
                      itemBuilder: (context, index) {
                        final banner = banners[index];
                        return BannerItem(
                          key: ValueKey(banner.id),
                          model: banner,
                          horizontalPadding: config.bannerPadding,
                          onTap: onBannerTap != null
                              ? () => onBannerTap!(banner)
                              : null,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_play/core/shimmers/product_slider_skeleton.dart';
import 'package:google_play/domain/usecases/sections/resolve_section_usecase.dart';
import 'package:google_play/presentation/widgets/sections/section_widget_builder.dart';
import 'package:google_play/presentation/widgets/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResolvedSectionsView extends StatelessWidget {
  final AsyncValue<List<ResolvedSection>> sectionState;
  final bool isSliver;
  final String storageId;
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const ResolvedSectionsView({
    super.key,
    required this.sectionState,
    required this.isSliver,
    required this.storageId,
    this.onProductTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return sectionState.when(
      loading: () => _BuildLoading(isSliver: isSliver),
      error: (error, stack) => _BuildError(error: error, isSliver: isSliver),
      data: (sections) => sections.isEmpty
          ? _BuildEmpty(isSliver: isSliver)
          : _BuildData(
              sections: sections,
              isSliver: isSliver,
              storageId: storageId,
              onProductTap: onProductTap,
              onSeeAllTap: onSeeAllTap,
            ),
    );
  }
}

class _BuildLoading extends StatelessWidget {
  final bool isSliver;

  const _BuildLoading({this.isSliver = false});

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SliverList.builder(itemCount: 5, itemBuilder: itemBuilder)
        : ListView.builder(
            primary: false,
            itemCount: 5,
            itemBuilder: itemBuilder,
          );
  }

  Widget itemBuilder(BuildContext context, int index) => const Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: ProductSliderSkeleton(),
  );
}

class _BuildError extends StatelessWidget {
  final Object error;
  final bool isSliver;

  const _BuildError({required this.error, this.isSliver = false});

  @override
  Widget build(BuildContext context) {
    debugPrint('[ResolvedSectionsView] skip sections: $error');
    return isSliver
        ? const SliverToBoxAdapter(child: SizedBox.shrink())
        : const SizedBox.shrink();
  }
}

class _BuildData extends StatelessWidget {
  final List<ResolvedSection> sections;
  final bool isSliver;
  final String storageId;
  final ValueChanged<String>? onProductTap;
  final OnSeeAllTap? onSeeAllTap;

  const _BuildData({
    required this.sections,
    required this.storageId,
    this.isSliver = false,
    this.onProductTap,
    this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? SectionWidgetBuilder.asSliver(
            sections: sections,
            storageId: storageId,
            onProductTap: onProductTap,
            onSeeAllTap: onSeeAllTap,
          )
        : SectionWidgetBuilder(
            sections: sections,
            isSliver: false,
            storageId: storageId,
            onProductTap: onProductTap,
            onSeeAllTap: onSeeAllTap,
          );
  }
}

class _BuildEmpty extends StatelessWidget {
  final bool isSliver;

  const _BuildEmpty({this.isSliver = false});

  @override
  Widget build(BuildContext context) {
    return isSliver
        ? const SliverToBoxAdapter(child: SizedBox.shrink())
        : const SizedBox.shrink();
  }
}

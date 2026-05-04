import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/base_entity.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/core/presentation/widgets/shimmers/product_slider_skeleton.dart';
import 'package:google_play/features/sections/domain/entities/resolved_section.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';
import 'package:google_play/features/sections/presentation/widgets/resolved_sections_view.dart';
import 'package:google_play/features/sections/presentation/widgets/section_widget_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DummyEntity extends Entity {
  const DummyEntity({required super.id});
}

void main() {
  Widget app(Widget child) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(body: child),
    );
  }

  testWidgets('renders loading placeholders in loading state', (tester) async {
    await tester.pumpWidget(
      app(
        const ResolvedSectionsView(
          sectionState: AsyncValue.loading(),
          isSliver: false,
          storageId: 'home',
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(ListView), findsWidgets);
    expect(find.byType(ProductSliderSkeleton), findsWidgets);
  });

  testWidgets('renders empty widget on error', (tester) async {
    await tester.pumpWidget(
      app(
        ResolvedSectionsView(
          sectionState: AsyncValue.error(Exception('boom'), StackTrace.current),
          isSliver: false,
          storageId: 'home',
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(SectionWidgetBuilder), findsNothing);
    expect(find.byType(ProductSliderSkeleton), findsNothing);
  });

  testWidgets('renders empty widget when data is empty', (tester) async {
    await tester.pumpWidget(
      app(
        const ResolvedSectionsView(
          sectionState: AsyncValue.data([]),
          isSliver: false,
          storageId: 'home',
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(SectionWidgetBuilder), findsNothing);
  });

  testWidgets('renders SectionWidgetBuilder when sections are present', (
    tester,
  ) async {
    final sections = [
      const ResolvedSection(
        config: SectionEntity(
          id: 's-1',
          tabKey: 'for_you',
          sectionType: SectionLayoutKind.unknown,
          dataSource: UnknownSource(),
          sortOrder: 1,
          contentType: 'unknown',
        ),
        items: [DummyEntity(id: 'x-1')],
      ),
    ];

    await tester.pumpWidget(
      app(
        ResolvedSectionsView(
          sectionState: AsyncValue.data(sections),
          isSliver: false,
          storageId: 'home',
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(SectionWidgetBuilder), findsOneWidget);
  });
}

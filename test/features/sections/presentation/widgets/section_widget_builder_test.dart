import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_play/core/domain/entities/base_entity.dart';
import 'package:google_play/core/l10n/gen/app_localizations.dart';
import 'package:google_play/core/presentation/widgets/widgets.dart';
import 'package:google_play/features/sections/domain/entities/resolved_section.dart';
import 'package:google_play/features/sections/domain/entities/section_data_source.dart';
import 'package:google_play/features/sections/domain/entities/section_layout_kind_enum.dart';
import 'package:google_play/features/sections/domain/entities/sections_entity.dart';

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

  testWidgets('builds list mode with EmptyPayload fallback', (tester) async {
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
      app(SectionWidgetBuilder(sections: sections, storageId: 'home')),
    );
    await tester.pump();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(BannerSection), findsNothing);
    expect(find.byType(ProductCarousel), findsNothing);
    expect(find.byType(ProductGrid), findsNothing);
  });

  testWidgets('asSliver constructor builds in CustomScrollView', (
    tester,
  ) async {
    final sections = [
      const ResolvedSection(
        config: SectionEntity(
          id: 's-2',
          tabKey: 'for_you',
          sectionType: SectionLayoutKind.unknown,
          dataSource: UnknownSource(),
          sortOrder: 1,
          contentType: 'unknown',
        ),
        items: [DummyEntity(id: 'x-2')],
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: CustomScrollView(
          slivers: [
            SectionWidgetBuilder.asSliver(
              sections: sections,
              storageId: 'home',
            ),
          ],
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(CustomScrollView), findsOneWidget);
    expect(find.byType(SliverPadding), findsNothing);
  });
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedGamesTable extends CachedGames
    with TableInfo<$CachedGamesTable, CachedGame> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedGamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleRuMeta = const VerificationMeta(
    'titleRu',
  );
  @override
  late final GeneratedColumn<String> titleRu = GeneratedColumn<String>(
    'title_ru',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleEnMeta = const VerificationMeta(
    'titleEn',
  );
  @override
  late final GeneratedColumn<String> titleEn = GeneratedColumn<String>(
    'title_en',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _creatorRuMeta = const VerificationMeta(
    'creatorRu',
  );
  @override
  late final GeneratedColumn<String> creatorRu = GeneratedColumn<String>(
    'creator_ru',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reviewsCountMeta = const VerificationMeta(
    'reviewsCount',
  );
  @override
  late final GeneratedColumn<int> reviewsCount = GeneratedColumn<int>(
    'reviews_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _downloadCountMeta = const VerificationMeta(
    'downloadCount',
  );
  @override
  late final GeneratedColumn<int> downloadCount = GeneratedColumn<int>(
    'download_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _screenshotsMeta = const VerificationMeta(
    'screenshots',
  );
  @override
  late final GeneratedColumn<String> screenshots = GeneratedColumn<String>(
    'screenshots',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionRuMeta = const VerificationMeta(
    'descriptionRu',
  );
  @override
  late final GeneratedColumn<String> descriptionRu = GeneratedColumn<String>(
    'description_ru',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    titleRu,
    titleEn,
    creatorRu,
    rating,
    reviewsCount,
    downloadCount,
    screenshots,
    descriptionRu,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_games';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedGame> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title_ru')) {
      context.handle(
        _titleRuMeta,
        titleRu.isAcceptableOrUnknown(data['title_ru']!, _titleRuMeta),
      );
    } else if (isInserting) {
      context.missing(_titleRuMeta);
    }
    if (data.containsKey('title_en')) {
      context.handle(
        _titleEnMeta,
        titleEn.isAcceptableOrUnknown(data['title_en']!, _titleEnMeta),
      );
    } else if (isInserting) {
      context.missing(_titleEnMeta);
    }
    if (data.containsKey('creator_ru')) {
      context.handle(
        _creatorRuMeta,
        creatorRu.isAcceptableOrUnknown(data['creator_ru']!, _creatorRuMeta),
      );
    } else if (isInserting) {
      context.missing(_creatorRuMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('reviews_count')) {
      context.handle(
        _reviewsCountMeta,
        reviewsCount.isAcceptableOrUnknown(
          data['reviews_count']!,
          _reviewsCountMeta,
        ),
      );
    }
    if (data.containsKey('download_count')) {
      context.handle(
        _downloadCountMeta,
        downloadCount.isAcceptableOrUnknown(
          data['download_count']!,
          _downloadCountMeta,
        ),
      );
    }
    if (data.containsKey('screenshots')) {
      context.handle(
        _screenshotsMeta,
        screenshots.isAcceptableOrUnknown(
          data['screenshots']!,
          _screenshotsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_screenshotsMeta);
    }
    if (data.containsKey('description_ru')) {
      context.handle(
        _descriptionRuMeta,
        descriptionRu.isAcceptableOrUnknown(
          data['description_ru']!,
          _descriptionRuMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionRuMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedGame map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedGame(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      titleRu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_ru'],
      )!,
      titleEn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title_en'],
      )!,
      creatorRu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}creator_ru'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      ),
      reviewsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reviews_count'],
      )!,
      downloadCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}download_count'],
      )!,
      screenshots: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}screenshots'],
      )!,
      descriptionRu: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description_ru'],
      )!,
    );
  }

  @override
  $CachedGamesTable createAlias(String alias) {
    return $CachedGamesTable(attachedDatabase, alias);
  }
}

class CachedGame extends DataClass implements Insertable<CachedGame> {
  final String id;
  final String titleRu;
  final String titleEn;
  final String creatorRu;
  final double? rating;
  final int reviewsCount;
  final int downloadCount;
  final String screenshots;
  final String descriptionRu;
  const CachedGame({
    required this.id,
    required this.titleRu,
    required this.titleEn,
    required this.creatorRu,
    this.rating,
    required this.reviewsCount,
    required this.downloadCount,
    required this.screenshots,
    required this.descriptionRu,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title_ru'] = Variable<String>(titleRu);
    map['title_en'] = Variable<String>(titleEn);
    map['creator_ru'] = Variable<String>(creatorRu);
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    map['reviews_count'] = Variable<int>(reviewsCount);
    map['download_count'] = Variable<int>(downloadCount);
    map['screenshots'] = Variable<String>(screenshots);
    map['description_ru'] = Variable<String>(descriptionRu);
    return map;
  }

  CachedGamesCompanion toCompanion(bool nullToAbsent) {
    return CachedGamesCompanion(
      id: Value(id),
      titleRu: Value(titleRu),
      titleEn: Value(titleEn),
      creatorRu: Value(creatorRu),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      reviewsCount: Value(reviewsCount),
      downloadCount: Value(downloadCount),
      screenshots: Value(screenshots),
      descriptionRu: Value(descriptionRu),
    );
  }

  factory CachedGame.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedGame(
      id: serializer.fromJson<String>(json['id']),
      titleRu: serializer.fromJson<String>(json['titleRu']),
      titleEn: serializer.fromJson<String>(json['titleEn']),
      creatorRu: serializer.fromJson<String>(json['creatorRu']),
      rating: serializer.fromJson<double?>(json['rating']),
      reviewsCount: serializer.fromJson<int>(json['reviewsCount']),
      downloadCount: serializer.fromJson<int>(json['downloadCount']),
      screenshots: serializer.fromJson<String>(json['screenshots']),
      descriptionRu: serializer.fromJson<String>(json['descriptionRu']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'titleRu': serializer.toJson<String>(titleRu),
      'titleEn': serializer.toJson<String>(titleEn),
      'creatorRu': serializer.toJson<String>(creatorRu),
      'rating': serializer.toJson<double?>(rating),
      'reviewsCount': serializer.toJson<int>(reviewsCount),
      'downloadCount': serializer.toJson<int>(downloadCount),
      'screenshots': serializer.toJson<String>(screenshots),
      'descriptionRu': serializer.toJson<String>(descriptionRu),
    };
  }

  CachedGame copyWith({
    String? id,
    String? titleRu,
    String? titleEn,
    String? creatorRu,
    Value<double?> rating = const Value.absent(),
    int? reviewsCount,
    int? downloadCount,
    String? screenshots,
    String? descriptionRu,
  }) => CachedGame(
    id: id ?? this.id,
    titleRu: titleRu ?? this.titleRu,
    titleEn: titleEn ?? this.titleEn,
    creatorRu: creatorRu ?? this.creatorRu,
    rating: rating.present ? rating.value : this.rating,
    reviewsCount: reviewsCount ?? this.reviewsCount,
    downloadCount: downloadCount ?? this.downloadCount,
    screenshots: screenshots ?? this.screenshots,
    descriptionRu: descriptionRu ?? this.descriptionRu,
  );
  CachedGame copyWithCompanion(CachedGamesCompanion data) {
    return CachedGame(
      id: data.id.present ? data.id.value : this.id,
      titleRu: data.titleRu.present ? data.titleRu.value : this.titleRu,
      titleEn: data.titleEn.present ? data.titleEn.value : this.titleEn,
      creatorRu: data.creatorRu.present ? data.creatorRu.value : this.creatorRu,
      rating: data.rating.present ? data.rating.value : this.rating,
      reviewsCount: data.reviewsCount.present
          ? data.reviewsCount.value
          : this.reviewsCount,
      downloadCount: data.downloadCount.present
          ? data.downloadCount.value
          : this.downloadCount,
      screenshots: data.screenshots.present
          ? data.screenshots.value
          : this.screenshots,
      descriptionRu: data.descriptionRu.present
          ? data.descriptionRu.value
          : this.descriptionRu,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedGame(')
          ..write('id: $id, ')
          ..write('titleRu: $titleRu, ')
          ..write('titleEn: $titleEn, ')
          ..write('creatorRu: $creatorRu, ')
          ..write('rating: $rating, ')
          ..write('reviewsCount: $reviewsCount, ')
          ..write('downloadCount: $downloadCount, ')
          ..write('screenshots: $screenshots, ')
          ..write('descriptionRu: $descriptionRu')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    titleRu,
    titleEn,
    creatorRu,
    rating,
    reviewsCount,
    downloadCount,
    screenshots,
    descriptionRu,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedGame &&
          other.id == this.id &&
          other.titleRu == this.titleRu &&
          other.titleEn == this.titleEn &&
          other.creatorRu == this.creatorRu &&
          other.rating == this.rating &&
          other.reviewsCount == this.reviewsCount &&
          other.downloadCount == this.downloadCount &&
          other.screenshots == this.screenshots &&
          other.descriptionRu == this.descriptionRu);
}

class CachedGamesCompanion extends UpdateCompanion<CachedGame> {
  final Value<String> id;
  final Value<String> titleRu;
  final Value<String> titleEn;
  final Value<String> creatorRu;
  final Value<double?> rating;
  final Value<int> reviewsCount;
  final Value<int> downloadCount;
  final Value<String> screenshots;
  final Value<String> descriptionRu;
  final Value<int> rowid;
  const CachedGamesCompanion({
    this.id = const Value.absent(),
    this.titleRu = const Value.absent(),
    this.titleEn = const Value.absent(),
    this.creatorRu = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewsCount = const Value.absent(),
    this.downloadCount = const Value.absent(),
    this.screenshots = const Value.absent(),
    this.descriptionRu = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedGamesCompanion.insert({
    required String id,
    required String titleRu,
    required String titleEn,
    required String creatorRu,
    this.rating = const Value.absent(),
    this.reviewsCount = const Value.absent(),
    this.downloadCount = const Value.absent(),
    required String screenshots,
    required String descriptionRu,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       titleRu = Value(titleRu),
       titleEn = Value(titleEn),
       creatorRu = Value(creatorRu),
       screenshots = Value(screenshots),
       descriptionRu = Value(descriptionRu);
  static Insertable<CachedGame> custom({
    Expression<String>? id,
    Expression<String>? titleRu,
    Expression<String>? titleEn,
    Expression<String>? creatorRu,
    Expression<double>? rating,
    Expression<int>? reviewsCount,
    Expression<int>? downloadCount,
    Expression<String>? screenshots,
    Expression<String>? descriptionRu,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (titleRu != null) 'title_ru': titleRu,
      if (titleEn != null) 'title_en': titleEn,
      if (creatorRu != null) 'creator_ru': creatorRu,
      if (rating != null) 'rating': rating,
      if (reviewsCount != null) 'reviews_count': reviewsCount,
      if (downloadCount != null) 'download_count': downloadCount,
      if (screenshots != null) 'screenshots': screenshots,
      if (descriptionRu != null) 'description_ru': descriptionRu,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedGamesCompanion copyWith({
    Value<String>? id,
    Value<String>? titleRu,
    Value<String>? titleEn,
    Value<String>? creatorRu,
    Value<double?>? rating,
    Value<int>? reviewsCount,
    Value<int>? downloadCount,
    Value<String>? screenshots,
    Value<String>? descriptionRu,
    Value<int>? rowid,
  }) {
    return CachedGamesCompanion(
      id: id ?? this.id,
      titleRu: titleRu ?? this.titleRu,
      titleEn: titleEn ?? this.titleEn,
      creatorRu: creatorRu ?? this.creatorRu,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      downloadCount: downloadCount ?? this.downloadCount,
      screenshots: screenshots ?? this.screenshots,
      descriptionRu: descriptionRu ?? this.descriptionRu,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (titleRu.present) {
      map['title_ru'] = Variable<String>(titleRu.value);
    }
    if (titleEn.present) {
      map['title_en'] = Variable<String>(titleEn.value);
    }
    if (creatorRu.present) {
      map['creator_ru'] = Variable<String>(creatorRu.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (reviewsCount.present) {
      map['reviews_count'] = Variable<int>(reviewsCount.value);
    }
    if (downloadCount.present) {
      map['download_count'] = Variable<int>(downloadCount.value);
    }
    if (screenshots.present) {
      map['screenshots'] = Variable<String>(screenshots.value);
    }
    if (descriptionRu.present) {
      map['description_ru'] = Variable<String>(descriptionRu.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedGamesCompanion(')
          ..write('id: $id, ')
          ..write('titleRu: $titleRu, ')
          ..write('titleEn: $titleEn, ')
          ..write('creatorRu: $creatorRu, ')
          ..write('rating: $rating, ')
          ..write('reviewsCount: $reviewsCount, ')
          ..write('downloadCount: $downloadCount, ')
          ..write('screenshots: $screenshots, ')
          ..write('descriptionRu: $descriptionRu, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedGamesTable cachedGames = $CachedGamesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cachedGames];
}

typedef $$CachedGamesTableCreateCompanionBuilder =
    CachedGamesCompanion Function({
      required String id,
      required String titleRu,
      required String titleEn,
      required String creatorRu,
      Value<double?> rating,
      Value<int> reviewsCount,
      Value<int> downloadCount,
      required String screenshots,
      required String descriptionRu,
      Value<int> rowid,
    });
typedef $$CachedGamesTableUpdateCompanionBuilder =
    CachedGamesCompanion Function({
      Value<String> id,
      Value<String> titleRu,
      Value<String> titleEn,
      Value<String> creatorRu,
      Value<double?> rating,
      Value<int> reviewsCount,
      Value<int> downloadCount,
      Value<String> screenshots,
      Value<String> descriptionRu,
      Value<int> rowid,
    });

class $$CachedGamesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedGamesTable> {
  $$CachedGamesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleRu => $composableBuilder(
    column: $table.titleRu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get creatorRu => $composableBuilder(
    column: $table.creatorRu,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewsCount => $composableBuilder(
    column: $table.reviewsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get downloadCount => $composableBuilder(
    column: $table.downloadCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get screenshots => $composableBuilder(
    column: $table.screenshots,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descriptionRu => $composableBuilder(
    column: $table.descriptionRu,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedGamesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedGamesTable> {
  $$CachedGamesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleRu => $composableBuilder(
    column: $table.titleRu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get titleEn => $composableBuilder(
    column: $table.titleEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creatorRu => $composableBuilder(
    column: $table.creatorRu,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewsCount => $composableBuilder(
    column: $table.reviewsCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get downloadCount => $composableBuilder(
    column: $table.downloadCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get screenshots => $composableBuilder(
    column: $table.screenshots,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descriptionRu => $composableBuilder(
    column: $table.descriptionRu,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedGamesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedGamesTable> {
  $$CachedGamesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get titleRu =>
      $composableBuilder(column: $table.titleRu, builder: (column) => column);

  GeneratedColumn<String> get titleEn =>
      $composableBuilder(column: $table.titleEn, builder: (column) => column);

  GeneratedColumn<String> get creatorRu =>
      $composableBuilder(column: $table.creatorRu, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get reviewsCount => $composableBuilder(
    column: $table.reviewsCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get downloadCount => $composableBuilder(
    column: $table.downloadCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get screenshots => $composableBuilder(
    column: $table.screenshots,
    builder: (column) => column,
  );

  GeneratedColumn<String> get descriptionRu => $composableBuilder(
    column: $table.descriptionRu,
    builder: (column) => column,
  );
}

class $$CachedGamesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedGamesTable,
          CachedGame,
          $$CachedGamesTableFilterComposer,
          $$CachedGamesTableOrderingComposer,
          $$CachedGamesTableAnnotationComposer,
          $$CachedGamesTableCreateCompanionBuilder,
          $$CachedGamesTableUpdateCompanionBuilder,
          (
            CachedGame,
            BaseReferences<_$AppDatabase, $CachedGamesTable, CachedGame>,
          ),
          CachedGame,
          PrefetchHooks Function()
        > {
  $$CachedGamesTableTableManager(_$AppDatabase db, $CachedGamesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedGamesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedGamesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedGamesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> titleRu = const Value.absent(),
                Value<String> titleEn = const Value.absent(),
                Value<String> creatorRu = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<int> reviewsCount = const Value.absent(),
                Value<int> downloadCount = const Value.absent(),
                Value<String> screenshots = const Value.absent(),
                Value<String> descriptionRu = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedGamesCompanion(
                id: id,
                titleRu: titleRu,
                titleEn: titleEn,
                creatorRu: creatorRu,
                rating: rating,
                reviewsCount: reviewsCount,
                downloadCount: downloadCount,
                screenshots: screenshots,
                descriptionRu: descriptionRu,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String titleRu,
                required String titleEn,
                required String creatorRu,
                Value<double?> rating = const Value.absent(),
                Value<int> reviewsCount = const Value.absent(),
                Value<int> downloadCount = const Value.absent(),
                required String screenshots,
                required String descriptionRu,
                Value<int> rowid = const Value.absent(),
              }) => CachedGamesCompanion.insert(
                id: id,
                titleRu: titleRu,
                titleEn: titleEn,
                creatorRu: creatorRu,
                rating: rating,
                reviewsCount: reviewsCount,
                downloadCount: downloadCount,
                screenshots: screenshots,
                descriptionRu: descriptionRu,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedGamesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedGamesTable,
      CachedGame,
      $$CachedGamesTableFilterComposer,
      $$CachedGamesTableOrderingComposer,
      $$CachedGamesTableAnnotationComposer,
      $$CachedGamesTableCreateCompanionBuilder,
      $$CachedGamesTableUpdateCompanionBuilder,
      (
        CachedGame,
        BaseReferences<_$AppDatabase, $CachedGamesTable, CachedGame>,
      ),
      CachedGame,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedGamesTableTableManager get cachedGames =>
      $$CachedGamesTableTableManager(_db, _db.cachedGames);
}

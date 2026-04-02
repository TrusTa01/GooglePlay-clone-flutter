// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CachedProductTable extends CachedProduct
    with TableInfo<$CachedProductTable, CachedProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _externalIdMeta = const VerificationMeta(
    'externalId',
  );
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
    'external_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($CachedProductTable.$convertertitle);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  shortDescription =
      GeneratedColumn<String>(
        'short_description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Map<String, String>>(
        $CachedProductTable.$convertershortDescription,
      );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  description =
      GeneratedColumn<String>(
        'description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Map<String, String>>(
        $CachedProductTable.$converterdescription,
      );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _releaseDateMeta = const VerificationMeta(
    'releaseDate',
  );
  @override
  late final GeneratedColumn<DateTime> releaseDate = GeneratedColumn<DateTime>(
    'release_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconUrlMeta = const VerificationMeta(
    'iconUrl',
  );
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
    'icon_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
    'is_paid',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_paid" IN (0, 1))',
    ),
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _currencyCodeMeta = const VerificationMeta(
    'currencyCode',
  );
  @override
  late final GeneratedColumn<String> currencyCode = GeneratedColumn<String>(
    'currency_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _discountPriceMeta = const VerificationMeta(
    'discountPrice',
  );
  @override
  late final GeneratedColumn<double> discountPrice = GeneratedColumn<double>(
    'discount_price',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    externalId,
    type,
    title,
    shortDescription,
    description,
    rating,
    reviewsCount,
    releaseDate,
    iconUrl,
    isPaid,
    price,
    currencyCode,
    discountPrice,
    url,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_product';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedProductData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('external_id')) {
      context.handle(
        _externalIdMeta,
        externalId.isAcceptableOrUnknown(data['external_id']!, _externalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('reviews_count')) {
      context.handle(
        _reviewsCountMeta,
        reviewsCount.isAcceptableOrUnknown(
          data['reviews_count']!,
          _reviewsCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reviewsCountMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
        _releaseDateMeta,
        releaseDate.isAcceptableOrUnknown(
          data['release_date']!,
          _releaseDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('icon_url')) {
      context.handle(
        _iconUrlMeta,
        iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_iconUrlMeta);
    }
    if (data.containsKey('is_paid')) {
      context.handle(
        _isPaidMeta,
        isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta),
      );
    } else if (isInserting) {
      context.missing(_isPaidMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('currency_code')) {
      context.handle(
        _currencyCodeMeta,
        currencyCode.isAcceptableOrUnknown(
          data['currency_code']!,
          _currencyCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyCodeMeta);
    }
    if (data.containsKey('discount_price')) {
      context.handle(
        _discountPriceMeta,
        discountPrice.isAcceptableOrUnknown(
          data['discount_price']!,
          _discountPriceMeta,
        ),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedProductData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      externalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_id'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      title: $CachedProductTable.$convertertitle.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}title'],
        )!,
      ),
      shortDescription: $CachedProductTable.$convertershortDescription.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}short_description'],
        )!,
      ),
      description: $CachedProductTable.$converterdescription.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}description'],
        )!,
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      reviewsCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reviews_count'],
      )!,
      releaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}release_date'],
      )!,
      iconUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon_url'],
      )!,
      isPaid: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_paid'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      ),
      currencyCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_code'],
      )!,
      discountPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}discount_price'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
    );
  }

  @override
  $CachedProductTable createAlias(String alias) {
    return $CachedProductTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $convertertitle =
      const LocalizedStringConverter();
  static TypeConverter<Map<String, String>, String> $convertershortDescription =
      const LocalizedStringConverter();
  static TypeConverter<Map<String, String>, String> $converterdescription =
      const LocalizedStringConverter();
}

class CachedProductData extends DataClass
    implements Insertable<CachedProductData> {
  final String id;
  final String externalId;
  final String type;
  final Map<String, String> title;
  final Map<String, String> shortDescription;
  final Map<String, String> description;
  final double rating;
  final int reviewsCount;
  final DateTime releaseDate;
  final String iconUrl;
  final bool isPaid;
  final double? price;
  final String currencyCode;
  final double? discountPrice;
  final String url;
  const CachedProductData({
    required this.id,
    required this.externalId,
    required this.type,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.rating,
    required this.reviewsCount,
    required this.releaseDate,
    required this.iconUrl,
    required this.isPaid,
    this.price,
    required this.currencyCode,
    this.discountPrice,
    required this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['external_id'] = Variable<String>(externalId);
    map['type'] = Variable<String>(type);
    {
      map['title'] = Variable<String>(
        $CachedProductTable.$convertertitle.toSql(title),
      );
    }
    {
      map['short_description'] = Variable<String>(
        $CachedProductTable.$convertershortDescription.toSql(shortDescription),
      );
    }
    {
      map['description'] = Variable<String>(
        $CachedProductTable.$converterdescription.toSql(description),
      );
    }
    map['rating'] = Variable<double>(rating);
    map['reviews_count'] = Variable<int>(reviewsCount);
    map['release_date'] = Variable<DateTime>(releaseDate);
    map['icon_url'] = Variable<String>(iconUrl);
    map['is_paid'] = Variable<bool>(isPaid);
    if (!nullToAbsent || price != null) {
      map['price'] = Variable<double>(price);
    }
    map['currency_code'] = Variable<String>(currencyCode);
    if (!nullToAbsent || discountPrice != null) {
      map['discount_price'] = Variable<double>(discountPrice);
    }
    map['url'] = Variable<String>(url);
    return map;
  }

  CachedProductCompanion toCompanion(bool nullToAbsent) {
    return CachedProductCompanion(
      id: Value(id),
      externalId: Value(externalId),
      type: Value(type),
      title: Value(title),
      shortDescription: Value(shortDescription),
      description: Value(description),
      rating: Value(rating),
      reviewsCount: Value(reviewsCount),
      releaseDate: Value(releaseDate),
      iconUrl: Value(iconUrl),
      isPaid: Value(isPaid),
      price: price == null && nullToAbsent
          ? const Value.absent()
          : Value(price),
      currencyCode: Value(currencyCode),
      discountPrice: discountPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(discountPrice),
      url: Value(url),
    );
  }

  factory CachedProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedProductData(
      id: serializer.fromJson<String>(json['id']),
      externalId: serializer.fromJson<String>(json['externalId']),
      type: serializer.fromJson<String>(json['type']),
      title: serializer.fromJson<Map<String, String>>(json['title']),
      shortDescription: serializer.fromJson<Map<String, String>>(
        json['shortDescription'],
      ),
      description: serializer.fromJson<Map<String, String>>(
        json['description'],
      ),
      rating: serializer.fromJson<double>(json['rating']),
      reviewsCount: serializer.fromJson<int>(json['reviewsCount']),
      releaseDate: serializer.fromJson<DateTime>(json['releaseDate']),
      iconUrl: serializer.fromJson<String>(json['iconUrl']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
      price: serializer.fromJson<double?>(json['price']),
      currencyCode: serializer.fromJson<String>(json['currencyCode']),
      discountPrice: serializer.fromJson<double?>(json['discountPrice']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'externalId': serializer.toJson<String>(externalId),
      'type': serializer.toJson<String>(type),
      'title': serializer.toJson<Map<String, String>>(title),
      'shortDescription': serializer.toJson<Map<String, String>>(
        shortDescription,
      ),
      'description': serializer.toJson<Map<String, String>>(description),
      'rating': serializer.toJson<double>(rating),
      'reviewsCount': serializer.toJson<int>(reviewsCount),
      'releaseDate': serializer.toJson<DateTime>(releaseDate),
      'iconUrl': serializer.toJson<String>(iconUrl),
      'isPaid': serializer.toJson<bool>(isPaid),
      'price': serializer.toJson<double?>(price),
      'currencyCode': serializer.toJson<String>(currencyCode),
      'discountPrice': serializer.toJson<double?>(discountPrice),
      'url': serializer.toJson<String>(url),
    };
  }

  CachedProductData copyWith({
    String? id,
    String? externalId,
    String? type,
    Map<String, String>? title,
    Map<String, String>? shortDescription,
    Map<String, String>? description,
    double? rating,
    int? reviewsCount,
    DateTime? releaseDate,
    String? iconUrl,
    bool? isPaid,
    Value<double?> price = const Value.absent(),
    String? currencyCode,
    Value<double?> discountPrice = const Value.absent(),
    String? url,
  }) => CachedProductData(
    id: id ?? this.id,
    externalId: externalId ?? this.externalId,
    type: type ?? this.type,
    title: title ?? this.title,
    shortDescription: shortDescription ?? this.shortDescription,
    description: description ?? this.description,
    rating: rating ?? this.rating,
    reviewsCount: reviewsCount ?? this.reviewsCount,
    releaseDate: releaseDate ?? this.releaseDate,
    iconUrl: iconUrl ?? this.iconUrl,
    isPaid: isPaid ?? this.isPaid,
    price: price.present ? price.value : this.price,
    currencyCode: currencyCode ?? this.currencyCode,
    discountPrice: discountPrice.present
        ? discountPrice.value
        : this.discountPrice,
    url: url ?? this.url,
  );
  CachedProductData copyWithCompanion(CachedProductCompanion data) {
    return CachedProductData(
      id: data.id.present ? data.id.value : this.id,
      externalId: data.externalId.present
          ? data.externalId.value
          : this.externalId,
      type: data.type.present ? data.type.value : this.type,
      title: data.title.present ? data.title.value : this.title,
      shortDescription: data.shortDescription.present
          ? data.shortDescription.value
          : this.shortDescription,
      description: data.description.present
          ? data.description.value
          : this.description,
      rating: data.rating.present ? data.rating.value : this.rating,
      reviewsCount: data.reviewsCount.present
          ? data.reviewsCount.value
          : this.reviewsCount,
      releaseDate: data.releaseDate.present
          ? data.releaseDate.value
          : this.releaseDate,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
      isPaid: data.isPaid.present ? data.isPaid.value : this.isPaid,
      price: data.price.present ? data.price.value : this.price,
      currencyCode: data.currencyCode.present
          ? data.currencyCode.value
          : this.currencyCode,
      discountPrice: data.discountPrice.present
          ? data.discountPrice.value
          : this.discountPrice,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedProductData(')
          ..write('id: $id, ')
          ..write('externalId: $externalId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('description: $description, ')
          ..write('rating: $rating, ')
          ..write('reviewsCount: $reviewsCount, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('isPaid: $isPaid, ')
          ..write('price: $price, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('discountPrice: $discountPrice, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    externalId,
    type,
    title,
    shortDescription,
    description,
    rating,
    reviewsCount,
    releaseDate,
    iconUrl,
    isPaid,
    price,
    currencyCode,
    discountPrice,
    url,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedProductData &&
          other.id == this.id &&
          other.externalId == this.externalId &&
          other.type == this.type &&
          other.title == this.title &&
          other.shortDescription == this.shortDescription &&
          other.description == this.description &&
          other.rating == this.rating &&
          other.reviewsCount == this.reviewsCount &&
          other.releaseDate == this.releaseDate &&
          other.iconUrl == this.iconUrl &&
          other.isPaid == this.isPaid &&
          other.price == this.price &&
          other.currencyCode == this.currencyCode &&
          other.discountPrice == this.discountPrice &&
          other.url == this.url);
}

class CachedProductCompanion extends UpdateCompanion<CachedProductData> {
  final Value<String> id;
  final Value<String> externalId;
  final Value<String> type;
  final Value<Map<String, String>> title;
  final Value<Map<String, String>> shortDescription;
  final Value<Map<String, String>> description;
  final Value<double> rating;
  final Value<int> reviewsCount;
  final Value<DateTime> releaseDate;
  final Value<String> iconUrl;
  final Value<bool> isPaid;
  final Value<double?> price;
  final Value<String> currencyCode;
  final Value<double?> discountPrice;
  final Value<String> url;
  final Value<int> rowid;
  const CachedProductCompanion({
    this.id = const Value.absent(),
    this.externalId = const Value.absent(),
    this.type = const Value.absent(),
    this.title = const Value.absent(),
    this.shortDescription = const Value.absent(),
    this.description = const Value.absent(),
    this.rating = const Value.absent(),
    this.reviewsCount = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.price = const Value.absent(),
    this.currencyCode = const Value.absent(),
    this.discountPrice = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedProductCompanion.insert({
    required String id,
    required String externalId,
    required String type,
    required Map<String, String> title,
    required Map<String, String> shortDescription,
    required Map<String, String> description,
    required double rating,
    required int reviewsCount,
    required DateTime releaseDate,
    required String iconUrl,
    required bool isPaid,
    this.price = const Value.absent(),
    required String currencyCode,
    this.discountPrice = const Value.absent(),
    required String url,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       externalId = Value(externalId),
       type = Value(type),
       title = Value(title),
       shortDescription = Value(shortDescription),
       description = Value(description),
       rating = Value(rating),
       reviewsCount = Value(reviewsCount),
       releaseDate = Value(releaseDate),
       iconUrl = Value(iconUrl),
       isPaid = Value(isPaid),
       currencyCode = Value(currencyCode),
       url = Value(url);
  static Insertable<CachedProductData> custom({
    Expression<String>? id,
    Expression<String>? externalId,
    Expression<String>? type,
    Expression<String>? title,
    Expression<String>? shortDescription,
    Expression<String>? description,
    Expression<double>? rating,
    Expression<int>? reviewsCount,
    Expression<DateTime>? releaseDate,
    Expression<String>? iconUrl,
    Expression<bool>? isPaid,
    Expression<double>? price,
    Expression<String>? currencyCode,
    Expression<double>? discountPrice,
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (externalId != null) 'external_id': externalId,
      if (type != null) 'type': type,
      if (title != null) 'title': title,
      if (shortDescription != null) 'short_description': shortDescription,
      if (description != null) 'description': description,
      if (rating != null) 'rating': rating,
      if (reviewsCount != null) 'reviews_count': reviewsCount,
      if (releaseDate != null) 'release_date': releaseDate,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (isPaid != null) 'is_paid': isPaid,
      if (price != null) 'price': price,
      if (currencyCode != null) 'currency_code': currencyCode,
      if (discountPrice != null) 'discount_price': discountPrice,
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedProductCompanion copyWith({
    Value<String>? id,
    Value<String>? externalId,
    Value<String>? type,
    Value<Map<String, String>>? title,
    Value<Map<String, String>>? shortDescription,
    Value<Map<String, String>>? description,
    Value<double>? rating,
    Value<int>? reviewsCount,
    Value<DateTime>? releaseDate,
    Value<String>? iconUrl,
    Value<bool>? isPaid,
    Value<double?>? price,
    Value<String>? currencyCode,
    Value<double?>? discountPrice,
    Value<String>? url,
    Value<int>? rowid,
  }) {
    return CachedProductCompanion(
      id: id ?? this.id,
      externalId: externalId ?? this.externalId,
      type: type ?? this.type,
      title: title ?? this.title,
      shortDescription: shortDescription ?? this.shortDescription,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      releaseDate: releaseDate ?? this.releaseDate,
      iconUrl: iconUrl ?? this.iconUrl,
      isPaid: isPaid ?? this.isPaid,
      price: price ?? this.price,
      currencyCode: currencyCode ?? this.currencyCode,
      discountPrice: discountPrice ?? this.discountPrice,
      url: url ?? this.url,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(
        $CachedProductTable.$convertertitle.toSql(title.value),
      );
    }
    if (shortDescription.present) {
      map['short_description'] = Variable<String>(
        $CachedProductTable.$convertershortDescription.toSql(
          shortDescription.value,
        ),
      );
    }
    if (description.present) {
      map['description'] = Variable<String>(
        $CachedProductTable.$converterdescription.toSql(description.value),
      );
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (reviewsCount.present) {
      map['reviews_count'] = Variable<int>(reviewsCount.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<DateTime>(releaseDate.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (currencyCode.present) {
      map['currency_code'] = Variable<String>(currencyCode.value);
    }
    if (discountPrice.present) {
      map['discount_price'] = Variable<double>(discountPrice.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedProductCompanion(')
          ..write('id: $id, ')
          ..write('externalId: $externalId, ')
          ..write('type: $type, ')
          ..write('title: $title, ')
          ..write('shortDescription: $shortDescription, ')
          ..write('description: $description, ')
          ..write('rating: $rating, ')
          ..write('reviewsCount: $reviewsCount, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('isPaid: $isPaid, ')
          ..write('price: $price, ')
          ..write('currencyCode: $currencyCode, ')
          ..write('discountPrice: $discountPrice, ')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductTranslationsTable extends ProductTranslations
    with TableInfo<$ProductTranslationsTable, ProductTranslation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTranslationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_product (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _fieldMeta = const VerificationMeta('field');
  @override
  late final GeneratedColumn<String> field = GeneratedColumn<String>(
    'field',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [productId, field, language, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_translations';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTranslation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('field')) {
      context.handle(
        _fieldMeta,
        field.isAcceptableOrUnknown(data['field']!, _fieldMeta),
      );
    } else if (isInserting) {
      context.missing(_fieldMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, field, language};
  @override
  ProductTranslation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTranslation(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      field: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}field'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $ProductTranslationsTable createAlias(String alias) {
    return $ProductTranslationsTable(attachedDatabase, alias);
  }
}

class ProductTranslation extends DataClass
    implements Insertable<ProductTranslation> {
  final String productId;
  final String field;
  final String language;
  final String value;
  const ProductTranslation({
    required this.productId,
    required this.field,
    required this.language,
    required this.value,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['field'] = Variable<String>(field);
    map['language'] = Variable<String>(language);
    map['value'] = Variable<String>(value);
    return map;
  }

  ProductTranslationsCompanion toCompanion(bool nullToAbsent) {
    return ProductTranslationsCompanion(
      productId: Value(productId),
      field: Value(field),
      language: Value(language),
      value: Value(value),
    );
  }

  factory ProductTranslation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTranslation(
      productId: serializer.fromJson<String>(json['productId']),
      field: serializer.fromJson<String>(json['field']),
      language: serializer.fromJson<String>(json['language']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'field': serializer.toJson<String>(field),
      'language': serializer.toJson<String>(language),
      'value': serializer.toJson<String>(value),
    };
  }

  ProductTranslation copyWith({
    String? productId,
    String? field,
    String? language,
    String? value,
  }) => ProductTranslation(
    productId: productId ?? this.productId,
    field: field ?? this.field,
    language: language ?? this.language,
    value: value ?? this.value,
  );
  ProductTranslation copyWithCompanion(ProductTranslationsCompanion data) {
    return ProductTranslation(
      productId: data.productId.present ? data.productId.value : this.productId,
      field: data.field.present ? data.field.value : this.field,
      language: data.language.present ? data.language.value : this.language,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTranslation(')
          ..write('productId: $productId, ')
          ..write('field: $field, ')
          ..write('language: $language, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, field, language, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTranslation &&
          other.productId == this.productId &&
          other.field == this.field &&
          other.language == this.language &&
          other.value == this.value);
}

class ProductTranslationsCompanion extends UpdateCompanion<ProductTranslation> {
  final Value<String> productId;
  final Value<String> field;
  final Value<String> language;
  final Value<String> value;
  final Value<int> rowid;
  const ProductTranslationsCompanion({
    this.productId = const Value.absent(),
    this.field = const Value.absent(),
    this.language = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductTranslationsCompanion.insert({
    required String productId,
    required String field,
    required String language,
    required String value,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       field = Value(field),
       language = Value(language),
       value = Value(value);
  static Insertable<ProductTranslation> custom({
    Expression<String>? productId,
    Expression<String>? field,
    Expression<String>? language,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (field != null) 'field': field,
      if (language != null) 'language': language,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductTranslationsCompanion copyWith({
    Value<String>? productId,
    Value<String>? field,
    Value<String>? language,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return ProductTranslationsCompanion(
      productId: productId ?? this.productId,
      field: field ?? this.field,
      language: language ?? this.language,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (field.present) {
      map['field'] = Variable<String>(field.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTranslationsCompanion(')
          ..write('productId: $productId, ')
          ..write('field: $field, ')
          ..write('language: $language, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class ProductTitleFts extends Table
    with
        TableInfo<ProductTitleFts, ProductTitleFt>,
        VirtualTableInfo<ProductTitleFts, ProductTitleFt> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  ProductTitleFts(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: '',
  );
  @override
  List<GeneratedColumn> get $columns => [value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_title_fts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTitleFt> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ProductTitleFt map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTitleFt(
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  ProductTitleFts createAlias(String alias) {
    return ProductTitleFts(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
  @override
  String get moduleAndArgs =>
      'fts5(value, content=\'product_translations\', content_rowid=\'rowid\')';
}

class ProductTitleFt extends DataClass implements Insertable<ProductTitleFt> {
  final String value;
  const ProductTitleFt({required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['value'] = Variable<String>(value);
    return map;
  }

  ProductTitleFtsCompanion toCompanion(bool nullToAbsent) {
    return ProductTitleFtsCompanion(value: Value(value));
  }

  factory ProductTitleFt.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTitleFt(value: serializer.fromJson<String>(json['value']));
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{'value': serializer.toJson<String>(value)};
  }

  ProductTitleFt copyWith({String? value}) =>
      ProductTitleFt(value: value ?? this.value);
  ProductTitleFt copyWithCompanion(ProductTitleFtsCompanion data) {
    return ProductTitleFt(
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTitleFt(')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => value.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTitleFt && other.value == this.value);
}

class ProductTitleFtsCompanion extends UpdateCompanion<ProductTitleFt> {
  final Value<String> value;
  final Value<int> rowid;
  const ProductTitleFtsCompanion({
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductTitleFtsCompanion.insert({
    required String value,
    this.rowid = const Value.absent(),
  }) : value = Value(value);
  static Insertable<ProductTitleFt> custom({
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductTitleFtsCompanion copyWith({Value<String>? value, Value<int>? rowid}) {
    return ProductTitleFtsCompanion(
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTitleFtsCompanion(')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncStateTable extends SyncState
    with TableInfo<$SyncStateTable, SyncStateData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncStateTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _syncKeyMeta = const VerificationMeta(
    'syncKey',
  );
  @override
  late final GeneratedColumn<String> syncKey = GeneratedColumn<String>(
    'sync_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncAtMeta = const VerificationMeta(
    'lastSyncAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncAt = GeneratedColumn<DateTime>(
    'last_sync_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cursorMeta = const VerificationMeta('cursor');
  @override
  late final GeneratedColumn<String> cursor = GeneratedColumn<String>(
    'cursor',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _remoteSchemaVersionMeta =
      const VerificationMeta('remoteSchemaVersion');
  @override
  late final GeneratedColumn<int> remoteSchemaVersion = GeneratedColumn<int>(
    'remote_schema_version',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    syncKey,
    lastSyncAt,
    cursor,
    remoteSchemaVersion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_state';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncStateData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('sync_key')) {
      context.handle(
        _syncKeyMeta,
        syncKey.isAcceptableOrUnknown(data['sync_key']!, _syncKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_syncKeyMeta);
    }
    if (data.containsKey('last_sync_at')) {
      context.handle(
        _lastSyncAtMeta,
        lastSyncAt.isAcceptableOrUnknown(
          data['last_sync_at']!,
          _lastSyncAtMeta,
        ),
      );
    }
    if (data.containsKey('cursor')) {
      context.handle(
        _cursorMeta,
        cursor.isAcceptableOrUnknown(data['cursor']!, _cursorMeta),
      );
    }
    if (data.containsKey('remote_schema_version')) {
      context.handle(
        _remoteSchemaVersionMeta,
        remoteSchemaVersion.isAcceptableOrUnknown(
          data['remote_schema_version']!,
          _remoteSchemaVersionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {syncKey};
  @override
  SyncStateData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncStateData(
      syncKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_key'],
      )!,
      lastSyncAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_sync_at'],
      ),
      cursor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cursor'],
      ),
      remoteSchemaVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remote_schema_version'],
      ),
    );
  }

  @override
  $SyncStateTable createAlias(String alias) {
    return $SyncStateTable(attachedDatabase, alias);
  }
}

class SyncStateData extends DataClass implements Insertable<SyncStateData> {
  final String syncKey;
  final DateTime? lastSyncAt;
  final String? cursor;
  final int? remoteSchemaVersion;
  const SyncStateData({
    required this.syncKey,
    this.lastSyncAt,
    this.cursor,
    this.remoteSchemaVersion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['sync_key'] = Variable<String>(syncKey);
    if (!nullToAbsent || lastSyncAt != null) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt);
    }
    if (!nullToAbsent || cursor != null) {
      map['cursor'] = Variable<String>(cursor);
    }
    if (!nullToAbsent || remoteSchemaVersion != null) {
      map['remote_schema_version'] = Variable<int>(remoteSchemaVersion);
    }
    return map;
  }

  SyncStateCompanion toCompanion(bool nullToAbsent) {
    return SyncStateCompanion(
      syncKey: Value(syncKey),
      lastSyncAt: lastSyncAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSyncAt),
      cursor: cursor == null && nullToAbsent
          ? const Value.absent()
          : Value(cursor),
      remoteSchemaVersion: remoteSchemaVersion == null && nullToAbsent
          ? const Value.absent()
          : Value(remoteSchemaVersion),
    );
  }

  factory SyncStateData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncStateData(
      syncKey: serializer.fromJson<String>(json['syncKey']),
      lastSyncAt: serializer.fromJson<DateTime?>(json['lastSyncAt']),
      cursor: serializer.fromJson<String?>(json['cursor']),
      remoteSchemaVersion: serializer.fromJson<int?>(
        json['remoteSchemaVersion'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'syncKey': serializer.toJson<String>(syncKey),
      'lastSyncAt': serializer.toJson<DateTime?>(lastSyncAt),
      'cursor': serializer.toJson<String?>(cursor),
      'remoteSchemaVersion': serializer.toJson<int?>(remoteSchemaVersion),
    };
  }

  SyncStateData copyWith({
    String? syncKey,
    Value<DateTime?> lastSyncAt = const Value.absent(),
    Value<String?> cursor = const Value.absent(),
    Value<int?> remoteSchemaVersion = const Value.absent(),
  }) => SyncStateData(
    syncKey: syncKey ?? this.syncKey,
    lastSyncAt: lastSyncAt.present ? lastSyncAt.value : this.lastSyncAt,
    cursor: cursor.present ? cursor.value : this.cursor,
    remoteSchemaVersion: remoteSchemaVersion.present
        ? remoteSchemaVersion.value
        : this.remoteSchemaVersion,
  );
  SyncStateData copyWithCompanion(SyncStateCompanion data) {
    return SyncStateData(
      syncKey: data.syncKey.present ? data.syncKey.value : this.syncKey,
      lastSyncAt: data.lastSyncAt.present
          ? data.lastSyncAt.value
          : this.lastSyncAt,
      cursor: data.cursor.present ? data.cursor.value : this.cursor,
      remoteSchemaVersion: data.remoteSchemaVersion.present
          ? data.remoteSchemaVersion.value
          : this.remoteSchemaVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncStateData(')
          ..write('syncKey: $syncKey, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('cursor: $cursor, ')
          ..write('remoteSchemaVersion: $remoteSchemaVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(syncKey, lastSyncAt, cursor, remoteSchemaVersion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncStateData &&
          other.syncKey == this.syncKey &&
          other.lastSyncAt == this.lastSyncAt &&
          other.cursor == this.cursor &&
          other.remoteSchemaVersion == this.remoteSchemaVersion);
}

class SyncStateCompanion extends UpdateCompanion<SyncStateData> {
  final Value<String> syncKey;
  final Value<DateTime?> lastSyncAt;
  final Value<String?> cursor;
  final Value<int?> remoteSchemaVersion;
  final Value<int> rowid;
  const SyncStateCompanion({
    this.syncKey = const Value.absent(),
    this.lastSyncAt = const Value.absent(),
    this.cursor = const Value.absent(),
    this.remoteSchemaVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncStateCompanion.insert({
    required String syncKey,
    this.lastSyncAt = const Value.absent(),
    this.cursor = const Value.absent(),
    this.remoteSchemaVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : syncKey = Value(syncKey);
  static Insertable<SyncStateData> custom({
    Expression<String>? syncKey,
    Expression<DateTime>? lastSyncAt,
    Expression<String>? cursor,
    Expression<int>? remoteSchemaVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (syncKey != null) 'sync_key': syncKey,
      if (lastSyncAt != null) 'last_sync_at': lastSyncAt,
      if (cursor != null) 'cursor': cursor,
      if (remoteSchemaVersion != null)
        'remote_schema_version': remoteSchemaVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncStateCompanion copyWith({
    Value<String>? syncKey,
    Value<DateTime?>? lastSyncAt,
    Value<String?>? cursor,
    Value<int?>? remoteSchemaVersion,
    Value<int>? rowid,
  }) {
    return SyncStateCompanion(
      syncKey: syncKey ?? this.syncKey,
      lastSyncAt: lastSyncAt ?? this.lastSyncAt,
      cursor: cursor ?? this.cursor,
      remoteSchemaVersion: remoteSchemaVersion ?? this.remoteSchemaVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (syncKey.present) {
      map['sync_key'] = Variable<String>(syncKey.value);
    }
    if (lastSyncAt.present) {
      map['last_sync_at'] = Variable<DateTime>(lastSyncAt.value);
    }
    if (cursor.present) {
      map['cursor'] = Variable<String>(cursor.value);
    }
    if (remoteSchemaVersion.present) {
      map['remote_schema_version'] = Variable<int>(remoteSchemaVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncStateCompanion(')
          ..write('syncKey: $syncKey, ')
          ..write('lastSyncAt: $lastSyncAt, ')
          ..write('cursor: $cursor, ')
          ..write('remoteSchemaVersion: $remoteSchemaVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DevelopersTable extends Developers
    with TableInfo<$DevelopersTable, Developer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevelopersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($DevelopersTable.$convertercity);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  adress = GeneratedColumn<String>(
    'adress',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($DevelopersTable.$converteradress);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  company = GeneratedColumn<String>(
    'company',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($DevelopersTable.$convertercompany);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  country = GeneratedColumn<String>(
    'country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($DevelopersTable.$convertercountry);
  static const VerificationMeta _websiteUrlMeta = const VerificationMeta(
    'websiteUrl',
  );
  @override
  late final GeneratedColumn<String> websiteUrl = GeneratedColumn<String>(
    'website_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailSupportMeta = const VerificationMeta(
    'emailSupport',
  );
  @override
  late final GeneratedColumn<String> emailSupport = GeneratedColumn<String>(
    'email_support',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _privacyPolicyUrlMeta = const VerificationMeta(
    'privacyPolicyUrl',
  );
  @override
  late final GeneratedColumn<String> privacyPolicyUrl = GeneratedColumn<String>(
    'privacy_policy_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    city,
    phone,
    adress,
    company,
    country,
    websiteUrl,
    emailSupport,
    privacyPolicyUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'developers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Developer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('website_url')) {
      context.handle(
        _websiteUrlMeta,
        websiteUrl.isAcceptableOrUnknown(data['website_url']!, _websiteUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_websiteUrlMeta);
    }
    if (data.containsKey('email_support')) {
      context.handle(
        _emailSupportMeta,
        emailSupport.isAcceptableOrUnknown(
          data['email_support']!,
          _emailSupportMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_emailSupportMeta);
    }
    if (data.containsKey('privacy_policy_url')) {
      context.handle(
        _privacyPolicyUrlMeta,
        privacyPolicyUrl.isAcceptableOrUnknown(
          data['privacy_policy_url']!,
          _privacyPolicyUrlMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_privacyPolicyUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Developer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Developer(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      city: $DevelopersTable.$convertercity.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}city'],
        )!,
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      adress: $DevelopersTable.$converteradress.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}adress'],
        )!,
      ),
      company: $DevelopersTable.$convertercompany.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}company'],
        )!,
      ),
      country: $DevelopersTable.$convertercountry.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}country'],
        )!,
      ),
      websiteUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}website_url'],
      )!,
      emailSupport: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email_support'],
      )!,
      privacyPolicyUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}privacy_policy_url'],
      )!,
    );
  }

  @override
  $DevelopersTable createAlias(String alias) {
    return $DevelopersTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $convertercity =
      const LocalizedStringConverter();
  static TypeConverter<Map<String, String>, String> $converteradress =
      const LocalizedStringConverter();
  static TypeConverter<Map<String, String>, String> $convertercompany =
      const LocalizedStringConverter();
  static TypeConverter<Map<String, String>, String> $convertercountry =
      const LocalizedStringConverter();
}

class Developer extends DataClass implements Insertable<Developer> {
  final String id;
  final Map<String, String> city;
  final String phone;
  final Map<String, String> adress;
  final Map<String, String> company;
  final Map<String, String> country;
  final String websiteUrl;
  final String emailSupport;
  final String privacyPolicyUrl;
  const Developer({
    required this.id,
    required this.city,
    required this.phone,
    required this.adress,
    required this.company,
    required this.country,
    required this.websiteUrl,
    required this.emailSupport,
    required this.privacyPolicyUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['city'] = Variable<String>(
        $DevelopersTable.$convertercity.toSql(city),
      );
    }
    map['phone'] = Variable<String>(phone);
    {
      map['adress'] = Variable<String>(
        $DevelopersTable.$converteradress.toSql(adress),
      );
    }
    {
      map['company'] = Variable<String>(
        $DevelopersTable.$convertercompany.toSql(company),
      );
    }
    {
      map['country'] = Variable<String>(
        $DevelopersTable.$convertercountry.toSql(country),
      );
    }
    map['website_url'] = Variable<String>(websiteUrl);
    map['email_support'] = Variable<String>(emailSupport);
    map['privacy_policy_url'] = Variable<String>(privacyPolicyUrl);
    return map;
  }

  DevelopersCompanion toCompanion(bool nullToAbsent) {
    return DevelopersCompanion(
      id: Value(id),
      city: Value(city),
      phone: Value(phone),
      adress: Value(adress),
      company: Value(company),
      country: Value(country),
      websiteUrl: Value(websiteUrl),
      emailSupport: Value(emailSupport),
      privacyPolicyUrl: Value(privacyPolicyUrl),
    );
  }

  factory Developer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Developer(
      id: serializer.fromJson<String>(json['id']),
      city: serializer.fromJson<Map<String, String>>(json['city']),
      phone: serializer.fromJson<String>(json['phone']),
      adress: serializer.fromJson<Map<String, String>>(json['adress']),
      company: serializer.fromJson<Map<String, String>>(json['company']),
      country: serializer.fromJson<Map<String, String>>(json['country']),
      websiteUrl: serializer.fromJson<String>(json['websiteUrl']),
      emailSupport: serializer.fromJson<String>(json['emailSupport']),
      privacyPolicyUrl: serializer.fromJson<String>(json['privacyPolicyUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'city': serializer.toJson<Map<String, String>>(city),
      'phone': serializer.toJson<String>(phone),
      'adress': serializer.toJson<Map<String, String>>(adress),
      'company': serializer.toJson<Map<String, String>>(company),
      'country': serializer.toJson<Map<String, String>>(country),
      'websiteUrl': serializer.toJson<String>(websiteUrl),
      'emailSupport': serializer.toJson<String>(emailSupport),
      'privacyPolicyUrl': serializer.toJson<String>(privacyPolicyUrl),
    };
  }

  Developer copyWith({
    String? id,
    Map<String, String>? city,
    String? phone,
    Map<String, String>? adress,
    Map<String, String>? company,
    Map<String, String>? country,
    String? websiteUrl,
    String? emailSupport,
    String? privacyPolicyUrl,
  }) => Developer(
    id: id ?? this.id,
    city: city ?? this.city,
    phone: phone ?? this.phone,
    adress: adress ?? this.adress,
    company: company ?? this.company,
    country: country ?? this.country,
    websiteUrl: websiteUrl ?? this.websiteUrl,
    emailSupport: emailSupport ?? this.emailSupport,
    privacyPolicyUrl: privacyPolicyUrl ?? this.privacyPolicyUrl,
  );
  Developer copyWithCompanion(DevelopersCompanion data) {
    return Developer(
      id: data.id.present ? data.id.value : this.id,
      city: data.city.present ? data.city.value : this.city,
      phone: data.phone.present ? data.phone.value : this.phone,
      adress: data.adress.present ? data.adress.value : this.adress,
      company: data.company.present ? data.company.value : this.company,
      country: data.country.present ? data.country.value : this.country,
      websiteUrl: data.websiteUrl.present
          ? data.websiteUrl.value
          : this.websiteUrl,
      emailSupport: data.emailSupport.present
          ? data.emailSupport.value
          : this.emailSupport,
      privacyPolicyUrl: data.privacyPolicyUrl.present
          ? data.privacyPolicyUrl.value
          : this.privacyPolicyUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Developer(')
          ..write('id: $id, ')
          ..write('city: $city, ')
          ..write('phone: $phone, ')
          ..write('adress: $adress, ')
          ..write('company: $company, ')
          ..write('country: $country, ')
          ..write('websiteUrl: $websiteUrl, ')
          ..write('emailSupport: $emailSupport, ')
          ..write('privacyPolicyUrl: $privacyPolicyUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    city,
    phone,
    adress,
    company,
    country,
    websiteUrl,
    emailSupport,
    privacyPolicyUrl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Developer &&
          other.id == this.id &&
          other.city == this.city &&
          other.phone == this.phone &&
          other.adress == this.adress &&
          other.company == this.company &&
          other.country == this.country &&
          other.websiteUrl == this.websiteUrl &&
          other.emailSupport == this.emailSupport &&
          other.privacyPolicyUrl == this.privacyPolicyUrl);
}

class DevelopersCompanion extends UpdateCompanion<Developer> {
  final Value<String> id;
  final Value<Map<String, String>> city;
  final Value<String> phone;
  final Value<Map<String, String>> adress;
  final Value<Map<String, String>> company;
  final Value<Map<String, String>> country;
  final Value<String> websiteUrl;
  final Value<String> emailSupport;
  final Value<String> privacyPolicyUrl;
  final Value<int> rowid;
  const DevelopersCompanion({
    this.id = const Value.absent(),
    this.city = const Value.absent(),
    this.phone = const Value.absent(),
    this.adress = const Value.absent(),
    this.company = const Value.absent(),
    this.country = const Value.absent(),
    this.websiteUrl = const Value.absent(),
    this.emailSupport = const Value.absent(),
    this.privacyPolicyUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DevelopersCompanion.insert({
    required String id,
    required Map<String, String> city,
    required String phone,
    required Map<String, String> adress,
    required Map<String, String> company,
    required Map<String, String> country,
    required String websiteUrl,
    required String emailSupport,
    required String privacyPolicyUrl,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       city = Value(city),
       phone = Value(phone),
       adress = Value(adress),
       company = Value(company),
       country = Value(country),
       websiteUrl = Value(websiteUrl),
       emailSupport = Value(emailSupport),
       privacyPolicyUrl = Value(privacyPolicyUrl);
  static Insertable<Developer> custom({
    Expression<String>? id,
    Expression<String>? city,
    Expression<String>? phone,
    Expression<String>? adress,
    Expression<String>? company,
    Expression<String>? country,
    Expression<String>? websiteUrl,
    Expression<String>? emailSupport,
    Expression<String>? privacyPolicyUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (city != null) 'city': city,
      if (phone != null) 'phone': phone,
      if (adress != null) 'adress': adress,
      if (company != null) 'company': company,
      if (country != null) 'country': country,
      if (websiteUrl != null) 'website_url': websiteUrl,
      if (emailSupport != null) 'email_support': emailSupport,
      if (privacyPolicyUrl != null) 'privacy_policy_url': privacyPolicyUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DevelopersCompanion copyWith({
    Value<String>? id,
    Value<Map<String, String>>? city,
    Value<String>? phone,
    Value<Map<String, String>>? adress,
    Value<Map<String, String>>? company,
    Value<Map<String, String>>? country,
    Value<String>? websiteUrl,
    Value<String>? emailSupport,
    Value<String>? privacyPolicyUrl,
    Value<int>? rowid,
  }) {
    return DevelopersCompanion(
      id: id ?? this.id,
      city: city ?? this.city,
      phone: phone ?? this.phone,
      adress: adress ?? this.adress,
      company: company ?? this.company,
      country: country ?? this.country,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      emailSupport: emailSupport ?? this.emailSupport,
      privacyPolicyUrl: privacyPolicyUrl ?? this.privacyPolicyUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(
        $DevelopersTable.$convertercity.toSql(city.value),
      );
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (adress.present) {
      map['adress'] = Variable<String>(
        $DevelopersTable.$converteradress.toSql(adress.value),
      );
    }
    if (company.present) {
      map['company'] = Variable<String>(
        $DevelopersTable.$convertercompany.toSql(company.value),
      );
    }
    if (country.present) {
      map['country'] = Variable<String>(
        $DevelopersTable.$convertercountry.toSql(country.value),
      );
    }
    if (websiteUrl.present) {
      map['website_url'] = Variable<String>(websiteUrl.value);
    }
    if (emailSupport.present) {
      map['email_support'] = Variable<String>(emailSupport.value);
    }
    if (privacyPolicyUrl.present) {
      map['privacy_policy_url'] = Variable<String>(privacyPolicyUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevelopersCompanion(')
          ..write('id: $id, ')
          ..write('city: $city, ')
          ..write('phone: $phone, ')
          ..write('adress: $adress, ')
          ..write('company: $company, ')
          ..write('country: $country, ')
          ..write('websiteUrl: $websiteUrl, ')
          ..write('emailSupport: $emailSupport, ')
          ..write('privacyPolicyUrl: $privacyPolicyUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedSoftwareProductTable extends CachedSoftwareProduct
    with TableInfo<$CachedSoftwareProductTable, CachedSoftwareProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedSoftwareProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_product (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _developerIdMeta = const VerificationMeta(
    'developerId',
  );
  @override
  late final GeneratedColumn<String> developerId = GeneratedColumn<String>(
    'developer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES developers (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  screenshots =
      GeneratedColumn<String>(
        'screenshots',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>(
        $CachedSoftwareProductTable.$converterscreenshots,
      );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String>
  supportedLanguages =
      GeneratedColumn<String>(
        'supported_languages',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>(
        $CachedSoftwareProductTable.$convertersupportedLanguages,
      );
  static const VerificationMeta _containsAdsMeta = const VerificationMeta(
    'containsAds',
  );
  @override
  late final GeneratedColumn<bool> containsAds = GeneratedColumn<bool>(
    'contains_ads',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("contains_ads" IN (0, 1))',
    ),
  );
  static const VerificationMeta _containsPaidContentMeta =
      const VerificationMeta('containsPaidContent');
  @override
  late final GeneratedColumn<bool> containsPaidContent = GeneratedColumn<bool>(
    'contains_paid_content',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("contains_paid_content" IN (0, 1))',
    ),
  );
  static const VerificationMeta _versionMeta = const VerificationMeta(
    'version',
  );
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
    'version',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sizeMeta = const VerificationMeta('size');
  @override
  late final GeneratedColumn<String> size = GeneratedColumn<String>(
    'size',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>?, String>
  eventText =
      GeneratedColumn<String>(
        'event_text',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, String>?>(
        $CachedSoftwareProductTable.$convertereventText,
      );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  whatsNewText =
      GeneratedColumn<String>(
        'whats_new_text',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Map<String, String>>(
        $CachedSoftwareProductTable.$converterwhatsNewText,
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
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ageRatingMeta = const VerificationMeta(
    'ageRating',
  );
  @override
  late final GeneratedColumn<int> ageRating = GeneratedColumn<int>(
    'age_rating',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isKidsFriendlyMeta = const VerificationMeta(
    'isKidsFriendly',
  );
  @override
  late final GeneratedColumn<bool> isKidsFriendly = GeneratedColumn<bool>(
    'is_kids_friendly',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_kids_friendly" IN (0, 1))',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<
    List<Map<String, String>>?,
    String
  >
  ageRatingReasons =
      GeneratedColumn<String>(
        'age_rating_reasons',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<Map<String, String>>?>(
        $CachedSoftwareProductTable.$converterageRatingReasons,
      );
  @override
  late final GeneratedColumnWithTypeConverter<
    List<Map<String, String>>?,
    String
  >
  permissions =
      GeneratedColumn<String>(
        'permissions',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<Map<String, String>>?>(
        $CachedSoftwareProductTable.$converterpermissions,
      );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>?, String>
  creatorDescription =
      GeneratedColumn<String>(
        'creator_description',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Map<String, String>?>(
        $CachedSoftwareProductTable.$convertercreatorDescription,
      );
  @override
  List<GeneratedColumn> get $columns => [
    productId,
    developerId,
    screenshots,
    supportedLanguages,
    containsAds,
    containsPaidContent,
    version,
    size,
    eventText,
    whatsNewText,
    downloadCount,
    ageRating,
    isKidsFriendly,
    ageRatingReasons,
    permissions,
    lastUpdated,
    creatorDescription,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_software_product';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedSoftwareProductData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('developer_id')) {
      context.handle(
        _developerIdMeta,
        developerId.isAcceptableOrUnknown(
          data['developer_id']!,
          _developerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_developerIdMeta);
    }
    if (data.containsKey('contains_ads')) {
      context.handle(
        _containsAdsMeta,
        containsAds.isAcceptableOrUnknown(
          data['contains_ads']!,
          _containsAdsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_containsAdsMeta);
    }
    if (data.containsKey('contains_paid_content')) {
      context.handle(
        _containsPaidContentMeta,
        containsPaidContent.isAcceptableOrUnknown(
          data['contains_paid_content']!,
          _containsPaidContentMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_containsPaidContentMeta);
    }
    if (data.containsKey('version')) {
      context.handle(
        _versionMeta,
        version.isAcceptableOrUnknown(data['version']!, _versionMeta),
      );
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('size')) {
      context.handle(
        _sizeMeta,
        size.isAcceptableOrUnknown(data['size']!, _sizeMeta),
      );
    } else if (isInserting) {
      context.missing(_sizeMeta);
    }
    if (data.containsKey('download_count')) {
      context.handle(
        _downloadCountMeta,
        downloadCount.isAcceptableOrUnknown(
          data['download_count']!,
          _downloadCountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_downloadCountMeta);
    }
    if (data.containsKey('age_rating')) {
      context.handle(
        _ageRatingMeta,
        ageRating.isAcceptableOrUnknown(data['age_rating']!, _ageRatingMeta),
      );
    } else if (isInserting) {
      context.missing(_ageRatingMeta);
    }
    if (data.containsKey('is_kids_friendly')) {
      context.handle(
        _isKidsFriendlyMeta,
        isKidsFriendly.isAcceptableOrUnknown(
          data['is_kids_friendly']!,
          _isKidsFriendlyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isKidsFriendlyMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  CachedSoftwareProductData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedSoftwareProductData(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      developerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}developer_id'],
      )!,
      screenshots: $CachedSoftwareProductTable.$converterscreenshots.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}screenshots'],
        ),
      ),
      supportedLanguages: $CachedSoftwareProductTable
          .$convertersupportedLanguages
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}supported_languages'],
            ),
          ),
      containsAds: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}contains_ads'],
      )!,
      containsPaidContent: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}contains_paid_content'],
      )!,
      version: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}version'],
      )!,
      size: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}size'],
      )!,
      eventText: $CachedSoftwareProductTable.$convertereventText.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}event_text'],
        ),
      ),
      whatsNewText: $CachedSoftwareProductTable.$converterwhatsNewText.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}whats_new_text'],
        )!,
      ),
      downloadCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}download_count'],
      )!,
      ageRating: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}age_rating'],
      )!,
      isKidsFriendly: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_kids_friendly'],
      )!,
      ageRatingReasons: $CachedSoftwareProductTable.$converterageRatingReasons
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}age_rating_reasons'],
            ),
          ),
      permissions: $CachedSoftwareProductTable.$converterpermissions.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}permissions'],
        ),
      ),
      lastUpdated: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated'],
      )!,
      creatorDescription: $CachedSoftwareProductTable
          .$convertercreatorDescription
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}creator_description'],
            ),
          ),
    );
  }

  @override
  $CachedSoftwareProductTable createAlias(String alias) {
    return $CachedSoftwareProductTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>?, String?> $converterscreenshots =
      const StringListNullableConverter();
  static TypeConverter<List<String>?, String?> $convertersupportedLanguages =
      const StringListNullableConverter();
  static TypeConverter<Map<String, String>?, String?> $convertereventText =
      const LocalizedStringNullableConverter();
  static TypeConverter<Map<String, String>, String> $converterwhatsNewText =
      const LocalizedStringConverter();
  static TypeConverter<List<Map<String, String>>?, String?>
  $converterageRatingReasons = const LocalizedStringListNullableConverter();
  static TypeConverter<List<Map<String, String>>?, String?>
  $converterpermissions = const LocalizedStringListNullableConverter();
  static TypeConverter<Map<String, String>?, String?>
  $convertercreatorDescription = const LocalizedStringNullableConverter();
}

class CachedSoftwareProductData extends DataClass
    implements Insertable<CachedSoftwareProductData> {
  final String productId;
  final String developerId;
  final List<String>? screenshots;
  final List<String>? supportedLanguages;
  final bool containsAds;
  final bool containsPaidContent;
  final String version;
  final String size;
  final Map<String, String>? eventText;
  final Map<String, String> whatsNewText;
  final int downloadCount;
  final int ageRating;
  final bool isKidsFriendly;
  final List<Map<String, String>>? ageRatingReasons;
  final List<Map<String, String>>? permissions;
  final DateTime lastUpdated;
  final Map<String, String>? creatorDescription;
  const CachedSoftwareProductData({
    required this.productId,
    required this.developerId,
    this.screenshots,
    this.supportedLanguages,
    required this.containsAds,
    required this.containsPaidContent,
    required this.version,
    required this.size,
    this.eventText,
    required this.whatsNewText,
    required this.downloadCount,
    required this.ageRating,
    required this.isKidsFriendly,
    this.ageRatingReasons,
    this.permissions,
    required this.lastUpdated,
    this.creatorDescription,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['developer_id'] = Variable<String>(developerId);
    if (!nullToAbsent || screenshots != null) {
      map['screenshots'] = Variable<String>(
        $CachedSoftwareProductTable.$converterscreenshots.toSql(screenshots),
      );
    }
    if (!nullToAbsent || supportedLanguages != null) {
      map['supported_languages'] = Variable<String>(
        $CachedSoftwareProductTable.$convertersupportedLanguages.toSql(
          supportedLanguages,
        ),
      );
    }
    map['contains_ads'] = Variable<bool>(containsAds);
    map['contains_paid_content'] = Variable<bool>(containsPaidContent);
    map['version'] = Variable<String>(version);
    map['size'] = Variable<String>(size);
    if (!nullToAbsent || eventText != null) {
      map['event_text'] = Variable<String>(
        $CachedSoftwareProductTable.$convertereventText.toSql(eventText),
      );
    }
    {
      map['whats_new_text'] = Variable<String>(
        $CachedSoftwareProductTable.$converterwhatsNewText.toSql(whatsNewText),
      );
    }
    map['download_count'] = Variable<int>(downloadCount);
    map['age_rating'] = Variable<int>(ageRating);
    map['is_kids_friendly'] = Variable<bool>(isKidsFriendly);
    if (!nullToAbsent || ageRatingReasons != null) {
      map['age_rating_reasons'] = Variable<String>(
        $CachedSoftwareProductTable.$converterageRatingReasons.toSql(
          ageRatingReasons,
        ),
      );
    }
    if (!nullToAbsent || permissions != null) {
      map['permissions'] = Variable<String>(
        $CachedSoftwareProductTable.$converterpermissions.toSql(permissions),
      );
    }
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    if (!nullToAbsent || creatorDescription != null) {
      map['creator_description'] = Variable<String>(
        $CachedSoftwareProductTable.$convertercreatorDescription.toSql(
          creatorDescription,
        ),
      );
    }
    return map;
  }

  CachedSoftwareProductCompanion toCompanion(bool nullToAbsent) {
    return CachedSoftwareProductCompanion(
      productId: Value(productId),
      developerId: Value(developerId),
      screenshots: screenshots == null && nullToAbsent
          ? const Value.absent()
          : Value(screenshots),
      supportedLanguages: supportedLanguages == null && nullToAbsent
          ? const Value.absent()
          : Value(supportedLanguages),
      containsAds: Value(containsAds),
      containsPaidContent: Value(containsPaidContent),
      version: Value(version),
      size: Value(size),
      eventText: eventText == null && nullToAbsent
          ? const Value.absent()
          : Value(eventText),
      whatsNewText: Value(whatsNewText),
      downloadCount: Value(downloadCount),
      ageRating: Value(ageRating),
      isKidsFriendly: Value(isKidsFriendly),
      ageRatingReasons: ageRatingReasons == null && nullToAbsent
          ? const Value.absent()
          : Value(ageRatingReasons),
      permissions: permissions == null && nullToAbsent
          ? const Value.absent()
          : Value(permissions),
      lastUpdated: Value(lastUpdated),
      creatorDescription: creatorDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(creatorDescription),
    );
  }

  factory CachedSoftwareProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedSoftwareProductData(
      productId: serializer.fromJson<String>(json['productId']),
      developerId: serializer.fromJson<String>(json['developerId']),
      screenshots: serializer.fromJson<List<String>?>(json['screenshots']),
      supportedLanguages: serializer.fromJson<List<String>?>(
        json['supportedLanguages'],
      ),
      containsAds: serializer.fromJson<bool>(json['containsAds']),
      containsPaidContent: serializer.fromJson<bool>(
        json['containsPaidContent'],
      ),
      version: serializer.fromJson<String>(json['version']),
      size: serializer.fromJson<String>(json['size']),
      eventText: serializer.fromJson<Map<String, String>?>(json['eventText']),
      whatsNewText: serializer.fromJson<Map<String, String>>(
        json['whatsNewText'],
      ),
      downloadCount: serializer.fromJson<int>(json['downloadCount']),
      ageRating: serializer.fromJson<int>(json['ageRating']),
      isKidsFriendly: serializer.fromJson<bool>(json['isKidsFriendly']),
      ageRatingReasons: serializer.fromJson<List<Map<String, String>>?>(
        json['ageRatingReasons'],
      ),
      permissions: serializer.fromJson<List<Map<String, String>>?>(
        json['permissions'],
      ),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
      creatorDescription: serializer.fromJson<Map<String, String>?>(
        json['creatorDescription'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'developerId': serializer.toJson<String>(developerId),
      'screenshots': serializer.toJson<List<String>?>(screenshots),
      'supportedLanguages': serializer.toJson<List<String>?>(
        supportedLanguages,
      ),
      'containsAds': serializer.toJson<bool>(containsAds),
      'containsPaidContent': serializer.toJson<bool>(containsPaidContent),
      'version': serializer.toJson<String>(version),
      'size': serializer.toJson<String>(size),
      'eventText': serializer.toJson<Map<String, String>?>(eventText),
      'whatsNewText': serializer.toJson<Map<String, String>>(whatsNewText),
      'downloadCount': serializer.toJson<int>(downloadCount),
      'ageRating': serializer.toJson<int>(ageRating),
      'isKidsFriendly': serializer.toJson<bool>(isKidsFriendly),
      'ageRatingReasons': serializer.toJson<List<Map<String, String>>?>(
        ageRatingReasons,
      ),
      'permissions': serializer.toJson<List<Map<String, String>>?>(permissions),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
      'creatorDescription': serializer.toJson<Map<String, String>?>(
        creatorDescription,
      ),
    };
  }

  CachedSoftwareProductData copyWith({
    String? productId,
    String? developerId,
    Value<List<String>?> screenshots = const Value.absent(),
    Value<List<String>?> supportedLanguages = const Value.absent(),
    bool? containsAds,
    bool? containsPaidContent,
    String? version,
    String? size,
    Value<Map<String, String>?> eventText = const Value.absent(),
    Map<String, String>? whatsNewText,
    int? downloadCount,
    int? ageRating,
    bool? isKidsFriendly,
    Value<List<Map<String, String>>?> ageRatingReasons = const Value.absent(),
    Value<List<Map<String, String>>?> permissions = const Value.absent(),
    DateTime? lastUpdated,
    Value<Map<String, String>?> creatorDescription = const Value.absent(),
  }) => CachedSoftwareProductData(
    productId: productId ?? this.productId,
    developerId: developerId ?? this.developerId,
    screenshots: screenshots.present ? screenshots.value : this.screenshots,
    supportedLanguages: supportedLanguages.present
        ? supportedLanguages.value
        : this.supportedLanguages,
    containsAds: containsAds ?? this.containsAds,
    containsPaidContent: containsPaidContent ?? this.containsPaidContent,
    version: version ?? this.version,
    size: size ?? this.size,
    eventText: eventText.present ? eventText.value : this.eventText,
    whatsNewText: whatsNewText ?? this.whatsNewText,
    downloadCount: downloadCount ?? this.downloadCount,
    ageRating: ageRating ?? this.ageRating,
    isKidsFriendly: isKidsFriendly ?? this.isKidsFriendly,
    ageRatingReasons: ageRatingReasons.present
        ? ageRatingReasons.value
        : this.ageRatingReasons,
    permissions: permissions.present ? permissions.value : this.permissions,
    lastUpdated: lastUpdated ?? this.lastUpdated,
    creatorDescription: creatorDescription.present
        ? creatorDescription.value
        : this.creatorDescription,
  );
  CachedSoftwareProductData copyWithCompanion(
    CachedSoftwareProductCompanion data,
  ) {
    return CachedSoftwareProductData(
      productId: data.productId.present ? data.productId.value : this.productId,
      developerId: data.developerId.present
          ? data.developerId.value
          : this.developerId,
      screenshots: data.screenshots.present
          ? data.screenshots.value
          : this.screenshots,
      supportedLanguages: data.supportedLanguages.present
          ? data.supportedLanguages.value
          : this.supportedLanguages,
      containsAds: data.containsAds.present
          ? data.containsAds.value
          : this.containsAds,
      containsPaidContent: data.containsPaidContent.present
          ? data.containsPaidContent.value
          : this.containsPaidContent,
      version: data.version.present ? data.version.value : this.version,
      size: data.size.present ? data.size.value : this.size,
      eventText: data.eventText.present ? data.eventText.value : this.eventText,
      whatsNewText: data.whatsNewText.present
          ? data.whatsNewText.value
          : this.whatsNewText,
      downloadCount: data.downloadCount.present
          ? data.downloadCount.value
          : this.downloadCount,
      ageRating: data.ageRating.present ? data.ageRating.value : this.ageRating,
      isKidsFriendly: data.isKidsFriendly.present
          ? data.isKidsFriendly.value
          : this.isKidsFriendly,
      ageRatingReasons: data.ageRatingReasons.present
          ? data.ageRatingReasons.value
          : this.ageRatingReasons,
      permissions: data.permissions.present
          ? data.permissions.value
          : this.permissions,
      lastUpdated: data.lastUpdated.present
          ? data.lastUpdated.value
          : this.lastUpdated,
      creatorDescription: data.creatorDescription.present
          ? data.creatorDescription.value
          : this.creatorDescription,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedSoftwareProductData(')
          ..write('productId: $productId, ')
          ..write('developerId: $developerId, ')
          ..write('screenshots: $screenshots, ')
          ..write('supportedLanguages: $supportedLanguages, ')
          ..write('containsAds: $containsAds, ')
          ..write('containsPaidContent: $containsPaidContent, ')
          ..write('version: $version, ')
          ..write('size: $size, ')
          ..write('eventText: $eventText, ')
          ..write('whatsNewText: $whatsNewText, ')
          ..write('downloadCount: $downloadCount, ')
          ..write('ageRating: $ageRating, ')
          ..write('isKidsFriendly: $isKidsFriendly, ')
          ..write('ageRatingReasons: $ageRatingReasons, ')
          ..write('permissions: $permissions, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('creatorDescription: $creatorDescription')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    productId,
    developerId,
    screenshots,
    supportedLanguages,
    containsAds,
    containsPaidContent,
    version,
    size,
    eventText,
    whatsNewText,
    downloadCount,
    ageRating,
    isKidsFriendly,
    ageRatingReasons,
    permissions,
    lastUpdated,
    creatorDescription,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedSoftwareProductData &&
          other.productId == this.productId &&
          other.developerId == this.developerId &&
          other.screenshots == this.screenshots &&
          other.supportedLanguages == this.supportedLanguages &&
          other.containsAds == this.containsAds &&
          other.containsPaidContent == this.containsPaidContent &&
          other.version == this.version &&
          other.size == this.size &&
          other.eventText == this.eventText &&
          other.whatsNewText == this.whatsNewText &&
          other.downloadCount == this.downloadCount &&
          other.ageRating == this.ageRating &&
          other.isKidsFriendly == this.isKidsFriendly &&
          other.ageRatingReasons == this.ageRatingReasons &&
          other.permissions == this.permissions &&
          other.lastUpdated == this.lastUpdated &&
          other.creatorDescription == this.creatorDescription);
}

class CachedSoftwareProductCompanion
    extends UpdateCompanion<CachedSoftwareProductData> {
  final Value<String> productId;
  final Value<String> developerId;
  final Value<List<String>?> screenshots;
  final Value<List<String>?> supportedLanguages;
  final Value<bool> containsAds;
  final Value<bool> containsPaidContent;
  final Value<String> version;
  final Value<String> size;
  final Value<Map<String, String>?> eventText;
  final Value<Map<String, String>> whatsNewText;
  final Value<int> downloadCount;
  final Value<int> ageRating;
  final Value<bool> isKidsFriendly;
  final Value<List<Map<String, String>>?> ageRatingReasons;
  final Value<List<Map<String, String>>?> permissions;
  final Value<DateTime> lastUpdated;
  final Value<Map<String, String>?> creatorDescription;
  final Value<int> rowid;
  const CachedSoftwareProductCompanion({
    this.productId = const Value.absent(),
    this.developerId = const Value.absent(),
    this.screenshots = const Value.absent(),
    this.supportedLanguages = const Value.absent(),
    this.containsAds = const Value.absent(),
    this.containsPaidContent = const Value.absent(),
    this.version = const Value.absent(),
    this.size = const Value.absent(),
    this.eventText = const Value.absent(),
    this.whatsNewText = const Value.absent(),
    this.downloadCount = const Value.absent(),
    this.ageRating = const Value.absent(),
    this.isKidsFriendly = const Value.absent(),
    this.ageRatingReasons = const Value.absent(),
    this.permissions = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.creatorDescription = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedSoftwareProductCompanion.insert({
    required String productId,
    required String developerId,
    this.screenshots = const Value.absent(),
    this.supportedLanguages = const Value.absent(),
    required bool containsAds,
    required bool containsPaidContent,
    required String version,
    required String size,
    this.eventText = const Value.absent(),
    required Map<String, String> whatsNewText,
    required int downloadCount,
    required int ageRating,
    required bool isKidsFriendly,
    this.ageRatingReasons = const Value.absent(),
    this.permissions = const Value.absent(),
    required DateTime lastUpdated,
    this.creatorDescription = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       developerId = Value(developerId),
       containsAds = Value(containsAds),
       containsPaidContent = Value(containsPaidContent),
       version = Value(version),
       size = Value(size),
       whatsNewText = Value(whatsNewText),
       downloadCount = Value(downloadCount),
       ageRating = Value(ageRating),
       isKidsFriendly = Value(isKidsFriendly),
       lastUpdated = Value(lastUpdated);
  static Insertable<CachedSoftwareProductData> custom({
    Expression<String>? productId,
    Expression<String>? developerId,
    Expression<String>? screenshots,
    Expression<String>? supportedLanguages,
    Expression<bool>? containsAds,
    Expression<bool>? containsPaidContent,
    Expression<String>? version,
    Expression<String>? size,
    Expression<String>? eventText,
    Expression<String>? whatsNewText,
    Expression<int>? downloadCount,
    Expression<int>? ageRating,
    Expression<bool>? isKidsFriendly,
    Expression<String>? ageRatingReasons,
    Expression<String>? permissions,
    Expression<DateTime>? lastUpdated,
    Expression<String>? creatorDescription,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (developerId != null) 'developer_id': developerId,
      if (screenshots != null) 'screenshots': screenshots,
      if (supportedLanguages != null) 'supported_languages': supportedLanguages,
      if (containsAds != null) 'contains_ads': containsAds,
      if (containsPaidContent != null)
        'contains_paid_content': containsPaidContent,
      if (version != null) 'version': version,
      if (size != null) 'size': size,
      if (eventText != null) 'event_text': eventText,
      if (whatsNewText != null) 'whats_new_text': whatsNewText,
      if (downloadCount != null) 'download_count': downloadCount,
      if (ageRating != null) 'age_rating': ageRating,
      if (isKidsFriendly != null) 'is_kids_friendly': isKidsFriendly,
      if (ageRatingReasons != null) 'age_rating_reasons': ageRatingReasons,
      if (permissions != null) 'permissions': permissions,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (creatorDescription != null) 'creator_description': creatorDescription,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedSoftwareProductCompanion copyWith({
    Value<String>? productId,
    Value<String>? developerId,
    Value<List<String>?>? screenshots,
    Value<List<String>?>? supportedLanguages,
    Value<bool>? containsAds,
    Value<bool>? containsPaidContent,
    Value<String>? version,
    Value<String>? size,
    Value<Map<String, String>?>? eventText,
    Value<Map<String, String>>? whatsNewText,
    Value<int>? downloadCount,
    Value<int>? ageRating,
    Value<bool>? isKidsFriendly,
    Value<List<Map<String, String>>?>? ageRatingReasons,
    Value<List<Map<String, String>>?>? permissions,
    Value<DateTime>? lastUpdated,
    Value<Map<String, String>?>? creatorDescription,
    Value<int>? rowid,
  }) {
    return CachedSoftwareProductCompanion(
      productId: productId ?? this.productId,
      developerId: developerId ?? this.developerId,
      screenshots: screenshots ?? this.screenshots,
      supportedLanguages: supportedLanguages ?? this.supportedLanguages,
      containsAds: containsAds ?? this.containsAds,
      containsPaidContent: containsPaidContent ?? this.containsPaidContent,
      version: version ?? this.version,
      size: size ?? this.size,
      eventText: eventText ?? this.eventText,
      whatsNewText: whatsNewText ?? this.whatsNewText,
      downloadCount: downloadCount ?? this.downloadCount,
      ageRating: ageRating ?? this.ageRating,
      isKidsFriendly: isKidsFriendly ?? this.isKidsFriendly,
      ageRatingReasons: ageRatingReasons ?? this.ageRatingReasons,
      permissions: permissions ?? this.permissions,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      creatorDescription: creatorDescription ?? this.creatorDescription,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (developerId.present) {
      map['developer_id'] = Variable<String>(developerId.value);
    }
    if (screenshots.present) {
      map['screenshots'] = Variable<String>(
        $CachedSoftwareProductTable.$converterscreenshots.toSql(
          screenshots.value,
        ),
      );
    }
    if (supportedLanguages.present) {
      map['supported_languages'] = Variable<String>(
        $CachedSoftwareProductTable.$convertersupportedLanguages.toSql(
          supportedLanguages.value,
        ),
      );
    }
    if (containsAds.present) {
      map['contains_ads'] = Variable<bool>(containsAds.value);
    }
    if (containsPaidContent.present) {
      map['contains_paid_content'] = Variable<bool>(containsPaidContent.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (size.present) {
      map['size'] = Variable<String>(size.value);
    }
    if (eventText.present) {
      map['event_text'] = Variable<String>(
        $CachedSoftwareProductTable.$convertereventText.toSql(eventText.value),
      );
    }
    if (whatsNewText.present) {
      map['whats_new_text'] = Variable<String>(
        $CachedSoftwareProductTable.$converterwhatsNewText.toSql(
          whatsNewText.value,
        ),
      );
    }
    if (downloadCount.present) {
      map['download_count'] = Variable<int>(downloadCount.value);
    }
    if (ageRating.present) {
      map['age_rating'] = Variable<int>(ageRating.value);
    }
    if (isKidsFriendly.present) {
      map['is_kids_friendly'] = Variable<bool>(isKidsFriendly.value);
    }
    if (ageRatingReasons.present) {
      map['age_rating_reasons'] = Variable<String>(
        $CachedSoftwareProductTable.$converterageRatingReasons.toSql(
          ageRatingReasons.value,
        ),
      );
    }
    if (permissions.present) {
      map['permissions'] = Variable<String>(
        $CachedSoftwareProductTable.$converterpermissions.toSql(
          permissions.value,
        ),
      );
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (creatorDescription.present) {
      map['creator_description'] = Variable<String>(
        $CachedSoftwareProductTable.$convertercreatorDescription.toSql(
          creatorDescription.value,
        ),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedSoftwareProductCompanion(')
          ..write('productId: $productId, ')
          ..write('developerId: $developerId, ')
          ..write('screenshots: $screenshots, ')
          ..write('supportedLanguages: $supportedLanguages, ')
          ..write('containsAds: $containsAds, ')
          ..write('containsPaidContent: $containsPaidContent, ')
          ..write('version: $version, ')
          ..write('size: $size, ')
          ..write('eventText: $eventText, ')
          ..write('whatsNewText: $whatsNewText, ')
          ..write('downloadCount: $downloadCount, ')
          ..write('ageRating: $ageRating, ')
          ..write('isKidsFriendly: $isKidsFriendly, ')
          ..write('ageRatingReasons: $ageRatingReasons, ')
          ..write('permissions: $permissions, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('creatorDescription: $creatorDescription, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedGamesTable extends CachedGames
    with TableInfo<$CachedGamesTable, CachedGame> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedGamesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_software_product (product_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _technicalInfoMeta = const VerificationMeta(
    'technicalInfo',
  );
  @override
  late final GeneratedColumn<String> technicalInfo = GeneratedColumn<String>(
    'technical_info',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isOnlineMeta = const VerificationMeta(
    'isOnline',
  );
  @override
  late final GeneratedColumn<bool> isOnline = GeneratedColumn<bool>(
    'is_online',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_online" IN (0, 1))',
    ),
  );
  static const VerificationMeta _hasMultiplayerMeta = const VerificationMeta(
    'hasMultiplayer',
  );
  @override
  late final GeneratedColumn<bool> hasMultiplayer = GeneratedColumn<bool>(
    'has_multiplayer',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_multiplayer" IN (0, 1))',
    ),
  );
  static const VerificationMeta _gameModesMeta = const VerificationMeta(
    'gameModes',
  );
  @override
  late final GeneratedColumn<String> gameModes = GeneratedColumn<String>(
    'game_modes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hasControllerSupportMeta =
      const VerificationMeta('hasControllerSupport');
  @override
  late final GeneratedColumn<bool> hasControllerSupport = GeneratedColumn<bool>(
    'has_controller_support',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_controller_support" IN (0, 1))',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<
    List<Map<String, String>>?,
    String
  >
  achievements =
      GeneratedColumn<String>(
        'achievements',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<Map<String, String>>?>(
        $CachedGamesTable.$converterachievements,
      );
  @override
  List<GeneratedColumn> get $columns => [
    productId,
    technicalInfo,
    isOnline,
    hasMultiplayer,
    gameModes,
    hasControllerSupport,
    achievements,
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
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('technical_info')) {
      context.handle(
        _technicalInfoMeta,
        technicalInfo.isAcceptableOrUnknown(
          data['technical_info']!,
          _technicalInfoMeta,
        ),
      );
    }
    if (data.containsKey('is_online')) {
      context.handle(
        _isOnlineMeta,
        isOnline.isAcceptableOrUnknown(data['is_online']!, _isOnlineMeta),
      );
    }
    if (data.containsKey('has_multiplayer')) {
      context.handle(
        _hasMultiplayerMeta,
        hasMultiplayer.isAcceptableOrUnknown(
          data['has_multiplayer']!,
          _hasMultiplayerMeta,
        ),
      );
    }
    if (data.containsKey('game_modes')) {
      context.handle(
        _gameModesMeta,
        gameModes.isAcceptableOrUnknown(data['game_modes']!, _gameModesMeta),
      );
    }
    if (data.containsKey('has_controller_support')) {
      context.handle(
        _hasControllerSupportMeta,
        hasControllerSupport.isAcceptableOrUnknown(
          data['has_controller_support']!,
          _hasControllerSupportMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  CachedGame map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedGame(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      technicalInfo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}technical_info'],
      ),
      isOnline: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_online'],
      ),
      hasMultiplayer: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_multiplayer'],
      ),
      gameModes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}game_modes'],
      ),
      hasControllerSupport: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_controller_support'],
      ),
      achievements: $CachedGamesTable.$converterachievements.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}achievements'],
        ),
      ),
    );
  }

  @override
  $CachedGamesTable createAlias(String alias) {
    return $CachedGamesTable(attachedDatabase, alias);
  }

  static TypeConverter<List<Map<String, String>>?, String?>
  $converterachievements = const LocalizedStringListNullableConverter();
}

class CachedGame extends DataClass implements Insertable<CachedGame> {
  final String productId;
  final String? technicalInfo;
  final bool? isOnline;
  final bool? hasMultiplayer;
  final String? gameModes;
  final bool? hasControllerSupport;
  final List<Map<String, String>>? achievements;
  const CachedGame({
    required this.productId,
    this.technicalInfo,
    this.isOnline,
    this.hasMultiplayer,
    this.gameModes,
    this.hasControllerSupport,
    this.achievements,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    if (!nullToAbsent || technicalInfo != null) {
      map['technical_info'] = Variable<String>(technicalInfo);
    }
    if (!nullToAbsent || isOnline != null) {
      map['is_online'] = Variable<bool>(isOnline);
    }
    if (!nullToAbsent || hasMultiplayer != null) {
      map['has_multiplayer'] = Variable<bool>(hasMultiplayer);
    }
    if (!nullToAbsent || gameModes != null) {
      map['game_modes'] = Variable<String>(gameModes);
    }
    if (!nullToAbsent || hasControllerSupport != null) {
      map['has_controller_support'] = Variable<bool>(hasControllerSupport);
    }
    if (!nullToAbsent || achievements != null) {
      map['achievements'] = Variable<String>(
        $CachedGamesTable.$converterachievements.toSql(achievements),
      );
    }
    return map;
  }

  CachedGamesCompanion toCompanion(bool nullToAbsent) {
    return CachedGamesCompanion(
      productId: Value(productId),
      technicalInfo: technicalInfo == null && nullToAbsent
          ? const Value.absent()
          : Value(technicalInfo),
      isOnline: isOnline == null && nullToAbsent
          ? const Value.absent()
          : Value(isOnline),
      hasMultiplayer: hasMultiplayer == null && nullToAbsent
          ? const Value.absent()
          : Value(hasMultiplayer),
      gameModes: gameModes == null && nullToAbsent
          ? const Value.absent()
          : Value(gameModes),
      hasControllerSupport: hasControllerSupport == null && nullToAbsent
          ? const Value.absent()
          : Value(hasControllerSupport),
      achievements: achievements == null && nullToAbsent
          ? const Value.absent()
          : Value(achievements),
    );
  }

  factory CachedGame.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedGame(
      productId: serializer.fromJson<String>(json['productId']),
      technicalInfo: serializer.fromJson<String?>(json['technicalInfo']),
      isOnline: serializer.fromJson<bool?>(json['isOnline']),
      hasMultiplayer: serializer.fromJson<bool?>(json['hasMultiplayer']),
      gameModes: serializer.fromJson<String?>(json['gameModes']),
      hasControllerSupport: serializer.fromJson<bool?>(
        json['hasControllerSupport'],
      ),
      achievements: serializer.fromJson<List<Map<String, String>>?>(
        json['achievements'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'technicalInfo': serializer.toJson<String?>(technicalInfo),
      'isOnline': serializer.toJson<bool?>(isOnline),
      'hasMultiplayer': serializer.toJson<bool?>(hasMultiplayer),
      'gameModes': serializer.toJson<String?>(gameModes),
      'hasControllerSupport': serializer.toJson<bool?>(hasControllerSupport),
      'achievements': serializer.toJson<List<Map<String, String>>?>(
        achievements,
      ),
    };
  }

  CachedGame copyWith({
    String? productId,
    Value<String?> technicalInfo = const Value.absent(),
    Value<bool?> isOnline = const Value.absent(),
    Value<bool?> hasMultiplayer = const Value.absent(),
    Value<String?> gameModes = const Value.absent(),
    Value<bool?> hasControllerSupport = const Value.absent(),
    Value<List<Map<String, String>>?> achievements = const Value.absent(),
  }) => CachedGame(
    productId: productId ?? this.productId,
    technicalInfo: technicalInfo.present
        ? technicalInfo.value
        : this.technicalInfo,
    isOnline: isOnline.present ? isOnline.value : this.isOnline,
    hasMultiplayer: hasMultiplayer.present
        ? hasMultiplayer.value
        : this.hasMultiplayer,
    gameModes: gameModes.present ? gameModes.value : this.gameModes,
    hasControllerSupport: hasControllerSupport.present
        ? hasControllerSupport.value
        : this.hasControllerSupport,
    achievements: achievements.present ? achievements.value : this.achievements,
  );
  CachedGame copyWithCompanion(CachedGamesCompanion data) {
    return CachedGame(
      productId: data.productId.present ? data.productId.value : this.productId,
      technicalInfo: data.technicalInfo.present
          ? data.technicalInfo.value
          : this.technicalInfo,
      isOnline: data.isOnline.present ? data.isOnline.value : this.isOnline,
      hasMultiplayer: data.hasMultiplayer.present
          ? data.hasMultiplayer.value
          : this.hasMultiplayer,
      gameModes: data.gameModes.present ? data.gameModes.value : this.gameModes,
      hasControllerSupport: data.hasControllerSupport.present
          ? data.hasControllerSupport.value
          : this.hasControllerSupport,
      achievements: data.achievements.present
          ? data.achievements.value
          : this.achievements,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedGame(')
          ..write('productId: $productId, ')
          ..write('technicalInfo: $technicalInfo, ')
          ..write('isOnline: $isOnline, ')
          ..write('hasMultiplayer: $hasMultiplayer, ')
          ..write('gameModes: $gameModes, ')
          ..write('hasControllerSupport: $hasControllerSupport, ')
          ..write('achievements: $achievements')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    productId,
    technicalInfo,
    isOnline,
    hasMultiplayer,
    gameModes,
    hasControllerSupport,
    achievements,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedGame &&
          other.productId == this.productId &&
          other.technicalInfo == this.technicalInfo &&
          other.isOnline == this.isOnline &&
          other.hasMultiplayer == this.hasMultiplayer &&
          other.gameModes == this.gameModes &&
          other.hasControllerSupport == this.hasControllerSupport &&
          other.achievements == this.achievements);
}

class CachedGamesCompanion extends UpdateCompanion<CachedGame> {
  final Value<String> productId;
  final Value<String?> technicalInfo;
  final Value<bool?> isOnline;
  final Value<bool?> hasMultiplayer;
  final Value<String?> gameModes;
  final Value<bool?> hasControllerSupport;
  final Value<List<Map<String, String>>?> achievements;
  final Value<int> rowid;
  const CachedGamesCompanion({
    this.productId = const Value.absent(),
    this.technicalInfo = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.hasMultiplayer = const Value.absent(),
    this.gameModes = const Value.absent(),
    this.hasControllerSupport = const Value.absent(),
    this.achievements = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedGamesCompanion.insert({
    required String productId,
    this.technicalInfo = const Value.absent(),
    this.isOnline = const Value.absent(),
    this.hasMultiplayer = const Value.absent(),
    this.gameModes = const Value.absent(),
    this.hasControllerSupport = const Value.absent(),
    this.achievements = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : productId = Value(productId);
  static Insertable<CachedGame> custom({
    Expression<String>? productId,
    Expression<String>? technicalInfo,
    Expression<bool>? isOnline,
    Expression<bool>? hasMultiplayer,
    Expression<String>? gameModes,
    Expression<bool>? hasControllerSupport,
    Expression<String>? achievements,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (technicalInfo != null) 'technical_info': technicalInfo,
      if (isOnline != null) 'is_online': isOnline,
      if (hasMultiplayer != null) 'has_multiplayer': hasMultiplayer,
      if (gameModes != null) 'game_modes': gameModes,
      if (hasControllerSupport != null)
        'has_controller_support': hasControllerSupport,
      if (achievements != null) 'achievements': achievements,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedGamesCompanion copyWith({
    Value<String>? productId,
    Value<String?>? technicalInfo,
    Value<bool?>? isOnline,
    Value<bool?>? hasMultiplayer,
    Value<String?>? gameModes,
    Value<bool?>? hasControllerSupport,
    Value<List<Map<String, String>>?>? achievements,
    Value<int>? rowid,
  }) {
    return CachedGamesCompanion(
      productId: productId ?? this.productId,
      technicalInfo: technicalInfo ?? this.technicalInfo,
      isOnline: isOnline ?? this.isOnline,
      hasMultiplayer: hasMultiplayer ?? this.hasMultiplayer,
      gameModes: gameModes ?? this.gameModes,
      hasControllerSupport: hasControllerSupport ?? this.hasControllerSupport,
      achievements: achievements ?? this.achievements,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (technicalInfo.present) {
      map['technical_info'] = Variable<String>(technicalInfo.value);
    }
    if (isOnline.present) {
      map['is_online'] = Variable<bool>(isOnline.value);
    }
    if (hasMultiplayer.present) {
      map['has_multiplayer'] = Variable<bool>(hasMultiplayer.value);
    }
    if (gameModes.present) {
      map['game_modes'] = Variable<String>(gameModes.value);
    }
    if (hasControllerSupport.present) {
      map['has_controller_support'] = Variable<bool>(
        hasControllerSupport.value,
      );
    }
    if (achievements.present) {
      map['achievements'] = Variable<String>(
        $CachedGamesTable.$converterachievements.toSql(achievements.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedGamesCompanion(')
          ..write('productId: $productId, ')
          ..write('technicalInfo: $technicalInfo, ')
          ..write('isOnline: $isOnline, ')
          ..write('hasMultiplayer: $hasMultiplayer, ')
          ..write('gameModes: $gameModes, ')
          ..write('hasControllerSupport: $hasControllerSupport, ')
          ..write('achievements: $achievements, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedAppsTable extends CachedApps
    with TableInfo<$CachedAppsTable, CachedApp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedAppsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_software_product (product_id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _packageNameMeta = const VerificationMeta(
    'packageName',
  );
  @override
  late final GeneratedColumn<String> packageName = GeneratedColumn<String>(
    'package_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [productId, packageName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_apps';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedApp> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('package_name')) {
      context.handle(
        _packageNameMeta,
        packageName.isAcceptableOrUnknown(
          data['package_name']!,
          _packageNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_packageNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  CachedApp map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedApp(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      packageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}package_name'],
      )!,
    );
  }

  @override
  $CachedAppsTable createAlias(String alias) {
    return $CachedAppsTable(attachedDatabase, alias);
  }
}

class CachedApp extends DataClass implements Insertable<CachedApp> {
  final String productId;
  final String packageName;
  const CachedApp({required this.productId, required this.packageName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['package_name'] = Variable<String>(packageName);
    return map;
  }

  CachedAppsCompanion toCompanion(bool nullToAbsent) {
    return CachedAppsCompanion(
      productId: Value(productId),
      packageName: Value(packageName),
    );
  }

  factory CachedApp.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedApp(
      productId: serializer.fromJson<String>(json['productId']),
      packageName: serializer.fromJson<String>(json['packageName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'packageName': serializer.toJson<String>(packageName),
    };
  }

  CachedApp copyWith({String? productId, String? packageName}) => CachedApp(
    productId: productId ?? this.productId,
    packageName: packageName ?? this.packageName,
  );
  CachedApp copyWithCompanion(CachedAppsCompanion data) {
    return CachedApp(
      productId: data.productId.present ? data.productId.value : this.productId,
      packageName: data.packageName.present
          ? data.packageName.value
          : this.packageName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedApp(')
          ..write('productId: $productId, ')
          ..write('packageName: $packageName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, packageName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedApp &&
          other.productId == this.productId &&
          other.packageName == this.packageName);
}

class CachedAppsCompanion extends UpdateCompanion<CachedApp> {
  final Value<String> productId;
  final Value<String> packageName;
  final Value<int> rowid;
  const CachedAppsCompanion({
    this.productId = const Value.absent(),
    this.packageName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedAppsCompanion.insert({
    required String productId,
    required String packageName,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       packageName = Value(packageName);
  static Insertable<CachedApp> custom({
    Expression<String>? productId,
    Expression<String>? packageName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (packageName != null) 'package_name': packageName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedAppsCompanion copyWith({
    Value<String>? productId,
    Value<String>? packageName,
    Value<int>? rowid,
  }) {
    return CachedAppsCompanion(
      productId: productId ?? this.productId,
      packageName: packageName ?? this.packageName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (packageName.present) {
      map['package_name'] = Variable<String>(packageName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedAppsCompanion(')
          ..write('productId: $productId, ')
          ..write('packageName: $packageName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PublishersTable extends Publishers
    with TableInfo<$PublishersTable, Publisher> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PublishersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  publisher = GeneratedColumn<String>(
    'publisher',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($PublishersTable.$converterpublisher);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($PublishersTable.$converterdescription);
  @override
  List<GeneratedColumn> get $columns => [id, publisher, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'publishers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Publisher> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Publisher map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Publisher(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      publisher: $PublishersTable.$converterpublisher.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}publisher'],
        )!,
      ),
      description: $PublishersTable.$converterdescription.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}description'],
        )!,
      ),
    );
  }

  @override
  $PublishersTable createAlias(String alias) {
    return $PublishersTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $converterpublisher =
      const LocalizedStringConverter();
  static TypeConverter<Map<String, String>, String> $converterdescription =
      const LocalizedStringConverter();
}

class Publisher extends DataClass implements Insertable<Publisher> {
  final String id;
  final Map<String, String> publisher;
  final Map<String, String> description;
  const Publisher({
    required this.id,
    required this.publisher,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['publisher'] = Variable<String>(
        $PublishersTable.$converterpublisher.toSql(publisher),
      );
    }
    {
      map['description'] = Variable<String>(
        $PublishersTable.$converterdescription.toSql(description),
      );
    }
    return map;
  }

  PublishersCompanion toCompanion(bool nullToAbsent) {
    return PublishersCompanion(
      id: Value(id),
      publisher: Value(publisher),
      description: Value(description),
    );
  }

  factory Publisher.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Publisher(
      id: serializer.fromJson<String>(json['id']),
      publisher: serializer.fromJson<Map<String, String>>(json['publisher']),
      description: serializer.fromJson<Map<String, String>>(
        json['description'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'publisher': serializer.toJson<Map<String, String>>(publisher),
      'description': serializer.toJson<Map<String, String>>(description),
    };
  }

  Publisher copyWith({
    String? id,
    Map<String, String>? publisher,
    Map<String, String>? description,
  }) => Publisher(
    id: id ?? this.id,
    publisher: publisher ?? this.publisher,
    description: description ?? this.description,
  );
  Publisher copyWithCompanion(PublishersCompanion data) {
    return Publisher(
      id: data.id.present ? data.id.value : this.id,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Publisher(')
          ..write('id: $id, ')
          ..write('publisher: $publisher, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, publisher, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Publisher &&
          other.id == this.id &&
          other.publisher == this.publisher &&
          other.description == this.description);
}

class PublishersCompanion extends UpdateCompanion<Publisher> {
  final Value<String> id;
  final Value<Map<String, String>> publisher;
  final Value<Map<String, String>> description;
  final Value<int> rowid;
  const PublishersCompanion({
    this.id = const Value.absent(),
    this.publisher = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PublishersCompanion.insert({
    required String id,
    required Map<String, String> publisher,
    required Map<String, String> description,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       publisher = Value(publisher),
       description = Value(description);
  static Insertable<Publisher> custom({
    Expression<String>? id,
    Expression<String>? publisher,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (publisher != null) 'publisher': publisher,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PublishersCompanion copyWith({
    Value<String>? id,
    Value<Map<String, String>>? publisher,
    Value<Map<String, String>>? description,
    Value<int>? rowid,
  }) {
    return PublishersCompanion(
      id: id ?? this.id,
      publisher: publisher ?? this.publisher,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(
        $PublishersTable.$converterpublisher.toSql(publisher.value),
      );
    }
    if (description.present) {
      map['description'] = Variable<String>(
        $PublishersTable.$converterdescription.toSql(description.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PublishersCompanion(')
          ..write('id: $id, ')
          ..write('publisher: $publisher, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedBooksTable extends CachedBooks
    with TableInfo<$CachedBooksTable, CachedBook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedBooksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_product (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _publisherIdMeta = const VerificationMeta(
    'publisherId',
  );
  @override
  late final GeneratedColumn<String> publisherId = GeneratedColumn<String>(
    'publisher_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES publishers (id)',
    ),
  );
  static const VerificationMeta _pageCountMeta = const VerificationMeta(
    'pageCount',
  );
  @override
  late final GeneratedColumn<int> pageCount = GeneratedColumn<int>(
    'page_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
    'format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hasAudioVersionMeta = const VerificationMeta(
    'hasAudioVersion',
  );
  @override
  late final GeneratedColumn<bool> hasAudioVersion = GeneratedColumn<bool>(
    'has_audio_version',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("has_audio_version" IN (0, 1))',
    ),
  );
  static const VerificationMeta _audioDurationMeta = const VerificationMeta(
    'audioDuration',
  );
  @override
  late final GeneratedColumn<int> audioDuration = GeneratedColumn<int>(
    'audio_duration',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _narratorMeta = const VerificationMeta(
    'narrator',
  );
  @override
  late final GeneratedColumn<String> narrator = GeneratedColumn<String>(
    'narrator',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isSeriesMeta = const VerificationMeta(
    'isSeries',
  );
  @override
  late final GeneratedColumn<bool> isSeries = GeneratedColumn<bool>(
    'is_series',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_series" IN (0, 1))',
    ),
  );
  static const VerificationMeta _seriesNameMeta = const VerificationMeta(
    'seriesName',
  );
  @override
  late final GeneratedColumn<String> seriesName = GeneratedColumn<String>(
    'series_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seriesNumberMeta = const VerificationMeta(
    'seriesNumber',
  );
  @override
  late final GeneratedColumn<int> seriesNumber = GeneratedColumn<int>(
    'series_number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sampleAvailableMeta = const VerificationMeta(
    'sampleAvailable',
  );
  @override
  late final GeneratedColumn<bool> sampleAvailable = GeneratedColumn<bool>(
    'sample_available',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sample_available" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isAbridgedMeta = const VerificationMeta(
    'isAbridged',
  );
  @override
  late final GeneratedColumn<bool> isAbridged = GeneratedColumn<bool>(
    'is_abridged',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_abridged" IN (0, 1))',
    ),
  );
  static const VerificationMeta _publicationDateMeta = const VerificationMeta(
    'publicationDate',
  );
  @override
  late final GeneratedColumn<DateTime> publicationDate =
      GeneratedColumn<DateTime>(
        'publication_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>?, String> awards =
      GeneratedColumn<String>(
        'awards',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<String>?>($CachedBooksTable.$converterawards);
  @override
  List<GeneratedColumn> get $columns => [
    productId,
    publisherId,
    pageCount,
    language,
    format,
    hasAudioVersion,
    audioDuration,
    narrator,
    isSeries,
    seriesName,
    seriesNumber,
    sampleAvailable,
    isAbridged,
    publicationDate,
    awards,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_books';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedBook> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('publisher_id')) {
      context.handle(
        _publisherIdMeta,
        publisherId.isAcceptableOrUnknown(
          data['publisher_id']!,
          _publisherIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publisherIdMeta);
    }
    if (data.containsKey('page_count')) {
      context.handle(
        _pageCountMeta,
        pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta),
      );
    } else if (isInserting) {
      context.missing(_pageCountMeta);
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('format')) {
      context.handle(
        _formatMeta,
        format.isAcceptableOrUnknown(data['format']!, _formatMeta),
      );
    } else if (isInserting) {
      context.missing(_formatMeta);
    }
    if (data.containsKey('has_audio_version')) {
      context.handle(
        _hasAudioVersionMeta,
        hasAudioVersion.isAcceptableOrUnknown(
          data['has_audio_version']!,
          _hasAudioVersionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hasAudioVersionMeta);
    }
    if (data.containsKey('audio_duration')) {
      context.handle(
        _audioDurationMeta,
        audioDuration.isAcceptableOrUnknown(
          data['audio_duration']!,
          _audioDurationMeta,
        ),
      );
    }
    if (data.containsKey('narrator')) {
      context.handle(
        _narratorMeta,
        narrator.isAcceptableOrUnknown(data['narrator']!, _narratorMeta),
      );
    }
    if (data.containsKey('is_series')) {
      context.handle(
        _isSeriesMeta,
        isSeries.isAcceptableOrUnknown(data['is_series']!, _isSeriesMeta),
      );
    } else if (isInserting) {
      context.missing(_isSeriesMeta);
    }
    if (data.containsKey('series_name')) {
      context.handle(
        _seriesNameMeta,
        seriesName.isAcceptableOrUnknown(data['series_name']!, _seriesNameMeta),
      );
    }
    if (data.containsKey('series_number')) {
      context.handle(
        _seriesNumberMeta,
        seriesNumber.isAcceptableOrUnknown(
          data['series_number']!,
          _seriesNumberMeta,
        ),
      );
    }
    if (data.containsKey('sample_available')) {
      context.handle(
        _sampleAvailableMeta,
        sampleAvailable.isAcceptableOrUnknown(
          data['sample_available']!,
          _sampleAvailableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sampleAvailableMeta);
    }
    if (data.containsKey('is_abridged')) {
      context.handle(
        _isAbridgedMeta,
        isAbridged.isAcceptableOrUnknown(data['is_abridged']!, _isAbridgedMeta),
      );
    } else if (isInserting) {
      context.missing(_isAbridgedMeta);
    }
    if (data.containsKey('publication_date')) {
      context.handle(
        _publicationDateMeta,
        publicationDate.isAcceptableOrUnknown(
          data['publication_date']!,
          _publicationDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publicationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  CachedBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedBook(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      publisherId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}publisher_id'],
      )!,
      pageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_count'],
      )!,
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      )!,
      format: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}format'],
      )!,
      hasAudioVersion: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}has_audio_version'],
      )!,
      audioDuration: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}audio_duration'],
      ),
      narrator: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}narrator'],
      ),
      isSeries: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_series'],
      )!,
      seriesName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}series_name'],
      ),
      seriesNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}series_number'],
      ),
      sampleAvailable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sample_available'],
      )!,
      isAbridged: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_abridged'],
      )!,
      publicationDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}publication_date'],
      )!,
      awards: $CachedBooksTable.$converterawards.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}awards'],
        ),
      ),
    );
  }

  @override
  $CachedBooksTable createAlias(String alias) {
    return $CachedBooksTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>?, String?> $converterawards =
      const StringListNullableConverter();
}

class CachedBook extends DataClass implements Insertable<CachedBook> {
  final String productId;
  final String publisherId;
  final int pageCount;
  final String language;
  final String format;
  final bool hasAudioVersion;
  final int? audioDuration;
  final String? narrator;
  final bool isSeries;
  final String? seriesName;
  final int? seriesNumber;
  final bool sampleAvailable;
  final bool isAbridged;
  final DateTime publicationDate;
  final List<String>? awards;
  const CachedBook({
    required this.productId,
    required this.publisherId,
    required this.pageCount,
    required this.language,
    required this.format,
    required this.hasAudioVersion,
    this.audioDuration,
    this.narrator,
    required this.isSeries,
    this.seriesName,
    this.seriesNumber,
    required this.sampleAvailable,
    required this.isAbridged,
    required this.publicationDate,
    this.awards,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['publisher_id'] = Variable<String>(publisherId);
    map['page_count'] = Variable<int>(pageCount);
    map['language'] = Variable<String>(language);
    map['format'] = Variable<String>(format);
    map['has_audio_version'] = Variable<bool>(hasAudioVersion);
    if (!nullToAbsent || audioDuration != null) {
      map['audio_duration'] = Variable<int>(audioDuration);
    }
    if (!nullToAbsent || narrator != null) {
      map['narrator'] = Variable<String>(narrator);
    }
    map['is_series'] = Variable<bool>(isSeries);
    if (!nullToAbsent || seriesName != null) {
      map['series_name'] = Variable<String>(seriesName);
    }
    if (!nullToAbsent || seriesNumber != null) {
      map['series_number'] = Variable<int>(seriesNumber);
    }
    map['sample_available'] = Variable<bool>(sampleAvailable);
    map['is_abridged'] = Variable<bool>(isAbridged);
    map['publication_date'] = Variable<DateTime>(publicationDate);
    if (!nullToAbsent || awards != null) {
      map['awards'] = Variable<String>(
        $CachedBooksTable.$converterawards.toSql(awards),
      );
    }
    return map;
  }

  CachedBooksCompanion toCompanion(bool nullToAbsent) {
    return CachedBooksCompanion(
      productId: Value(productId),
      publisherId: Value(publisherId),
      pageCount: Value(pageCount),
      language: Value(language),
      format: Value(format),
      hasAudioVersion: Value(hasAudioVersion),
      audioDuration: audioDuration == null && nullToAbsent
          ? const Value.absent()
          : Value(audioDuration),
      narrator: narrator == null && nullToAbsent
          ? const Value.absent()
          : Value(narrator),
      isSeries: Value(isSeries),
      seriesName: seriesName == null && nullToAbsent
          ? const Value.absent()
          : Value(seriesName),
      seriesNumber: seriesNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(seriesNumber),
      sampleAvailable: Value(sampleAvailable),
      isAbridged: Value(isAbridged),
      publicationDate: Value(publicationDate),
      awards: awards == null && nullToAbsent
          ? const Value.absent()
          : Value(awards),
    );
  }

  factory CachedBook.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedBook(
      productId: serializer.fromJson<String>(json['productId']),
      publisherId: serializer.fromJson<String>(json['publisherId']),
      pageCount: serializer.fromJson<int>(json['pageCount']),
      language: serializer.fromJson<String>(json['language']),
      format: serializer.fromJson<String>(json['format']),
      hasAudioVersion: serializer.fromJson<bool>(json['hasAudioVersion']),
      audioDuration: serializer.fromJson<int?>(json['audioDuration']),
      narrator: serializer.fromJson<String?>(json['narrator']),
      isSeries: serializer.fromJson<bool>(json['isSeries']),
      seriesName: serializer.fromJson<String?>(json['seriesName']),
      seriesNumber: serializer.fromJson<int?>(json['seriesNumber']),
      sampleAvailable: serializer.fromJson<bool>(json['sampleAvailable']),
      isAbridged: serializer.fromJson<bool>(json['isAbridged']),
      publicationDate: serializer.fromJson<DateTime>(json['publicationDate']),
      awards: serializer.fromJson<List<String>?>(json['awards']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'publisherId': serializer.toJson<String>(publisherId),
      'pageCount': serializer.toJson<int>(pageCount),
      'language': serializer.toJson<String>(language),
      'format': serializer.toJson<String>(format),
      'hasAudioVersion': serializer.toJson<bool>(hasAudioVersion),
      'audioDuration': serializer.toJson<int?>(audioDuration),
      'narrator': serializer.toJson<String?>(narrator),
      'isSeries': serializer.toJson<bool>(isSeries),
      'seriesName': serializer.toJson<String?>(seriesName),
      'seriesNumber': serializer.toJson<int?>(seriesNumber),
      'sampleAvailable': serializer.toJson<bool>(sampleAvailable),
      'isAbridged': serializer.toJson<bool>(isAbridged),
      'publicationDate': serializer.toJson<DateTime>(publicationDate),
      'awards': serializer.toJson<List<String>?>(awards),
    };
  }

  CachedBook copyWith({
    String? productId,
    String? publisherId,
    int? pageCount,
    String? language,
    String? format,
    bool? hasAudioVersion,
    Value<int?> audioDuration = const Value.absent(),
    Value<String?> narrator = const Value.absent(),
    bool? isSeries,
    Value<String?> seriesName = const Value.absent(),
    Value<int?> seriesNumber = const Value.absent(),
    bool? sampleAvailable,
    bool? isAbridged,
    DateTime? publicationDate,
    Value<List<String>?> awards = const Value.absent(),
  }) => CachedBook(
    productId: productId ?? this.productId,
    publisherId: publisherId ?? this.publisherId,
    pageCount: pageCount ?? this.pageCount,
    language: language ?? this.language,
    format: format ?? this.format,
    hasAudioVersion: hasAudioVersion ?? this.hasAudioVersion,
    audioDuration: audioDuration.present
        ? audioDuration.value
        : this.audioDuration,
    narrator: narrator.present ? narrator.value : this.narrator,
    isSeries: isSeries ?? this.isSeries,
    seriesName: seriesName.present ? seriesName.value : this.seriesName,
    seriesNumber: seriesNumber.present ? seriesNumber.value : this.seriesNumber,
    sampleAvailable: sampleAvailable ?? this.sampleAvailable,
    isAbridged: isAbridged ?? this.isAbridged,
    publicationDate: publicationDate ?? this.publicationDate,
    awards: awards.present ? awards.value : this.awards,
  );
  CachedBook copyWithCompanion(CachedBooksCompanion data) {
    return CachedBook(
      productId: data.productId.present ? data.productId.value : this.productId,
      publisherId: data.publisherId.present
          ? data.publisherId.value
          : this.publisherId,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      language: data.language.present ? data.language.value : this.language,
      format: data.format.present ? data.format.value : this.format,
      hasAudioVersion: data.hasAudioVersion.present
          ? data.hasAudioVersion.value
          : this.hasAudioVersion,
      audioDuration: data.audioDuration.present
          ? data.audioDuration.value
          : this.audioDuration,
      narrator: data.narrator.present ? data.narrator.value : this.narrator,
      isSeries: data.isSeries.present ? data.isSeries.value : this.isSeries,
      seriesName: data.seriesName.present
          ? data.seriesName.value
          : this.seriesName,
      seriesNumber: data.seriesNumber.present
          ? data.seriesNumber.value
          : this.seriesNumber,
      sampleAvailable: data.sampleAvailable.present
          ? data.sampleAvailable.value
          : this.sampleAvailable,
      isAbridged: data.isAbridged.present
          ? data.isAbridged.value
          : this.isAbridged,
      publicationDate: data.publicationDate.present
          ? data.publicationDate.value
          : this.publicationDate,
      awards: data.awards.present ? data.awards.value : this.awards,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedBook(')
          ..write('productId: $productId, ')
          ..write('publisherId: $publisherId, ')
          ..write('pageCount: $pageCount, ')
          ..write('language: $language, ')
          ..write('format: $format, ')
          ..write('hasAudioVersion: $hasAudioVersion, ')
          ..write('audioDuration: $audioDuration, ')
          ..write('narrator: $narrator, ')
          ..write('isSeries: $isSeries, ')
          ..write('seriesName: $seriesName, ')
          ..write('seriesNumber: $seriesNumber, ')
          ..write('sampleAvailable: $sampleAvailable, ')
          ..write('isAbridged: $isAbridged, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('awards: $awards')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    productId,
    publisherId,
    pageCount,
    language,
    format,
    hasAudioVersion,
    audioDuration,
    narrator,
    isSeries,
    seriesName,
    seriesNumber,
    sampleAvailable,
    isAbridged,
    publicationDate,
    awards,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedBook &&
          other.productId == this.productId &&
          other.publisherId == this.publisherId &&
          other.pageCount == this.pageCount &&
          other.language == this.language &&
          other.format == this.format &&
          other.hasAudioVersion == this.hasAudioVersion &&
          other.audioDuration == this.audioDuration &&
          other.narrator == this.narrator &&
          other.isSeries == this.isSeries &&
          other.seriesName == this.seriesName &&
          other.seriesNumber == this.seriesNumber &&
          other.sampleAvailable == this.sampleAvailable &&
          other.isAbridged == this.isAbridged &&
          other.publicationDate == this.publicationDate &&
          other.awards == this.awards);
}

class CachedBooksCompanion extends UpdateCompanion<CachedBook> {
  final Value<String> productId;
  final Value<String> publisherId;
  final Value<int> pageCount;
  final Value<String> language;
  final Value<String> format;
  final Value<bool> hasAudioVersion;
  final Value<int?> audioDuration;
  final Value<String?> narrator;
  final Value<bool> isSeries;
  final Value<String?> seriesName;
  final Value<int?> seriesNumber;
  final Value<bool> sampleAvailable;
  final Value<bool> isAbridged;
  final Value<DateTime> publicationDate;
  final Value<List<String>?> awards;
  final Value<int> rowid;
  const CachedBooksCompanion({
    this.productId = const Value.absent(),
    this.publisherId = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.language = const Value.absent(),
    this.format = const Value.absent(),
    this.hasAudioVersion = const Value.absent(),
    this.audioDuration = const Value.absent(),
    this.narrator = const Value.absent(),
    this.isSeries = const Value.absent(),
    this.seriesName = const Value.absent(),
    this.seriesNumber = const Value.absent(),
    this.sampleAvailable = const Value.absent(),
    this.isAbridged = const Value.absent(),
    this.publicationDate = const Value.absent(),
    this.awards = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedBooksCompanion.insert({
    required String productId,
    required String publisherId,
    required int pageCount,
    required String language,
    required String format,
    required bool hasAudioVersion,
    this.audioDuration = const Value.absent(),
    this.narrator = const Value.absent(),
    required bool isSeries,
    this.seriesName = const Value.absent(),
    this.seriesNumber = const Value.absent(),
    required bool sampleAvailable,
    required bool isAbridged,
    required DateTime publicationDate,
    this.awards = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       publisherId = Value(publisherId),
       pageCount = Value(pageCount),
       language = Value(language),
       format = Value(format),
       hasAudioVersion = Value(hasAudioVersion),
       isSeries = Value(isSeries),
       sampleAvailable = Value(sampleAvailable),
       isAbridged = Value(isAbridged),
       publicationDate = Value(publicationDate);
  static Insertable<CachedBook> custom({
    Expression<String>? productId,
    Expression<String>? publisherId,
    Expression<int>? pageCount,
    Expression<String>? language,
    Expression<String>? format,
    Expression<bool>? hasAudioVersion,
    Expression<int>? audioDuration,
    Expression<String>? narrator,
    Expression<bool>? isSeries,
    Expression<String>? seriesName,
    Expression<int>? seriesNumber,
    Expression<bool>? sampleAvailable,
    Expression<bool>? isAbridged,
    Expression<DateTime>? publicationDate,
    Expression<String>? awards,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (publisherId != null) 'publisher_id': publisherId,
      if (pageCount != null) 'page_count': pageCount,
      if (language != null) 'language': language,
      if (format != null) 'format': format,
      if (hasAudioVersion != null) 'has_audio_version': hasAudioVersion,
      if (audioDuration != null) 'audio_duration': audioDuration,
      if (narrator != null) 'narrator': narrator,
      if (isSeries != null) 'is_series': isSeries,
      if (seriesName != null) 'series_name': seriesName,
      if (seriesNumber != null) 'series_number': seriesNumber,
      if (sampleAvailable != null) 'sample_available': sampleAvailable,
      if (isAbridged != null) 'is_abridged': isAbridged,
      if (publicationDate != null) 'publication_date': publicationDate,
      if (awards != null) 'awards': awards,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedBooksCompanion copyWith({
    Value<String>? productId,
    Value<String>? publisherId,
    Value<int>? pageCount,
    Value<String>? language,
    Value<String>? format,
    Value<bool>? hasAudioVersion,
    Value<int?>? audioDuration,
    Value<String?>? narrator,
    Value<bool>? isSeries,
    Value<String?>? seriesName,
    Value<int?>? seriesNumber,
    Value<bool>? sampleAvailable,
    Value<bool>? isAbridged,
    Value<DateTime>? publicationDate,
    Value<List<String>?>? awards,
    Value<int>? rowid,
  }) {
    return CachedBooksCompanion(
      productId: productId ?? this.productId,
      publisherId: publisherId ?? this.publisherId,
      pageCount: pageCount ?? this.pageCount,
      language: language ?? this.language,
      format: format ?? this.format,
      hasAudioVersion: hasAudioVersion ?? this.hasAudioVersion,
      audioDuration: audioDuration ?? this.audioDuration,
      narrator: narrator ?? this.narrator,
      isSeries: isSeries ?? this.isSeries,
      seriesName: seriesName ?? this.seriesName,
      seriesNumber: seriesNumber ?? this.seriesNumber,
      sampleAvailable: sampleAvailable ?? this.sampleAvailable,
      isAbridged: isAbridged ?? this.isAbridged,
      publicationDate: publicationDate ?? this.publicationDate,
      awards: awards ?? this.awards,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (publisherId.present) {
      map['publisher_id'] = Variable<String>(publisherId.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (hasAudioVersion.present) {
      map['has_audio_version'] = Variable<bool>(hasAudioVersion.value);
    }
    if (audioDuration.present) {
      map['audio_duration'] = Variable<int>(audioDuration.value);
    }
    if (narrator.present) {
      map['narrator'] = Variable<String>(narrator.value);
    }
    if (isSeries.present) {
      map['is_series'] = Variable<bool>(isSeries.value);
    }
    if (seriesName.present) {
      map['series_name'] = Variable<String>(seriesName.value);
    }
    if (seriesNumber.present) {
      map['series_number'] = Variable<int>(seriesNumber.value);
    }
    if (sampleAvailable.present) {
      map['sample_available'] = Variable<bool>(sampleAvailable.value);
    }
    if (isAbridged.present) {
      map['is_abridged'] = Variable<bool>(isAbridged.value);
    }
    if (publicationDate.present) {
      map['publication_date'] = Variable<DateTime>(publicationDate.value);
    }
    if (awards.present) {
      map['awards'] = Variable<String>(
        $CachedBooksTable.$converterawards.toSql(awards.value),
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedBooksCompanion(')
          ..write('productId: $productId, ')
          ..write('publisherId: $publisherId, ')
          ..write('pageCount: $pageCount, ')
          ..write('language: $language, ')
          ..write('format: $format, ')
          ..write('hasAudioVersion: $hasAudioVersion, ')
          ..write('audioDuration: $audioDuration, ')
          ..write('narrator: $narrator, ')
          ..write('isSeries: $isSeries, ')
          ..write('seriesName: $seriesName, ')
          ..write('seriesNumber: $seriesNumber, ')
          ..write('sampleAvailable: $sampleAvailable, ')
          ..write('isAbridged: $isAbridged, ')
          ..write('publicationDate: $publicationDate, ')
          ..write('awards: $awards, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($CategoriesTable.$convertername);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<Category> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Category(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: $CategoriesTable.$convertername.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}name'],
        )!,
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $convertername =
      const LocalizedStringConverter();
}

class Category extends DataClass implements Insertable<Category> {
  final String id;
  final Map<String, String> name;
  final String type;
  const Category({required this.id, required this.name, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['name'] = Variable<String>(
        $CategoriesTable.$convertername.toSql(name),
      );
    }
    map['type'] = Variable<String>(type);
    return map;
  }

  CategoriesCompanion toCompanion(bool nullToAbsent) {
    return CategoriesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
    );
  }

  factory Category.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<Map<String, String>>(json['name']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<Map<String, String>>(name),
      'type': serializer.toJson<String>(type),
    };
  }

  Category copyWith({String? id, Map<String, String>? name, String? type}) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
      );
  Category copyWithCompanion(CategoriesCompanion data) {
    return Category(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<String> id;
  final Value<Map<String, String>> name;
  final Value<String> type;
  final Value<int> rowid;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesCompanion.insert({
    required String id,
    required Map<String, String> name,
    required String type,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type);
  static Insertable<Category> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesCompanion copyWith({
    Value<String>? id,
    Value<Map<String, String>>? name,
    Value<String>? type,
    Value<int>? rowid,
  }) {
    return CategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(
        $CategoriesTable.$convertername.toSql(name.value),
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TagsTable extends Tags with TableInfo<$TagsTable, Tag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
  name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<Map<String, String>>($TagsTable.$convertername);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<Tag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tag(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: $TagsTable.$convertername.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}name'],
        )!,
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
    );
  }

  @override
  $TagsTable createAlias(String alias) {
    return $TagsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $convertername =
      const LocalizedStringConverter();
}

class Tag extends DataClass implements Insertable<Tag> {
  final String id;
  final Map<String, String> name;
  final String type;
  const Tag({required this.id, required this.name, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['name'] = Variable<String>($TagsTable.$convertername.toSql(name));
    }
    map['type'] = Variable<String>(type);
    return map;
  }

  TagsCompanion toCompanion(bool nullToAbsent) {
    return TagsCompanion(id: Value(id), name: Value(name), type: Value(type));
  }

  factory Tag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tag(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<Map<String, String>>(json['name']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<Map<String, String>>(name),
      'type': serializer.toJson<String>(type),
    };
  }

  Tag copyWith({String? id, Map<String, String>? name, String? type}) =>
      Tag(id: id ?? this.id, name: name ?? this.name, type: type ?? this.type);
  Tag copyWithCompanion(TagsCompanion data) {
    return Tag(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Tag(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tag &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type);
}

class TagsCompanion extends UpdateCompanion<Tag> {
  final Value<String> id;
  final Value<Map<String, String>> name;
  final Value<String> type;
  final Value<int> rowid;
  const TagsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TagsCompanion.insert({
    required String id,
    required Map<String, String> name,
    required String type,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type);
  static Insertable<Tag> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TagsCompanion copyWith({
    Value<String>? id,
    Value<Map<String, String>>? name,
    Value<String>? type,
    Value<int>? rowid,
  }) {
    return TagsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(
        $TagsTable.$convertername.toSql(name.value),
      );
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductCategoriesTable extends ProductCategories
    with TableInfo<$ProductCategoriesTable, ProductCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_product (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
    'category_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES categories (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [productId, categoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, categoryId};
  @override
  ProductCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductCategory(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_id'],
      )!,
    );
  }

  @override
  $ProductCategoriesTable createAlias(String alias) {
    return $ProductCategoriesTable(attachedDatabase, alias);
  }
}

class ProductCategory extends DataClass implements Insertable<ProductCategory> {
  final String productId;
  final String categoryId;
  const ProductCategory({required this.productId, required this.categoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['category_id'] = Variable<String>(categoryId);
    return map;
  }

  ProductCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ProductCategoriesCompanion(
      productId: Value(productId),
      categoryId: Value(categoryId),
    );
  }

  factory ProductCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductCategory(
      productId: serializer.fromJson<String>(json['productId']),
      categoryId: serializer.fromJson<String>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'categoryId': serializer.toJson<String>(categoryId),
    };
  }

  ProductCategory copyWith({String? productId, String? categoryId}) =>
      ProductCategory(
        productId: productId ?? this.productId,
        categoryId: categoryId ?? this.categoryId,
      );
  ProductCategory copyWithCompanion(ProductCategoriesCompanion data) {
    return ProductCategory(
      productId: data.productId.present ? data.productId.value : this.productId,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductCategory(')
          ..write('productId: $productId, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductCategory &&
          other.productId == this.productId &&
          other.categoryId == this.categoryId);
}

class ProductCategoriesCompanion extends UpdateCompanion<ProductCategory> {
  final Value<String> productId;
  final Value<String> categoryId;
  final Value<int> rowid;
  const ProductCategoriesCompanion({
    this.productId = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductCategoriesCompanion.insert({
    required String productId,
    required String categoryId,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       categoryId = Value(categoryId);
  static Insertable<ProductCategory> custom({
    Expression<String>? productId,
    Expression<String>? categoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (categoryId != null) 'category_id': categoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductCategoriesCompanion copyWith({
    Value<String>? productId,
    Value<String>? categoryId,
    Value<int>? rowid,
  }) {
    return ProductCategoriesCompanion(
      productId: productId ?? this.productId,
      categoryId: categoryId ?? this.categoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductCategoriesCompanion(')
          ..write('productId: $productId, ')
          ..write('categoryId: $categoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductTagsTable extends ProductTags
    with TableInfo<$ProductTagsTable, ProductTag> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTagsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_product (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<String> tagId = GeneratedColumn<String>(
    'tag_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tags (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [productId, tagId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_tags';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductTag> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
        _tagIdMeta,
        tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta),
      );
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, tagId};
  @override
  ProductTag map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductTag(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}product_id'],
      )!,
      tagId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag_id'],
      )!,
    );
  }

  @override
  $ProductTagsTable createAlias(String alias) {
    return $ProductTagsTable(attachedDatabase, alias);
  }
}

class ProductTag extends DataClass implements Insertable<ProductTag> {
  final String productId;
  final String tagId;
  const ProductTag({required this.productId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['tag_id'] = Variable<String>(tagId);
    return map;
  }

  ProductTagsCompanion toCompanion(bool nullToAbsent) {
    return ProductTagsCompanion(
      productId: Value(productId),
      tagId: Value(tagId),
    );
  }

  factory ProductTag.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductTag(
      productId: serializer.fromJson<String>(json['productId']),
      tagId: serializer.fromJson<String>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'tagId': serializer.toJson<String>(tagId),
    };
  }

  ProductTag copyWith({String? productId, String? tagId}) => ProductTag(
    productId: productId ?? this.productId,
    tagId: tagId ?? this.tagId,
  );
  ProductTag copyWithCompanion(ProductTagsCompanion data) {
    return ProductTag(
      productId: data.productId.present ? data.productId.value : this.productId,
      tagId: data.tagId.present ? data.tagId.value : this.tagId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductTag(')
          ..write('productId: $productId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(productId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductTag &&
          other.productId == this.productId &&
          other.tagId == this.tagId);
}

class ProductTagsCompanion extends UpdateCompanion<ProductTag> {
  final Value<String> productId;
  final Value<String> tagId;
  final Value<int> rowid;
  const ProductTagsCompanion({
    this.productId = const Value.absent(),
    this.tagId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductTagsCompanion.insert({
    required String productId,
    required String tagId,
    this.rowid = const Value.absent(),
  }) : productId = Value(productId),
       tagId = Value(tagId);
  static Insertable<ProductTag> custom({
    Expression<String>? productId,
    Expression<String>? tagId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (tagId != null) 'tag_id': tagId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductTagsCompanion copyWith({
    Value<String>? productId,
    Value<String>? tagId,
    Value<int>? rowid,
  }) {
    return ProductTagsCompanion(
      productId: productId ?? this.productId,
      tagId: tagId ?? this.tagId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<String>(tagId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTagsCompanion(')
          ..write('productId: $productId, ')
          ..write('tagId: $tagId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedProductTable cachedProduct = $CachedProductTable(this);
  late final $ProductTranslationsTable productTranslations =
      $ProductTranslationsTable(this);
  late final ProductTitleFts productTitleFts = ProductTitleFts(this);
  late final Trigger productTranslationsInTitleFts = Trigger(
    'CREATE TRIGGER product_translations_in_title_fts AFTER INSERT ON product_translations WHEN new.field = \'title\' BEGIN INSERT INTO product_title_fts ("rowid", value) VALUES (new."rowid", new.value);END',
    'product_translations_in_title_fts',
  );
  late final Trigger productTranslationsDelTitleFts = Trigger(
    'CREATE TRIGGER product_translations_del_title_fts AFTER DELETE ON product_translations BEGIN DELETE FROM product_title_fts WHERE "rowid" = old."rowid";END',
    'product_translations_del_title_fts',
  );
  late final Trigger productTranslationsUpTitleFts = Trigger(
    'CREATE TRIGGER product_translations_up_title_fts AFTER UPDATE ON product_translations BEGIN DELETE FROM product_title_fts WHERE "rowid" = old."rowid";INSERT INTO product_title_fts ("rowid", value) SELECT new."rowid", new.value WHERE new.field = \'title\';END',
    'product_translations_up_title_fts',
  );
  late final $SyncStateTable syncState = $SyncStateTable(this);
  late final $DevelopersTable developers = $DevelopersTable(this);
  late final $CachedSoftwareProductTable cachedSoftwareProduct =
      $CachedSoftwareProductTable(this);
  late final $CachedGamesTable cachedGames = $CachedGamesTable(this);
  late final $CachedAppsTable cachedApps = $CachedAppsTable(this);
  late final $PublishersTable publishers = $PublishersTable(this);
  late final $CachedBooksTable cachedBooks = $CachedBooksTable(this);
  late final $CategoriesTable categories = $CategoriesTable(this);
  late final $TagsTable tags = $TagsTable(this);
  late final $ProductCategoriesTable productCategories =
      $ProductCategoriesTable(this);
  late final $ProductTagsTable productTags = $ProductTagsTable(this);
  Selectable<CachedProductData> searchProductsByTitle(
    String lang,
    String query,
  ) {
    return customSelect(
      'SELECT DISTINCT cp.* FROM product_title_fts JOIN product_translations AS pt ON pt."rowid" = product_title_fts."rowid" AND pt.field = \'title\' AND pt.language = ?1 JOIN cached_product AS cp ON cp.id = pt.product_id WHERE product_title_fts MATCH ?2',
      variables: [Variable<String>(lang), Variable<String>(query)],
      readsFrom: {productTitleFts, productTranslations, cachedProduct},
    ).asyncMap(cachedProduct.mapFromRow);
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedProduct,
    productTranslations,
    productTitleFts,
    productTranslationsInTitleFts,
    productTranslationsDelTitleFts,
    productTranslationsUpTitleFts,
    syncState,
    developers,
    cachedSoftwareProduct,
    cachedGames,
    cachedApps,
    publishers,
    cachedBooks,
    categories,
    tags,
    productCategories,
    productTags,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_product',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('product_translations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'product_translations',
        limitUpdateKind: UpdateKind.insert,
      ),
      result: [TableUpdate('product_title_fts', kind: UpdateKind.insert)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'product_translations',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('product_title_fts', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'product_translations',
        limitUpdateKind: UpdateKind.update,
      ),
      result: [
        TableUpdate('product_title_fts', kind: UpdateKind.delete),
        TableUpdate('product_title_fts', kind: UpdateKind.insert),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_product',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cached_software_product', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_software_product',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cached_games', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_software_product',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cached_apps', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_product',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('cached_books', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_product',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('product_categories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'categories',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('product_categories', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'cached_product',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('product_tags', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'tags',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('product_tags', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$CachedProductTableCreateCompanionBuilder =
    CachedProductCompanion Function({
      required String id,
      required String externalId,
      required String type,
      required Map<String, String> title,
      required Map<String, String> shortDescription,
      required Map<String, String> description,
      required double rating,
      required int reviewsCount,
      required DateTime releaseDate,
      required String iconUrl,
      required bool isPaid,
      Value<double?> price,
      required String currencyCode,
      Value<double?> discountPrice,
      required String url,
      Value<int> rowid,
    });
typedef $$CachedProductTableUpdateCompanionBuilder =
    CachedProductCompanion Function({
      Value<String> id,
      Value<String> externalId,
      Value<String> type,
      Value<Map<String, String>> title,
      Value<Map<String, String>> shortDescription,
      Value<Map<String, String>> description,
      Value<double> rating,
      Value<int> reviewsCount,
      Value<DateTime> releaseDate,
      Value<String> iconUrl,
      Value<bool> isPaid,
      Value<double?> price,
      Value<String> currencyCode,
      Value<double?> discountPrice,
      Value<String> url,
      Value<int> rowid,
    });

final class $$CachedProductTableReferences
    extends
        BaseReferences<_$AppDatabase, $CachedProductTable, CachedProductData> {
  $$CachedProductTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $ProductTranslationsTable,
    List<ProductTranslation>
  >
  _productTranslationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productTranslations,
        aliasName: $_aliasNameGenerator(
          db.cachedProduct.id,
          db.productTranslations.productId,
        ),
      );

  $$ProductTranslationsTableProcessedTableManager get productTranslationsRefs {
    final manager = $$ProductTranslationsTableTableManager(
      $_db,
      $_db.productTranslations,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productTranslationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $CachedSoftwareProductTable,
    List<CachedSoftwareProductData>
  >
  _cachedSoftwareProductRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cachedSoftwareProduct,
        aliasName: $_aliasNameGenerator(
          db.cachedProduct.id,
          db.cachedSoftwareProduct.productId,
        ),
      );

  $$CachedSoftwareProductTableProcessedTableManager
  get cachedSoftwareProductRefs {
    final manager = $$CachedSoftwareProductTableTableManager(
      $_db,
      $_db.cachedSoftwareProduct,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cachedSoftwareProductRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CachedBooksTable, List<CachedBook>>
  _cachedBooksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cachedBooks,
    aliasName: $_aliasNameGenerator(
      db.cachedProduct.id,
      db.cachedBooks.productId,
    ),
  );

  $$CachedBooksTableProcessedTableManager get cachedBooksRefs {
    final manager = $$CachedBooksTableTableManager(
      $_db,
      $_db.cachedBooks,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_cachedBooksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductCategoriesTable, List<ProductCategory>>
  _productCategoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productCategories,
        aliasName: $_aliasNameGenerator(
          db.cachedProduct.id,
          db.productCategories.productId,
        ),
      );

  $$ProductCategoriesTableProcessedTableManager get productCategoriesRefs {
    final manager = $$ProductCategoriesTableTableManager(
      $_db,
      $_db.productCategories,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProductTagsTable, List<ProductTag>>
  _productTagsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productTags,
    aliasName: $_aliasNameGenerator(
      db.cachedProduct.id,
      db.productTags.productId,
    ),
  );

  $$ProductTagsTableProcessedTableManager get productTagsRefs {
    final manager = $$ProductTagsTableTableManager(
      $_db,
      $_db.productTags,
    ).filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CachedProductTableFilterComposer
    extends Composer<_$AppDatabase, $CachedProductTable> {
  $$CachedProductTableFilterComposer({
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

  ColumnFilters<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewsCount => $composableBuilder(
    column: $table.reviewsCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPaid => $composableBuilder(
    column: $table.isPaid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get discountPrice => $composableBuilder(
    column: $table.discountPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productTranslationsRefs(
    Expression<bool> Function($$ProductTranslationsTableFilterComposer f) f,
  ) {
    final $$ProductTranslationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTranslations,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTranslationsTableFilterComposer(
            $db: $db,
            $table: $db.productTranslations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cachedSoftwareProductRefs(
    Expression<bool> Function($$CachedSoftwareProductTableFilterComposer f) f,
  ) {
    final $$CachedSoftwareProductTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cachedSoftwareProduct,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedSoftwareProductTableFilterComposer(
                $db: $db,
                $table: $db.cachedSoftwareProduct,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> cachedBooksRefs(
    Expression<bool> Function($$CachedBooksTableFilterComposer f) f,
  ) {
    final $$CachedBooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedBooks,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedBooksTableFilterComposer(
            $db: $db,
            $table: $db.cachedBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productCategoriesRefs(
    Expression<bool> Function($$ProductCategoriesTableFilterComposer f) f,
  ) {
    final $$ProductCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productCategories,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.productCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> productTagsRefs(
    Expression<bool> Function($$ProductTagsTableFilterComposer f) f,
  ) {
    final $$ProductTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTags,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTagsTableFilterComposer(
            $db: $db,
            $table: $db.productTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedProductTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedProductTable> {
  $$CachedProductTableOrderingComposer({
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

  ColumnOrderings<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
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

  ColumnOrderings<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get iconUrl => $composableBuilder(
    column: $table.iconUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPaid => $composableBuilder(
    column: $table.isPaid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get discountPrice => $composableBuilder(
    column: $table.discountPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedProductTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedProductTable> {
  $$CachedProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String>
  get shortDescription => $composableBuilder(
    column: $table.shortDescription,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, String>, String>
  get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<int> get reviewsCount => $composableBuilder(
    column: $table.reviewsCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get releaseDate => $composableBuilder(
    column: $table.releaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  GeneratedColumn<bool> get isPaid =>
      $composableBuilder(column: $table.isPaid, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get currencyCode => $composableBuilder(
    column: $table.currencyCode,
    builder: (column) => column,
  );

  GeneratedColumn<double> get discountPrice => $composableBuilder(
    column: $table.discountPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  Expression<T> productTranslationsRefs<T extends Object>(
    Expression<T> Function($$ProductTranslationsTableAnnotationComposer a) f,
  ) {
    final $$ProductTranslationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productTranslations,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductTranslationsTableAnnotationComposer(
                $db: $db,
                $table: $db.productTranslations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> cachedSoftwareProductRefs<T extends Object>(
    Expression<T> Function($$CachedSoftwareProductTableAnnotationComposer a) f,
  ) {
    final $$CachedSoftwareProductTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cachedSoftwareProduct,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedSoftwareProductTableAnnotationComposer(
                $db: $db,
                $table: $db.cachedSoftwareProduct,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> cachedBooksRefs<T extends Object>(
    Expression<T> Function($$CachedBooksTableAnnotationComposer a) f,
  ) {
    final $$CachedBooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedBooks,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedBooksTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> productCategoriesRefs<T extends Object>(
    Expression<T> Function($$ProductCategoriesTableAnnotationComposer a) f,
  ) {
    final $$ProductCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productCategories,
          getReferencedColumn: (t) => t.productId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.productCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> productTagsRefs<T extends Object>(
    Expression<T> Function($$ProductTagsTableAnnotationComposer a) f,
  ) {
    final $$ProductTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTags,
      getReferencedColumn: (t) => t.productId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.productTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedProductTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedProductTable,
          CachedProductData,
          $$CachedProductTableFilterComposer,
          $$CachedProductTableOrderingComposer,
          $$CachedProductTableAnnotationComposer,
          $$CachedProductTableCreateCompanionBuilder,
          $$CachedProductTableUpdateCompanionBuilder,
          (CachedProductData, $$CachedProductTableReferences),
          CachedProductData,
          PrefetchHooks Function({
            bool productTranslationsRefs,
            bool cachedSoftwareProductRefs,
            bool cachedBooksRefs,
            bool productCategoriesRefs,
            bool productTagsRefs,
          })
        > {
  $$CachedProductTableTableManager(_$AppDatabase db, $CachedProductTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedProductTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedProductTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedProductTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> externalId = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<Map<String, String>> title = const Value.absent(),
                Value<Map<String, String>> shortDescription =
                    const Value.absent(),
                Value<Map<String, String>> description = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<int> reviewsCount = const Value.absent(),
                Value<DateTime> releaseDate = const Value.absent(),
                Value<String> iconUrl = const Value.absent(),
                Value<bool> isPaid = const Value.absent(),
                Value<double?> price = const Value.absent(),
                Value<String> currencyCode = const Value.absent(),
                Value<double?> discountPrice = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedProductCompanion(
                id: id,
                externalId: externalId,
                type: type,
                title: title,
                shortDescription: shortDescription,
                description: description,
                rating: rating,
                reviewsCount: reviewsCount,
                releaseDate: releaseDate,
                iconUrl: iconUrl,
                isPaid: isPaid,
                price: price,
                currencyCode: currencyCode,
                discountPrice: discountPrice,
                url: url,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String externalId,
                required String type,
                required Map<String, String> title,
                required Map<String, String> shortDescription,
                required Map<String, String> description,
                required double rating,
                required int reviewsCount,
                required DateTime releaseDate,
                required String iconUrl,
                required bool isPaid,
                Value<double?> price = const Value.absent(),
                required String currencyCode,
                Value<double?> discountPrice = const Value.absent(),
                required String url,
                Value<int> rowid = const Value.absent(),
              }) => CachedProductCompanion.insert(
                id: id,
                externalId: externalId,
                type: type,
                title: title,
                shortDescription: shortDescription,
                description: description,
                rating: rating,
                reviewsCount: reviewsCount,
                releaseDate: releaseDate,
                iconUrl: iconUrl,
                isPaid: isPaid,
                price: price,
                currencyCode: currencyCode,
                discountPrice: discountPrice,
                url: url,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedProductTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                productTranslationsRefs = false,
                cachedSoftwareProductRefs = false,
                cachedBooksRefs = false,
                productCategoriesRefs = false,
                productTagsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (productTranslationsRefs) db.productTranslations,
                    if (cachedSoftwareProductRefs) db.cachedSoftwareProduct,
                    if (cachedBooksRefs) db.cachedBooks,
                    if (productCategoriesRefs) db.productCategories,
                    if (productTagsRefs) db.productTags,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (productTranslationsRefs)
                        await $_getPrefetchedData<
                          CachedProductData,
                          $CachedProductTable,
                          ProductTranslation
                        >(
                          currentTable: table,
                          referencedTable: $$CachedProductTableReferences
                              ._productTranslationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedProductTableReferences(
                                db,
                                table,
                                p0,
                              ).productTranslationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cachedSoftwareProductRefs)
                        await $_getPrefetchedData<
                          CachedProductData,
                          $CachedProductTable,
                          CachedSoftwareProductData
                        >(
                          currentTable: table,
                          referencedTable: $$CachedProductTableReferences
                              ._cachedSoftwareProductRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedProductTableReferences(
                                db,
                                table,
                                p0,
                              ).cachedSoftwareProductRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cachedBooksRefs)
                        await $_getPrefetchedData<
                          CachedProductData,
                          $CachedProductTable,
                          CachedBook
                        >(
                          currentTable: table,
                          referencedTable: $$CachedProductTableReferences
                              ._cachedBooksRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedProductTableReferences(
                                db,
                                table,
                                p0,
                              ).cachedBooksRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (productCategoriesRefs)
                        await $_getPrefetchedData<
                          CachedProductData,
                          $CachedProductTable,
                          ProductCategory
                        >(
                          currentTable: table,
                          referencedTable: $$CachedProductTableReferences
                              ._productCategoriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedProductTableReferences(
                                db,
                                table,
                                p0,
                              ).productCategoriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (productTagsRefs)
                        await $_getPrefetchedData<
                          CachedProductData,
                          $CachedProductTable,
                          ProductTag
                        >(
                          currentTable: table,
                          referencedTable: $$CachedProductTableReferences
                              ._productTagsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedProductTableReferences(
                                db,
                                table,
                                p0,
                              ).productTagsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.productId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$CachedProductTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedProductTable,
      CachedProductData,
      $$CachedProductTableFilterComposer,
      $$CachedProductTableOrderingComposer,
      $$CachedProductTableAnnotationComposer,
      $$CachedProductTableCreateCompanionBuilder,
      $$CachedProductTableUpdateCompanionBuilder,
      (CachedProductData, $$CachedProductTableReferences),
      CachedProductData,
      PrefetchHooks Function({
        bool productTranslationsRefs,
        bool cachedSoftwareProductRefs,
        bool cachedBooksRefs,
        bool productCategoriesRefs,
        bool productTagsRefs,
      })
    >;
typedef $$ProductTranslationsTableCreateCompanionBuilder =
    ProductTranslationsCompanion Function({
      required String productId,
      required String field,
      required String language,
      required String value,
      Value<int> rowid,
    });
typedef $$ProductTranslationsTableUpdateCompanionBuilder =
    ProductTranslationsCompanion Function({
      Value<String> productId,
      Value<String> field,
      Value<String> language,
      Value<String> value,
      Value<int> rowid,
    });

final class $$ProductTranslationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductTranslationsTable,
          ProductTranslation
        > {
  $$ProductTranslationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CachedProductTable _productIdTable(_$AppDatabase db) =>
      db.cachedProduct.createAlias(
        $_aliasNameGenerator(
          db.productTranslations.productId,
          db.cachedProduct.id,
        ),
      );

  $$CachedProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$CachedProductTableTableManager(
      $_db,
      $_db.cachedProduct,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductTranslationsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTranslationsTable> {
  $$ProductTranslationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get field => $composableBuilder(
    column: $table.field,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  $$CachedProductTableFilterComposer get productId {
    final $$CachedProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableFilterComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTranslationsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTranslationsTable> {
  $$ProductTranslationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get field => $composableBuilder(
    column: $table.field,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedProductTableOrderingComposer get productId {
    final $$CachedProductTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableOrderingComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTranslationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTranslationsTable> {
  $$ProductTranslationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get field =>
      $composableBuilder(column: $table.field, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  $$CachedProductTableAnnotationComposer get productId {
    final $$CachedProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTranslationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTranslationsTable,
          ProductTranslation,
          $$ProductTranslationsTableFilterComposer,
          $$ProductTranslationsTableOrderingComposer,
          $$ProductTranslationsTableAnnotationComposer,
          $$ProductTranslationsTableCreateCompanionBuilder,
          $$ProductTranslationsTableUpdateCompanionBuilder,
          (ProductTranslation, $$ProductTranslationsTableReferences),
          ProductTranslation,
          PrefetchHooks Function({bool productId})
        > {
  $$ProductTranslationsTableTableManager(
    _$AppDatabase db,
    $ProductTranslationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTranslationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTranslationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProductTranslationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<String> field = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductTranslationsCompanion(
                productId: productId,
                field: field,
                language: language,
                value: value,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required String field,
                required String language,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => ProductTranslationsCompanion.insert(
                productId: productId,
                field: field,
                language: language,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductTranslationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$ProductTranslationsTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$ProductTranslationsTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductTranslationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTranslationsTable,
      ProductTranslation,
      $$ProductTranslationsTableFilterComposer,
      $$ProductTranslationsTableOrderingComposer,
      $$ProductTranslationsTableAnnotationComposer,
      $$ProductTranslationsTableCreateCompanionBuilder,
      $$ProductTranslationsTableUpdateCompanionBuilder,
      (ProductTranslation, $$ProductTranslationsTableReferences),
      ProductTranslation,
      PrefetchHooks Function({bool productId})
    >;
typedef $ProductTitleFtsCreateCompanionBuilder =
    ProductTitleFtsCompanion Function({
      required String value,
      Value<int> rowid,
    });
typedef $ProductTitleFtsUpdateCompanionBuilder =
    ProductTitleFtsCompanion Function({Value<String> value, Value<int> rowid});

class $ProductTitleFtsFilterComposer
    extends Composer<_$AppDatabase, ProductTitleFts> {
  $ProductTitleFtsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $ProductTitleFtsOrderingComposer
    extends Composer<_$AppDatabase, ProductTitleFts> {
  $ProductTitleFtsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $ProductTitleFtsAnnotationComposer
    extends Composer<_$AppDatabase, ProductTitleFts> {
  $ProductTitleFtsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $ProductTitleFtsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          ProductTitleFts,
          ProductTitleFt,
          $ProductTitleFtsFilterComposer,
          $ProductTitleFtsOrderingComposer,
          $ProductTitleFtsAnnotationComposer,
          $ProductTitleFtsCreateCompanionBuilder,
          $ProductTitleFtsUpdateCompanionBuilder,
          (
            ProductTitleFt,
            BaseReferences<_$AppDatabase, ProductTitleFts, ProductTitleFt>,
          ),
          ProductTitleFt,
          PrefetchHooks Function()
        > {
  $ProductTitleFtsTableManager(_$AppDatabase db, ProductTitleFts table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $ProductTitleFtsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $ProductTitleFtsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $ProductTitleFtsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductTitleFtsCompanion(value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => ProductTitleFtsCompanion.insert(value: value, rowid: rowid),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $ProductTitleFtsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      ProductTitleFts,
      ProductTitleFt,
      $ProductTitleFtsFilterComposer,
      $ProductTitleFtsOrderingComposer,
      $ProductTitleFtsAnnotationComposer,
      $ProductTitleFtsCreateCompanionBuilder,
      $ProductTitleFtsUpdateCompanionBuilder,
      (
        ProductTitleFt,
        BaseReferences<_$AppDatabase, ProductTitleFts, ProductTitleFt>,
      ),
      ProductTitleFt,
      PrefetchHooks Function()
    >;
typedef $$SyncStateTableCreateCompanionBuilder =
    SyncStateCompanion Function({
      required String syncKey,
      Value<DateTime?> lastSyncAt,
      Value<String?> cursor,
      Value<int?> remoteSchemaVersion,
      Value<int> rowid,
    });
typedef $$SyncStateTableUpdateCompanionBuilder =
    SyncStateCompanion Function({
      Value<String> syncKey,
      Value<DateTime?> lastSyncAt,
      Value<String?> cursor,
      Value<int?> remoteSchemaVersion,
      Value<int> rowid,
    });

class $$SyncStateTableFilterComposer
    extends Composer<_$AppDatabase, $SyncStateTable> {
  $$SyncStateTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get syncKey => $composableBuilder(
    column: $table.syncKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cursor => $composableBuilder(
    column: $table.cursor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remoteSchemaVersion => $composableBuilder(
    column: $table.remoteSchemaVersion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncStateTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncStateTable> {
  $$SyncStateTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get syncKey => $composableBuilder(
    column: $table.syncKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cursor => $composableBuilder(
    column: $table.cursor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remoteSchemaVersion => $composableBuilder(
    column: $table.remoteSchemaVersion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncStateTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncStateTable> {
  $$SyncStateTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get syncKey =>
      $composableBuilder(column: $table.syncKey, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncAt => $composableBuilder(
    column: $table.lastSyncAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cursor =>
      $composableBuilder(column: $table.cursor, builder: (column) => column);

  GeneratedColumn<int> get remoteSchemaVersion => $composableBuilder(
    column: $table.remoteSchemaVersion,
    builder: (column) => column,
  );
}

class $$SyncStateTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncStateTable,
          SyncStateData,
          $$SyncStateTableFilterComposer,
          $$SyncStateTableOrderingComposer,
          $$SyncStateTableAnnotationComposer,
          $$SyncStateTableCreateCompanionBuilder,
          $$SyncStateTableUpdateCompanionBuilder,
          (
            SyncStateData,
            BaseReferences<_$AppDatabase, $SyncStateTable, SyncStateData>,
          ),
          SyncStateData,
          PrefetchHooks Function()
        > {
  $$SyncStateTableTableManager(_$AppDatabase db, $SyncStateTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncStateTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncStateTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncStateTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> syncKey = const Value.absent(),
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<String?> cursor = const Value.absent(),
                Value<int?> remoteSchemaVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncStateCompanion(
                syncKey: syncKey,
                lastSyncAt: lastSyncAt,
                cursor: cursor,
                remoteSchemaVersion: remoteSchemaVersion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String syncKey,
                Value<DateTime?> lastSyncAt = const Value.absent(),
                Value<String?> cursor = const Value.absent(),
                Value<int?> remoteSchemaVersion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncStateCompanion.insert(
                syncKey: syncKey,
                lastSyncAt: lastSyncAt,
                cursor: cursor,
                remoteSchemaVersion: remoteSchemaVersion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncStateTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncStateTable,
      SyncStateData,
      $$SyncStateTableFilterComposer,
      $$SyncStateTableOrderingComposer,
      $$SyncStateTableAnnotationComposer,
      $$SyncStateTableCreateCompanionBuilder,
      $$SyncStateTableUpdateCompanionBuilder,
      (
        SyncStateData,
        BaseReferences<_$AppDatabase, $SyncStateTable, SyncStateData>,
      ),
      SyncStateData,
      PrefetchHooks Function()
    >;
typedef $$DevelopersTableCreateCompanionBuilder =
    DevelopersCompanion Function({
      required String id,
      required Map<String, String> city,
      required String phone,
      required Map<String, String> adress,
      required Map<String, String> company,
      required Map<String, String> country,
      required String websiteUrl,
      required String emailSupport,
      required String privacyPolicyUrl,
      Value<int> rowid,
    });
typedef $$DevelopersTableUpdateCompanionBuilder =
    DevelopersCompanion Function({
      Value<String> id,
      Value<Map<String, String>> city,
      Value<String> phone,
      Value<Map<String, String>> adress,
      Value<Map<String, String>> company,
      Value<Map<String, String>> country,
      Value<String> websiteUrl,
      Value<String> emailSupport,
      Value<String> privacyPolicyUrl,
      Value<int> rowid,
    });

final class $$DevelopersTableReferences
    extends BaseReferences<_$AppDatabase, $DevelopersTable, Developer> {
  $$DevelopersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $CachedSoftwareProductTable,
    List<CachedSoftwareProductData>
  >
  _cachedSoftwareProductRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.cachedSoftwareProduct,
        aliasName: $_aliasNameGenerator(
          db.developers.id,
          db.cachedSoftwareProduct.developerId,
        ),
      );

  $$CachedSoftwareProductTableProcessedTableManager
  get cachedSoftwareProductRefs {
    final manager = $$CachedSoftwareProductTableTableManager(
      $_db,
      $_db.cachedSoftwareProduct,
    ).filter((f) => f.developerId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _cachedSoftwareProductRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DevelopersTableFilterComposer
    extends Composer<_$AppDatabase, $DevelopersTable> {
  $$DevelopersTableFilterComposer({
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

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get adress => $composableBuilder(
    column: $table.adress,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get websiteUrl => $composableBuilder(
    column: $table.websiteUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emailSupport => $composableBuilder(
    column: $table.emailSupport,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get privacyPolicyUrl => $composableBuilder(
    column: $table.privacyPolicyUrl,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cachedSoftwareProductRefs(
    Expression<bool> Function($$CachedSoftwareProductTableFilterComposer f) f,
  ) {
    final $$CachedSoftwareProductTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cachedSoftwareProduct,
          getReferencedColumn: (t) => t.developerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedSoftwareProductTableFilterComposer(
                $db: $db,
                $table: $db.cachedSoftwareProduct,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DevelopersTableOrderingComposer
    extends Composer<_$AppDatabase, $DevelopersTable> {
  $$DevelopersTableOrderingComposer({
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

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adress => $composableBuilder(
    column: $table.adress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get company => $composableBuilder(
    column: $table.company,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get websiteUrl => $composableBuilder(
    column: $table.websiteUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emailSupport => $composableBuilder(
    column: $table.emailSupport,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get privacyPolicyUrl => $composableBuilder(
    column: $table.privacyPolicyUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DevelopersTableAnnotationComposer
    extends Composer<_$AppDatabase, $DevelopersTable> {
  $$DevelopersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get adress =>
      $composableBuilder(column: $table.adress, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get company =>
      $composableBuilder(column: $table.company, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get websiteUrl => $composableBuilder(
    column: $table.websiteUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emailSupport => $composableBuilder(
    column: $table.emailSupport,
    builder: (column) => column,
  );

  GeneratedColumn<String> get privacyPolicyUrl => $composableBuilder(
    column: $table.privacyPolicyUrl,
    builder: (column) => column,
  );

  Expression<T> cachedSoftwareProductRefs<T extends Object>(
    Expression<T> Function($$CachedSoftwareProductTableAnnotationComposer a) f,
  ) {
    final $$CachedSoftwareProductTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.cachedSoftwareProduct,
          getReferencedColumn: (t) => t.developerId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CachedSoftwareProductTableAnnotationComposer(
                $db: $db,
                $table: $db.cachedSoftwareProduct,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DevelopersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DevelopersTable,
          Developer,
          $$DevelopersTableFilterComposer,
          $$DevelopersTableOrderingComposer,
          $$DevelopersTableAnnotationComposer,
          $$DevelopersTableCreateCompanionBuilder,
          $$DevelopersTableUpdateCompanionBuilder,
          (Developer, $$DevelopersTableReferences),
          Developer,
          PrefetchHooks Function({bool cachedSoftwareProductRefs})
        > {
  $$DevelopersTableTableManager(_$AppDatabase db, $DevelopersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DevelopersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DevelopersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DevelopersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<Map<String, String>> city = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<Map<String, String>> adress = const Value.absent(),
                Value<Map<String, String>> company = const Value.absent(),
                Value<Map<String, String>> country = const Value.absent(),
                Value<String> websiteUrl = const Value.absent(),
                Value<String> emailSupport = const Value.absent(),
                Value<String> privacyPolicyUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DevelopersCompanion(
                id: id,
                city: city,
                phone: phone,
                adress: adress,
                company: company,
                country: country,
                websiteUrl: websiteUrl,
                emailSupport: emailSupport,
                privacyPolicyUrl: privacyPolicyUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required Map<String, String> city,
                required String phone,
                required Map<String, String> adress,
                required Map<String, String> company,
                required Map<String, String> country,
                required String websiteUrl,
                required String emailSupport,
                required String privacyPolicyUrl,
                Value<int> rowid = const Value.absent(),
              }) => DevelopersCompanion.insert(
                id: id,
                city: city,
                phone: phone,
                adress: adress,
                company: company,
                country: country,
                websiteUrl: websiteUrl,
                emailSupport: emailSupport,
                privacyPolicyUrl: privacyPolicyUrl,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DevelopersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cachedSoftwareProductRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (cachedSoftwareProductRefs) db.cachedSoftwareProduct,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cachedSoftwareProductRefs)
                    await $_getPrefetchedData<
                      Developer,
                      $DevelopersTable,
                      CachedSoftwareProductData
                    >(
                      currentTable: table,
                      referencedTable: $$DevelopersTableReferences
                          ._cachedSoftwareProductRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DevelopersTableReferences(
                            db,
                            table,
                            p0,
                          ).cachedSoftwareProductRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.developerId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DevelopersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DevelopersTable,
      Developer,
      $$DevelopersTableFilterComposer,
      $$DevelopersTableOrderingComposer,
      $$DevelopersTableAnnotationComposer,
      $$DevelopersTableCreateCompanionBuilder,
      $$DevelopersTableUpdateCompanionBuilder,
      (Developer, $$DevelopersTableReferences),
      Developer,
      PrefetchHooks Function({bool cachedSoftwareProductRefs})
    >;
typedef $$CachedSoftwareProductTableCreateCompanionBuilder =
    CachedSoftwareProductCompanion Function({
      required String productId,
      required String developerId,
      Value<List<String>?> screenshots,
      Value<List<String>?> supportedLanguages,
      required bool containsAds,
      required bool containsPaidContent,
      required String version,
      required String size,
      Value<Map<String, String>?> eventText,
      required Map<String, String> whatsNewText,
      required int downloadCount,
      required int ageRating,
      required bool isKidsFriendly,
      Value<List<Map<String, String>>?> ageRatingReasons,
      Value<List<Map<String, String>>?> permissions,
      required DateTime lastUpdated,
      Value<Map<String, String>?> creatorDescription,
      Value<int> rowid,
    });
typedef $$CachedSoftwareProductTableUpdateCompanionBuilder =
    CachedSoftwareProductCompanion Function({
      Value<String> productId,
      Value<String> developerId,
      Value<List<String>?> screenshots,
      Value<List<String>?> supportedLanguages,
      Value<bool> containsAds,
      Value<bool> containsPaidContent,
      Value<String> version,
      Value<String> size,
      Value<Map<String, String>?> eventText,
      Value<Map<String, String>> whatsNewText,
      Value<int> downloadCount,
      Value<int> ageRating,
      Value<bool> isKidsFriendly,
      Value<List<Map<String, String>>?> ageRatingReasons,
      Value<List<Map<String, String>>?> permissions,
      Value<DateTime> lastUpdated,
      Value<Map<String, String>?> creatorDescription,
      Value<int> rowid,
    });

final class $$CachedSoftwareProductTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CachedSoftwareProductTable,
          CachedSoftwareProductData
        > {
  $$CachedSoftwareProductTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CachedProductTable _productIdTable(_$AppDatabase db) =>
      db.cachedProduct.createAlias(
        $_aliasNameGenerator(
          db.cachedSoftwareProduct.productId,
          db.cachedProduct.id,
        ),
      );

  $$CachedProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$CachedProductTableTableManager(
      $_db,
      $_db.cachedProduct,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $DevelopersTable _developerIdTable(_$AppDatabase db) =>
      db.developers.createAlias(
        $_aliasNameGenerator(
          db.cachedSoftwareProduct.developerId,
          db.developers.id,
        ),
      );

  $$DevelopersTableProcessedTableManager get developerId {
    final $_column = $_itemColumn<String>('developer_id')!;

    final manager = $$DevelopersTableTableManager(
      $_db,
      $_db.developers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_developerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CachedSoftwareProductTableFilterComposer
    extends Composer<_$AppDatabase, $CachedSoftwareProductTable> {
  $$CachedSoftwareProductTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get screenshots => $composableBuilder(
    column: $table.screenshots,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get supportedLanguages => $composableBuilder(
    column: $table.supportedLanguages,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<bool> get containsAds => $composableBuilder(
    column: $table.containsAds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get containsPaidContent => $composableBuilder(
    column: $table.containsPaidContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>?,
    Map<String, String>,
    String
  >
  get eventText => $composableBuilder(
    column: $table.eventText,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get whatsNewText => $composableBuilder(
    column: $table.whatsNewText,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get downloadCount => $composableBuilder(
    column: $table.downloadCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ageRating => $composableBuilder(
    column: $table.ageRating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isKidsFriendly => $composableBuilder(
    column: $table.isKidsFriendly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<Map<String, String>>?,
    List<Map<String, String>>,
    String
  >
  get ageRatingReasons => $composableBuilder(
    column: $table.ageRatingReasons,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<Map<String, String>>?,
    List<Map<String, String>>,
    String
  >
  get permissions => $composableBuilder(
    column: $table.permissions,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>?,
    Map<String, String>,
    String
  >
  get creatorDescription => $composableBuilder(
    column: $table.creatorDescription,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$CachedProductTableFilterComposer get productId {
    final $$CachedProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableFilterComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DevelopersTableFilterComposer get developerId {
    final $$DevelopersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.developerId,
      referencedTable: $db.developers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevelopersTableFilterComposer(
            $db: $db,
            $table: $db.developers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedSoftwareProductTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedSoftwareProductTable> {
  $$CachedSoftwareProductTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get screenshots => $composableBuilder(
    column: $table.screenshots,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get supportedLanguages => $composableBuilder(
    column: $table.supportedLanguages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get containsAds => $composableBuilder(
    column: $table.containsAds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get containsPaidContent => $composableBuilder(
    column: $table.containsPaidContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get version => $composableBuilder(
    column: $table.version,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get size => $composableBuilder(
    column: $table.size,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eventText => $composableBuilder(
    column: $table.eventText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get whatsNewText => $composableBuilder(
    column: $table.whatsNewText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get downloadCount => $composableBuilder(
    column: $table.downloadCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ageRating => $composableBuilder(
    column: $table.ageRating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isKidsFriendly => $composableBuilder(
    column: $table.isKidsFriendly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ageRatingReasons => $composableBuilder(
    column: $table.ageRatingReasons,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get permissions => $composableBuilder(
    column: $table.permissions,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get creatorDescription => $composableBuilder(
    column: $table.creatorDescription,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedProductTableOrderingComposer get productId {
    final $$CachedProductTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableOrderingComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DevelopersTableOrderingComposer get developerId {
    final $$DevelopersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.developerId,
      referencedTable: $db.developers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevelopersTableOrderingComposer(
            $db: $db,
            $table: $db.developers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedSoftwareProductTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedSoftwareProductTable> {
  $$CachedSoftwareProductTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<List<String>?, String> get screenshots =>
      $composableBuilder(
        column: $table.screenshots,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<List<String>?, String>
  get supportedLanguages => $composableBuilder(
    column: $table.supportedLanguages,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get containsAds => $composableBuilder(
    column: $table.containsAds,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get containsPaidContent => $composableBuilder(
    column: $table.containsPaidContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get size =>
      $composableBuilder(column: $table.size, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>?, String>
  get eventText =>
      $composableBuilder(column: $table.eventText, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String>
  get whatsNewText => $composableBuilder(
    column: $table.whatsNewText,
    builder: (column) => column,
  );

  GeneratedColumn<int> get downloadCount => $composableBuilder(
    column: $table.downloadCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get ageRating =>
      $composableBuilder(column: $table.ageRating, builder: (column) => column);

  GeneratedColumn<bool> get isKidsFriendly => $composableBuilder(
    column: $table.isKidsFriendly,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<Map<String, String>>?, String>
  get ageRatingReasons => $composableBuilder(
    column: $table.ageRatingReasons,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<Map<String, String>>?, String>
  get permissions => $composableBuilder(
    column: $table.permissions,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Map<String, String>?, String>
  get creatorDescription => $composableBuilder(
    column: $table.creatorDescription,
    builder: (column) => column,
  );

  $$CachedProductTableAnnotationComposer get productId {
    final $$CachedProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$DevelopersTableAnnotationComposer get developerId {
    final $$DevelopersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.developerId,
      referencedTable: $db.developers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DevelopersTableAnnotationComposer(
            $db: $db,
            $table: $db.developers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedSoftwareProductTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedSoftwareProductTable,
          CachedSoftwareProductData,
          $$CachedSoftwareProductTableFilterComposer,
          $$CachedSoftwareProductTableOrderingComposer,
          $$CachedSoftwareProductTableAnnotationComposer,
          $$CachedSoftwareProductTableCreateCompanionBuilder,
          $$CachedSoftwareProductTableUpdateCompanionBuilder,
          (CachedSoftwareProductData, $$CachedSoftwareProductTableReferences),
          CachedSoftwareProductData,
          PrefetchHooks Function({bool productId, bool developerId})
        > {
  $$CachedSoftwareProductTableTableManager(
    _$AppDatabase db,
    $CachedSoftwareProductTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedSoftwareProductTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CachedSoftwareProductTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CachedSoftwareProductTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<String> developerId = const Value.absent(),
                Value<List<String>?> screenshots = const Value.absent(),
                Value<List<String>?> supportedLanguages = const Value.absent(),
                Value<bool> containsAds = const Value.absent(),
                Value<bool> containsPaidContent = const Value.absent(),
                Value<String> version = const Value.absent(),
                Value<String> size = const Value.absent(),
                Value<Map<String, String>?> eventText = const Value.absent(),
                Value<Map<String, String>> whatsNewText = const Value.absent(),
                Value<int> downloadCount = const Value.absent(),
                Value<int> ageRating = const Value.absent(),
                Value<bool> isKidsFriendly = const Value.absent(),
                Value<List<Map<String, String>>?> ageRatingReasons =
                    const Value.absent(),
                Value<List<Map<String, String>>?> permissions =
                    const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<Map<String, String>?> creatorDescription =
                    const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedSoftwareProductCompanion(
                productId: productId,
                developerId: developerId,
                screenshots: screenshots,
                supportedLanguages: supportedLanguages,
                containsAds: containsAds,
                containsPaidContent: containsPaidContent,
                version: version,
                size: size,
                eventText: eventText,
                whatsNewText: whatsNewText,
                downloadCount: downloadCount,
                ageRating: ageRating,
                isKidsFriendly: isKidsFriendly,
                ageRatingReasons: ageRatingReasons,
                permissions: permissions,
                lastUpdated: lastUpdated,
                creatorDescription: creatorDescription,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required String developerId,
                Value<List<String>?> screenshots = const Value.absent(),
                Value<List<String>?> supportedLanguages = const Value.absent(),
                required bool containsAds,
                required bool containsPaidContent,
                required String version,
                required String size,
                Value<Map<String, String>?> eventText = const Value.absent(),
                required Map<String, String> whatsNewText,
                required int downloadCount,
                required int ageRating,
                required bool isKidsFriendly,
                Value<List<Map<String, String>>?> ageRatingReasons =
                    const Value.absent(),
                Value<List<Map<String, String>>?> permissions =
                    const Value.absent(),
                required DateTime lastUpdated,
                Value<Map<String, String>?> creatorDescription =
                    const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedSoftwareProductCompanion.insert(
                productId: productId,
                developerId: developerId,
                screenshots: screenshots,
                supportedLanguages: supportedLanguages,
                containsAds: containsAds,
                containsPaidContent: containsPaidContent,
                version: version,
                size: size,
                eventText: eventText,
                whatsNewText: whatsNewText,
                downloadCount: downloadCount,
                ageRating: ageRating,
                isKidsFriendly: isKidsFriendly,
                ageRatingReasons: ageRatingReasons,
                permissions: permissions,
                lastUpdated: lastUpdated,
                creatorDescription: creatorDescription,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedSoftwareProductTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, developerId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$CachedSoftwareProductTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$CachedSoftwareProductTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (developerId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.developerId,
                                referencedTable:
                                    $$CachedSoftwareProductTableReferences
                                        ._developerIdTable(db),
                                referencedColumn:
                                    $$CachedSoftwareProductTableReferences
                                        ._developerIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CachedSoftwareProductTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedSoftwareProductTable,
      CachedSoftwareProductData,
      $$CachedSoftwareProductTableFilterComposer,
      $$CachedSoftwareProductTableOrderingComposer,
      $$CachedSoftwareProductTableAnnotationComposer,
      $$CachedSoftwareProductTableCreateCompanionBuilder,
      $$CachedSoftwareProductTableUpdateCompanionBuilder,
      (CachedSoftwareProductData, $$CachedSoftwareProductTableReferences),
      CachedSoftwareProductData,
      PrefetchHooks Function({bool productId, bool developerId})
    >;
typedef $$CachedGamesTableCreateCompanionBuilder =
    CachedGamesCompanion Function({
      required String productId,
      Value<String?> technicalInfo,
      Value<bool?> isOnline,
      Value<bool?> hasMultiplayer,
      Value<String?> gameModes,
      Value<bool?> hasControllerSupport,
      Value<List<Map<String, String>>?> achievements,
      Value<int> rowid,
    });
typedef $$CachedGamesTableUpdateCompanionBuilder =
    CachedGamesCompanion Function({
      Value<String> productId,
      Value<String?> technicalInfo,
      Value<bool?> isOnline,
      Value<bool?> hasMultiplayer,
      Value<String?> gameModes,
      Value<bool?> hasControllerSupport,
      Value<List<Map<String, String>>?> achievements,
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
  ColumnFilters<String> get technicalInfo => $composableBuilder(
    column: $table.technicalInfo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isOnline => $composableBuilder(
    column: $table.isOnline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasMultiplayer => $composableBuilder(
    column: $table.hasMultiplayer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get gameModes => $composableBuilder(
    column: $table.gameModes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasControllerSupport => $composableBuilder(
    column: $table.hasControllerSupport,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    List<Map<String, String>>?,
    List<Map<String, String>>,
    String
  >
  get achievements => $composableBuilder(
    column: $table.achievements,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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
  ColumnOrderings<String> get technicalInfo => $composableBuilder(
    column: $table.technicalInfo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isOnline => $composableBuilder(
    column: $table.isOnline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasMultiplayer => $composableBuilder(
    column: $table.hasMultiplayer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gameModes => $composableBuilder(
    column: $table.gameModes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasControllerSupport => $composableBuilder(
    column: $table.hasControllerSupport,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get achievements => $composableBuilder(
    column: $table.achievements,
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
  GeneratedColumn<String> get technicalInfo => $composableBuilder(
    column: $table.technicalInfo,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isOnline =>
      $composableBuilder(column: $table.isOnline, builder: (column) => column);

  GeneratedColumn<bool> get hasMultiplayer => $composableBuilder(
    column: $table.hasMultiplayer,
    builder: (column) => column,
  );

  GeneratedColumn<String> get gameModes =>
      $composableBuilder(column: $table.gameModes, builder: (column) => column);

  GeneratedColumn<bool> get hasControllerSupport => $composableBuilder(
    column: $table.hasControllerSupport,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<Map<String, String>>?, String>
  get achievements => $composableBuilder(
    column: $table.achievements,
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
                Value<String> productId = const Value.absent(),
                Value<String?> technicalInfo = const Value.absent(),
                Value<bool?> isOnline = const Value.absent(),
                Value<bool?> hasMultiplayer = const Value.absent(),
                Value<String?> gameModes = const Value.absent(),
                Value<bool?> hasControllerSupport = const Value.absent(),
                Value<List<Map<String, String>>?> achievements =
                    const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedGamesCompanion(
                productId: productId,
                technicalInfo: technicalInfo,
                isOnline: isOnline,
                hasMultiplayer: hasMultiplayer,
                gameModes: gameModes,
                hasControllerSupport: hasControllerSupport,
                achievements: achievements,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                Value<String?> technicalInfo = const Value.absent(),
                Value<bool?> isOnline = const Value.absent(),
                Value<bool?> hasMultiplayer = const Value.absent(),
                Value<String?> gameModes = const Value.absent(),
                Value<bool?> hasControllerSupport = const Value.absent(),
                Value<List<Map<String, String>>?> achievements =
                    const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedGamesCompanion.insert(
                productId: productId,
                technicalInfo: technicalInfo,
                isOnline: isOnline,
                hasMultiplayer: hasMultiplayer,
                gameModes: gameModes,
                hasControllerSupport: hasControllerSupport,
                achievements: achievements,
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
typedef $$CachedAppsTableCreateCompanionBuilder =
    CachedAppsCompanion Function({
      required String productId,
      required String packageName,
      Value<int> rowid,
    });
typedef $$CachedAppsTableUpdateCompanionBuilder =
    CachedAppsCompanion Function({
      Value<String> productId,
      Value<String> packageName,
      Value<int> rowid,
    });

class $$CachedAppsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedAppsTable> {
  $$CachedAppsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedAppsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedAppsTable> {
  $$CachedAppsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedAppsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedAppsTable> {
  $$CachedAppsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get packageName => $composableBuilder(
    column: $table.packageName,
    builder: (column) => column,
  );
}

class $$CachedAppsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedAppsTable,
          CachedApp,
          $$CachedAppsTableFilterComposer,
          $$CachedAppsTableOrderingComposer,
          $$CachedAppsTableAnnotationComposer,
          $$CachedAppsTableCreateCompanionBuilder,
          $$CachedAppsTableUpdateCompanionBuilder,
          (
            CachedApp,
            BaseReferences<_$AppDatabase, $CachedAppsTable, CachedApp>,
          ),
          CachedApp,
          PrefetchHooks Function()
        > {
  $$CachedAppsTableTableManager(_$AppDatabase db, $CachedAppsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedAppsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedAppsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedAppsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<String> packageName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedAppsCompanion(
                productId: productId,
                packageName: packageName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required String packageName,
                Value<int> rowid = const Value.absent(),
              }) => CachedAppsCompanion.insert(
                productId: productId,
                packageName: packageName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedAppsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedAppsTable,
      CachedApp,
      $$CachedAppsTableFilterComposer,
      $$CachedAppsTableOrderingComposer,
      $$CachedAppsTableAnnotationComposer,
      $$CachedAppsTableCreateCompanionBuilder,
      $$CachedAppsTableUpdateCompanionBuilder,
      (CachedApp, BaseReferences<_$AppDatabase, $CachedAppsTable, CachedApp>),
      CachedApp,
      PrefetchHooks Function()
    >;
typedef $$PublishersTableCreateCompanionBuilder =
    PublishersCompanion Function({
      required String id,
      required Map<String, String> publisher,
      required Map<String, String> description,
      Value<int> rowid,
    });
typedef $$PublishersTableUpdateCompanionBuilder =
    PublishersCompanion Function({
      Value<String> id,
      Value<Map<String, String>> publisher,
      Value<Map<String, String>> description,
      Value<int> rowid,
    });

final class $$PublishersTableReferences
    extends BaseReferences<_$AppDatabase, $PublishersTable, Publisher> {
  $$PublishersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CachedBooksTable, List<CachedBook>>
  _cachedBooksRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cachedBooks,
    aliasName: $_aliasNameGenerator(
      db.publishers.id,
      db.cachedBooks.publisherId,
    ),
  );

  $$CachedBooksTableProcessedTableManager get cachedBooksRefs {
    final manager = $$CachedBooksTableTableManager(
      $_db,
      $_db.cachedBooks,
    ).filter((f) => f.publisherId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_cachedBooksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PublishersTableFilterComposer
    extends Composer<_$AppDatabase, $PublishersTable> {
  $$PublishersTableFilterComposer({
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

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> cachedBooksRefs(
    Expression<bool> Function($$CachedBooksTableFilterComposer f) f,
  ) {
    final $$CachedBooksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedBooks,
      getReferencedColumn: (t) => t.publisherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedBooksTableFilterComposer(
            $db: $db,
            $table: $db.cachedBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PublishersTableOrderingComposer
    extends Composer<_$AppDatabase, $PublishersTable> {
  $$PublishersTableOrderingComposer({
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

  ColumnOrderings<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PublishersTableAnnotationComposer
    extends Composer<_$AppDatabase, $PublishersTable> {
  $$PublishersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get publisher =>
      $composableBuilder(column: $table.publisher, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String>
  get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> cachedBooksRefs<T extends Object>(
    Expression<T> Function($$CachedBooksTableAnnotationComposer a) f,
  ) {
    final $$CachedBooksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedBooks,
      getReferencedColumn: (t) => t.publisherId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedBooksTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedBooks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PublishersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PublishersTable,
          Publisher,
          $$PublishersTableFilterComposer,
          $$PublishersTableOrderingComposer,
          $$PublishersTableAnnotationComposer,
          $$PublishersTableCreateCompanionBuilder,
          $$PublishersTableUpdateCompanionBuilder,
          (Publisher, $$PublishersTableReferences),
          Publisher,
          PrefetchHooks Function({bool cachedBooksRefs})
        > {
  $$PublishersTableTableManager(_$AppDatabase db, $PublishersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PublishersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PublishersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PublishersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<Map<String, String>> publisher = const Value.absent(),
                Value<Map<String, String>> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PublishersCompanion(
                id: id,
                publisher: publisher,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required Map<String, String> publisher,
                required Map<String, String> description,
                Value<int> rowid = const Value.absent(),
              }) => PublishersCompanion.insert(
                id: id,
                publisher: publisher,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PublishersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cachedBooksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cachedBooksRefs) db.cachedBooks],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cachedBooksRefs)
                    await $_getPrefetchedData<
                      Publisher,
                      $PublishersTable,
                      CachedBook
                    >(
                      currentTable: table,
                      referencedTable: $$PublishersTableReferences
                          ._cachedBooksRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PublishersTableReferences(
                            db,
                            table,
                            p0,
                          ).cachedBooksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.publisherId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PublishersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PublishersTable,
      Publisher,
      $$PublishersTableFilterComposer,
      $$PublishersTableOrderingComposer,
      $$PublishersTableAnnotationComposer,
      $$PublishersTableCreateCompanionBuilder,
      $$PublishersTableUpdateCompanionBuilder,
      (Publisher, $$PublishersTableReferences),
      Publisher,
      PrefetchHooks Function({bool cachedBooksRefs})
    >;
typedef $$CachedBooksTableCreateCompanionBuilder =
    CachedBooksCompanion Function({
      required String productId,
      required String publisherId,
      required int pageCount,
      required String language,
      required String format,
      required bool hasAudioVersion,
      Value<int?> audioDuration,
      Value<String?> narrator,
      required bool isSeries,
      Value<String?> seriesName,
      Value<int?> seriesNumber,
      required bool sampleAvailable,
      required bool isAbridged,
      required DateTime publicationDate,
      Value<List<String>?> awards,
      Value<int> rowid,
    });
typedef $$CachedBooksTableUpdateCompanionBuilder =
    CachedBooksCompanion Function({
      Value<String> productId,
      Value<String> publisherId,
      Value<int> pageCount,
      Value<String> language,
      Value<String> format,
      Value<bool> hasAudioVersion,
      Value<int?> audioDuration,
      Value<String?> narrator,
      Value<bool> isSeries,
      Value<String?> seriesName,
      Value<int?> seriesNumber,
      Value<bool> sampleAvailable,
      Value<bool> isAbridged,
      Value<DateTime> publicationDate,
      Value<List<String>?> awards,
      Value<int> rowid,
    });

final class $$CachedBooksTableReferences
    extends BaseReferences<_$AppDatabase, $CachedBooksTable, CachedBook> {
  $$CachedBooksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CachedProductTable _productIdTable(_$AppDatabase db) =>
      db.cachedProduct.createAlias(
        $_aliasNameGenerator(db.cachedBooks.productId, db.cachedProduct.id),
      );

  $$CachedProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$CachedProductTableTableManager(
      $_db,
      $_db.cachedProduct,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PublishersTable _publisherIdTable(_$AppDatabase db) =>
      db.publishers.createAlias(
        $_aliasNameGenerator(db.cachedBooks.publisherId, db.publishers.id),
      );

  $$PublishersTableProcessedTableManager get publisherId {
    final $_column = $_itemColumn<String>('publisher_id')!;

    final manager = $$PublishersTableTableManager(
      $_db,
      $_db.publishers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_publisherIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CachedBooksTableFilterComposer
    extends Composer<_$AppDatabase, $CachedBooksTable> {
  $$CachedBooksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get hasAudioVersion => $composableBuilder(
    column: $table.hasAudioVersion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get audioDuration => $composableBuilder(
    column: $table.audioDuration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get narrator => $composableBuilder(
    column: $table.narrator,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSeries => $composableBuilder(
    column: $table.isSeries,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get seriesNumber => $composableBuilder(
    column: $table.seriesNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sampleAvailable => $composableBuilder(
    column: $table.sampleAvailable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isAbridged => $composableBuilder(
    column: $table.isAbridged,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>?, List<String>, String>
  get awards => $composableBuilder(
    column: $table.awards,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  $$CachedProductTableFilterComposer get productId {
    final $$CachedProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableFilterComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PublishersTableFilterComposer get publisherId {
    final $$PublishersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.publisherId,
      referencedTable: $db.publishers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PublishersTableFilterComposer(
            $db: $db,
            $table: $db.publishers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedBooksTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedBooksTable> {
  $$CachedBooksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get format => $composableBuilder(
    column: $table.format,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get hasAudioVersion => $composableBuilder(
    column: $table.hasAudioVersion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get audioDuration => $composableBuilder(
    column: $table.audioDuration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get narrator => $composableBuilder(
    column: $table.narrator,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSeries => $composableBuilder(
    column: $table.isSeries,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get seriesNumber => $composableBuilder(
    column: $table.seriesNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sampleAvailable => $composableBuilder(
    column: $table.sampleAvailable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isAbridged => $composableBuilder(
    column: $table.isAbridged,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get awards => $composableBuilder(
    column: $table.awards,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedProductTableOrderingComposer get productId {
    final $$CachedProductTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableOrderingComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PublishersTableOrderingComposer get publisherId {
    final $$PublishersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.publisherId,
      referencedTable: $db.publishers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PublishersTableOrderingComposer(
            $db: $db,
            $table: $db.publishers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedBooksTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedBooksTable> {
  $$CachedBooksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get pageCount =>
      $composableBuilder(column: $table.pageCount, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<bool> get hasAudioVersion => $composableBuilder(
    column: $table.hasAudioVersion,
    builder: (column) => column,
  );

  GeneratedColumn<int> get audioDuration => $composableBuilder(
    column: $table.audioDuration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get narrator =>
      $composableBuilder(column: $table.narrator, builder: (column) => column);

  GeneratedColumn<bool> get isSeries =>
      $composableBuilder(column: $table.isSeries, builder: (column) => column);

  GeneratedColumn<String> get seriesName => $composableBuilder(
    column: $table.seriesName,
    builder: (column) => column,
  );

  GeneratedColumn<int> get seriesNumber => $composableBuilder(
    column: $table.seriesNumber,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sampleAvailable => $composableBuilder(
    column: $table.sampleAvailable,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isAbridged => $composableBuilder(
    column: $table.isAbridged,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get publicationDate => $composableBuilder(
    column: $table.publicationDate,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<List<String>?, String> get awards =>
      $composableBuilder(column: $table.awards, builder: (column) => column);

  $$CachedProductTableAnnotationComposer get productId {
    final $$CachedProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PublishersTableAnnotationComposer get publisherId {
    final $$PublishersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.publisherId,
      referencedTable: $db.publishers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PublishersTableAnnotationComposer(
            $db: $db,
            $table: $db.publishers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedBooksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedBooksTable,
          CachedBook,
          $$CachedBooksTableFilterComposer,
          $$CachedBooksTableOrderingComposer,
          $$CachedBooksTableAnnotationComposer,
          $$CachedBooksTableCreateCompanionBuilder,
          $$CachedBooksTableUpdateCompanionBuilder,
          (CachedBook, $$CachedBooksTableReferences),
          CachedBook,
          PrefetchHooks Function({bool productId, bool publisherId})
        > {
  $$CachedBooksTableTableManager(_$AppDatabase db, $CachedBooksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedBooksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedBooksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedBooksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<String> publisherId = const Value.absent(),
                Value<int> pageCount = const Value.absent(),
                Value<String> language = const Value.absent(),
                Value<String> format = const Value.absent(),
                Value<bool> hasAudioVersion = const Value.absent(),
                Value<int?> audioDuration = const Value.absent(),
                Value<String?> narrator = const Value.absent(),
                Value<bool> isSeries = const Value.absent(),
                Value<String?> seriesName = const Value.absent(),
                Value<int?> seriesNumber = const Value.absent(),
                Value<bool> sampleAvailable = const Value.absent(),
                Value<bool> isAbridged = const Value.absent(),
                Value<DateTime> publicationDate = const Value.absent(),
                Value<List<String>?> awards = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedBooksCompanion(
                productId: productId,
                publisherId: publisherId,
                pageCount: pageCount,
                language: language,
                format: format,
                hasAudioVersion: hasAudioVersion,
                audioDuration: audioDuration,
                narrator: narrator,
                isSeries: isSeries,
                seriesName: seriesName,
                seriesNumber: seriesNumber,
                sampleAvailable: sampleAvailable,
                isAbridged: isAbridged,
                publicationDate: publicationDate,
                awards: awards,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required String publisherId,
                required int pageCount,
                required String language,
                required String format,
                required bool hasAudioVersion,
                Value<int?> audioDuration = const Value.absent(),
                Value<String?> narrator = const Value.absent(),
                required bool isSeries,
                Value<String?> seriesName = const Value.absent(),
                Value<int?> seriesNumber = const Value.absent(),
                required bool sampleAvailable,
                required bool isAbridged,
                required DateTime publicationDate,
                Value<List<String>?> awards = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedBooksCompanion.insert(
                productId: productId,
                publisherId: publisherId,
                pageCount: pageCount,
                language: language,
                format: format,
                hasAudioVersion: hasAudioVersion,
                audioDuration: audioDuration,
                narrator: narrator,
                isSeries: isSeries,
                seriesName: seriesName,
                seriesNumber: seriesNumber,
                sampleAvailable: sampleAvailable,
                isAbridged: isAbridged,
                publicationDate: publicationDate,
                awards: awards,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedBooksTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, publisherId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$CachedBooksTableReferences
                                    ._productIdTable(db),
                                referencedColumn: $$CachedBooksTableReferences
                                    ._productIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (publisherId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.publisherId,
                                referencedTable: $$CachedBooksTableReferences
                                    ._publisherIdTable(db),
                                referencedColumn: $$CachedBooksTableReferences
                                    ._publisherIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CachedBooksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedBooksTable,
      CachedBook,
      $$CachedBooksTableFilterComposer,
      $$CachedBooksTableOrderingComposer,
      $$CachedBooksTableAnnotationComposer,
      $$CachedBooksTableCreateCompanionBuilder,
      $$CachedBooksTableUpdateCompanionBuilder,
      (CachedBook, $$CachedBooksTableReferences),
      CachedBook,
      PrefetchHooks Function({bool productId, bool publisherId})
    >;
typedef $$CategoriesTableCreateCompanionBuilder =
    CategoriesCompanion Function({
      required String id,
      required Map<String, String> name,
      required String type,
      Value<int> rowid,
    });
typedef $$CategoriesTableUpdateCompanionBuilder =
    CategoriesCompanion Function({
      Value<String> id,
      Value<Map<String, String>> name,
      Value<String> type,
      Value<int> rowid,
    });

final class $$CategoriesTableReferences
    extends BaseReferences<_$AppDatabase, $CategoriesTable, Category> {
  $$CategoriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductCategoriesTable, List<ProductCategory>>
  _productCategoriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.productCategories,
        aliasName: $_aliasNameGenerator(
          db.categories.id,
          db.productCategories.categoryId,
        ),
      );

  $$ProductCategoriesTableProcessedTableManager get productCategoriesRefs {
    final manager = $$ProductCategoriesTableTableManager(
      $_db,
      $_db.productCategories,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _productCategoriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableFilterComposer({
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

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productCategoriesRefs(
    Expression<bool> Function($$ProductCategoriesTableFilterComposer f) f,
  ) {
    final $$ProductCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productCategories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.productCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesTable> {
  $$CategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  Expression<T> productCategoriesRefs<T extends Object>(
    Expression<T> Function($$ProductCategoriesTableAnnotationComposer a) f,
  ) {
    final $$ProductCategoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.productCategories,
          getReferencedColumn: (t) => t.categoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ProductCategoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.productCategories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesTable,
          Category,
          $$CategoriesTableFilterComposer,
          $$CategoriesTableOrderingComposer,
          $$CategoriesTableAnnotationComposer,
          $$CategoriesTableCreateCompanionBuilder,
          $$CategoriesTableUpdateCompanionBuilder,
          (Category, $$CategoriesTableReferences),
          Category,
          PrefetchHooks Function({bool productCategoriesRefs})
        > {
  $$CategoriesTableTableManager(_$AppDatabase db, $CategoriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<Map<String, String>> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion(
                id: id,
                name: name,
                type: type,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required Map<String, String> name,
                required String type,
                Value<int> rowid = const Value.absent(),
              }) => CategoriesCompanion.insert(
                id: id,
                name: name,
                type: type,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productCategoriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productCategoriesRefs) db.productCategories,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productCategoriesRefs)
                    await $_getPrefetchedData<
                      Category,
                      $CategoriesTable,
                      ProductCategory
                    >(
                      currentTable: table,
                      referencedTable: $$CategoriesTableReferences
                          ._productCategoriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).productCategoriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesTable,
      Category,
      $$CategoriesTableFilterComposer,
      $$CategoriesTableOrderingComposer,
      $$CategoriesTableAnnotationComposer,
      $$CategoriesTableCreateCompanionBuilder,
      $$CategoriesTableUpdateCompanionBuilder,
      (Category, $$CategoriesTableReferences),
      Category,
      PrefetchHooks Function({bool productCategoriesRefs})
    >;
typedef $$TagsTableCreateCompanionBuilder =
    TagsCompanion Function({
      required String id,
      required Map<String, String> name,
      required String type,
      Value<int> rowid,
    });
typedef $$TagsTableUpdateCompanionBuilder =
    TagsCompanion Function({
      Value<String> id,
      Value<Map<String, String>> name,
      Value<String> type,
      Value<int> rowid,
    });

final class $$TagsTableReferences
    extends BaseReferences<_$AppDatabase, $TagsTable, Tag> {
  $$TagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductTagsTable, List<ProductTag>>
  _productTagsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.productTags,
    aliasName: $_aliasNameGenerator(db.tags.id, db.productTags.tagId),
  );

  $$ProductTagsTableProcessedTableManager get productTagsRefs {
    final manager = $$ProductTagsTableTableManager(
      $_db,
      $_db.productTags,
    ).filter((f) => f.tagId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productTagsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TagsTableFilterComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableFilterComposer({
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

  ColumnWithTypeConverterFilters<
    Map<String, String>,
    Map<String, String>,
    String
  >
  get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> productTagsRefs(
    Expression<bool> Function($$ProductTagsTableFilterComposer f) f,
  ) {
    final $$ProductTagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTagsTableFilterComposer(
            $db: $db,
            $table: $db.productTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableOrderingComposer extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TagsTable> {
  $$TagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  Expression<T> productTagsRefs<T extends Object>(
    Expression<T> Function($$ProductTagsTableAnnotationComposer a) f,
  ) {
    final $$ProductTagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.productTags,
      getReferencedColumn: (t) => t.tagId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTagsTableAnnotationComposer(
            $db: $db,
            $table: $db.productTags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TagsTable,
          Tag,
          $$TagsTableFilterComposer,
          $$TagsTableOrderingComposer,
          $$TagsTableAnnotationComposer,
          $$TagsTableCreateCompanionBuilder,
          $$TagsTableUpdateCompanionBuilder,
          (Tag, $$TagsTableReferences),
          Tag,
          PrefetchHooks Function({bool productTagsRefs})
        > {
  $$TagsTableTableManager(_$AppDatabase db, $TagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<Map<String, String>> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion(id: id, name: name, type: type, rowid: rowid),
          createCompanionCallback:
              ({
                required String id,
                required Map<String, String> name,
                required String type,
                Value<int> rowid = const Value.absent(),
              }) => TagsCompanion.insert(
                id: id,
                name: name,
                type: type,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TagsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({productTagsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (productTagsRefs) db.productTags],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productTagsRefs)
                    await $_getPrefetchedData<Tag, $TagsTable, ProductTag>(
                      currentTable: table,
                      referencedTable: $$TagsTableReferences
                          ._productTagsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$TagsTableReferences(db, table, p0).productTagsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.tagId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TagsTable,
      Tag,
      $$TagsTableFilterComposer,
      $$TagsTableOrderingComposer,
      $$TagsTableAnnotationComposer,
      $$TagsTableCreateCompanionBuilder,
      $$TagsTableUpdateCompanionBuilder,
      (Tag, $$TagsTableReferences),
      Tag,
      PrefetchHooks Function({bool productTagsRefs})
    >;
typedef $$ProductCategoriesTableCreateCompanionBuilder =
    ProductCategoriesCompanion Function({
      required String productId,
      required String categoryId,
      Value<int> rowid,
    });
typedef $$ProductCategoriesTableUpdateCompanionBuilder =
    ProductCategoriesCompanion Function({
      Value<String> productId,
      Value<String> categoryId,
      Value<int> rowid,
    });

final class $$ProductCategoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ProductCategoriesTable,
          ProductCategory
        > {
  $$ProductCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CachedProductTable _productIdTable(_$AppDatabase db) =>
      db.cachedProduct.createAlias(
        $_aliasNameGenerator(
          db.productCategories.productId,
          db.cachedProduct.id,
        ),
      );

  $$CachedProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$CachedProductTableTableManager(
      $_db,
      $_db.cachedProduct,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.categories.createAlias(
        $_aliasNameGenerator(db.productCategories.categoryId, db.categories.id),
      );

  $$CategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<String>('category_id')!;

    final manager = $$CategoriesTableTableManager(
      $_db,
      $_db.categories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ProductCategoriesTable> {
  $$ProductCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CachedProductTableFilterComposer get productId {
    final $$CachedProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableFilterComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableFilterComposer get categoryId {
    final $$CategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableFilterComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductCategoriesTable> {
  $$ProductCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CachedProductTableOrderingComposer get productId {
    final $$CachedProductTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableOrderingComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableOrderingComposer get categoryId {
    final $$CategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductCategoriesTable> {
  $$ProductCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CachedProductTableAnnotationComposer get productId {
    final $$CachedProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CategoriesTableAnnotationComposer get categoryId {
    final $$CategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.categories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.categories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductCategoriesTable,
          ProductCategory,
          $$ProductCategoriesTableFilterComposer,
          $$ProductCategoriesTableOrderingComposer,
          $$ProductCategoriesTableAnnotationComposer,
          $$ProductCategoriesTableCreateCompanionBuilder,
          $$ProductCategoriesTableUpdateCompanionBuilder,
          (ProductCategory, $$ProductCategoriesTableReferences),
          ProductCategory,
          PrefetchHooks Function({bool productId, bool categoryId})
        > {
  $$ProductCategoriesTableTableManager(
    _$AppDatabase db,
    $ProductCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductCategoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<String> categoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductCategoriesCompanion(
                productId: productId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required String categoryId,
                Value<int> rowid = const Value.absent(),
              }) => ProductCategoriesCompanion.insert(
                productId: productId,
                categoryId: categoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable:
                                    $$ProductCategoriesTableReferences
                                        ._productIdTable(db),
                                referencedColumn:
                                    $$ProductCategoriesTableReferences
                                        ._productIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable:
                                    $$ProductCategoriesTableReferences
                                        ._categoryIdTable(db),
                                referencedColumn:
                                    $$ProductCategoriesTableReferences
                                        ._categoryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductCategoriesTable,
      ProductCategory,
      $$ProductCategoriesTableFilterComposer,
      $$ProductCategoriesTableOrderingComposer,
      $$ProductCategoriesTableAnnotationComposer,
      $$ProductCategoriesTableCreateCompanionBuilder,
      $$ProductCategoriesTableUpdateCompanionBuilder,
      (ProductCategory, $$ProductCategoriesTableReferences),
      ProductCategory,
      PrefetchHooks Function({bool productId, bool categoryId})
    >;
typedef $$ProductTagsTableCreateCompanionBuilder =
    ProductTagsCompanion Function({
      required String productId,
      required String tagId,
      Value<int> rowid,
    });
typedef $$ProductTagsTableUpdateCompanionBuilder =
    ProductTagsCompanion Function({
      Value<String> productId,
      Value<String> tagId,
      Value<int> rowid,
    });

final class $$ProductTagsTableReferences
    extends BaseReferences<_$AppDatabase, $ProductTagsTable, ProductTag> {
  $$ProductTagsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CachedProductTable _productIdTable(_$AppDatabase db) =>
      db.cachedProduct.createAlias(
        $_aliasNameGenerator(db.productTags.productId, db.cachedProduct.id),
      );

  $$CachedProductTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$CachedProductTableTableManager(
      $_db,
      $_db.cachedProduct,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TagsTable _tagIdTable(_$AppDatabase db) => db.tags.createAlias(
    $_aliasNameGenerator(db.productTags.tagId, db.tags.id),
  );

  $$TagsTableProcessedTableManager get tagId {
    final $_column = $_itemColumn<String>('tag_id')!;

    final manager = $$TagsTableTableManager(
      $_db,
      $_db.tags,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_tagIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProductTagsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductTagsTable> {
  $$ProductTagsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CachedProductTableFilterComposer get productId {
    final $$CachedProductTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableFilterComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableFilterComposer get tagId {
    final $$TagsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableFilterComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTagsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductTagsTable> {
  $$ProductTagsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CachedProductTableOrderingComposer get productId {
    final $$CachedProductTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableOrderingComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableOrderingComposer get tagId {
    final $$TagsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableOrderingComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTagsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductTagsTable> {
  $$ProductTagsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$CachedProductTableAnnotationComposer get productId {
    final $$CachedProductTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.productId,
      referencedTable: $db.cachedProduct,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedProductTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedProduct,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TagsTableAnnotationComposer get tagId {
    final $$TagsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.tagId,
      referencedTable: $db.tags,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TagsTableAnnotationComposer(
            $db: $db,
            $table: $db.tags,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProductTagsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductTagsTable,
          ProductTag,
          $$ProductTagsTableFilterComposer,
          $$ProductTagsTableOrderingComposer,
          $$ProductTagsTableAnnotationComposer,
          $$ProductTagsTableCreateCompanionBuilder,
          $$ProductTagsTableUpdateCompanionBuilder,
          (ProductTag, $$ProductTagsTableReferences),
          ProductTag,
          PrefetchHooks Function({bool productId, bool tagId})
        > {
  $$ProductTagsTableTableManager(_$AppDatabase db, $ProductTagsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTagsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTagsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTagsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> productId = const Value.absent(),
                Value<String> tagId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductTagsCompanion(
                productId: productId,
                tagId: tagId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String productId,
                required String tagId,
                Value<int> rowid = const Value.absent(),
              }) => ProductTagsCompanion.insert(
                productId: productId,
                tagId: tagId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductTagsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({productId = false, tagId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (productId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.productId,
                                referencedTable: $$ProductTagsTableReferences
                                    ._productIdTable(db),
                                referencedColumn: $$ProductTagsTableReferences
                                    ._productIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (tagId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.tagId,
                                referencedTable: $$ProductTagsTableReferences
                                    ._tagIdTable(db),
                                referencedColumn: $$ProductTagsTableReferences
                                    ._tagIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ProductTagsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductTagsTable,
      ProductTag,
      $$ProductTagsTableFilterComposer,
      $$ProductTagsTableOrderingComposer,
      $$ProductTagsTableAnnotationComposer,
      $$ProductTagsTableCreateCompanionBuilder,
      $$ProductTagsTableUpdateCompanionBuilder,
      (ProductTag, $$ProductTagsTableReferences),
      ProductTag,
      PrefetchHooks Function({bool productId, bool tagId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedProductTableTableManager get cachedProduct =>
      $$CachedProductTableTableManager(_db, _db.cachedProduct);
  $$ProductTranslationsTableTableManager get productTranslations =>
      $$ProductTranslationsTableTableManager(_db, _db.productTranslations);
  $ProductTitleFtsTableManager get productTitleFts =>
      $ProductTitleFtsTableManager(_db, _db.productTitleFts);
  $$SyncStateTableTableManager get syncState =>
      $$SyncStateTableTableManager(_db, _db.syncState);
  $$DevelopersTableTableManager get developers =>
      $$DevelopersTableTableManager(_db, _db.developers);
  $$CachedSoftwareProductTableTableManager get cachedSoftwareProduct =>
      $$CachedSoftwareProductTableTableManager(_db, _db.cachedSoftwareProduct);
  $$CachedGamesTableTableManager get cachedGames =>
      $$CachedGamesTableTableManager(_db, _db.cachedGames);
  $$CachedAppsTableTableManager get cachedApps =>
      $$CachedAppsTableTableManager(_db, _db.cachedApps);
  $$PublishersTableTableManager get publishers =>
      $$PublishersTableTableManager(_db, _db.publishers);
  $$CachedBooksTableTableManager get cachedBooks =>
      $$CachedBooksTableTableManager(_db, _db.cachedBooks);
  $$CategoriesTableTableManager get categories =>
      $$CategoriesTableTableManager(_db, _db.categories);
  $$TagsTableTableManager get tags => $$TagsTableTableManager(_db, _db.tags);
  $$ProductCategoriesTableTableManager get productCategories =>
      $$ProductCategoriesTableTableManager(_db, _db.productCategories);
  $$ProductTagsTableTableManager get productTags =>
      $$ProductTagsTableTableManager(_db, _db.productTags);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ScanRecordsTable extends ScanRecords
    with TableInfo<$ScanRecordsTable, ScanRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScanRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _rawValueMeta =
      const VerificationMeta('rawValue');
  @override
  late final GeneratedColumn<String> rawValue = GeneratedColumn<String>(
      'raw_value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parsedTitleMeta =
      const VerificationMeta('parsedTitle');
  @override
  late final GeneratedColumn<String> parsedTitle = GeneratedColumn<String>(
      'parsed_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _parsedSubtitleMeta =
      const VerificationMeta('parsedSubtitle');
  @override
  late final GeneratedColumn<String> parsedSubtitle = GeneratedColumn<String>(
      'parsed_subtitle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<CodeContent, int> contentType =
      GeneratedColumn<int>('content_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<CodeContent>($ScanRecordsTable.$convertercontentType);
  @override
  late final GeneratedColumnWithTypeConverter<CodeFormat, int> codeFormat =
      GeneratedColumn<int>('code_format', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<CodeFormat>($ScanRecordsTable.$convertercodeFormat);
  @override
  late final GeneratedColumnWithTypeConverter<SourceType, int> sourceType =
      GeneratedColumn<int>('source_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<SourceType>($ScanRecordsTable.$convertersourceType);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_favorite" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _imagePathMeta =
      const VerificationMeta('imagePath');
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
      'image_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _extraDataMeta =
      const VerificationMeta('extraData');
  @override
  late final GeneratedColumn<String> extraData = GeneratedColumn<String>(
      'extra_data', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        rawValue,
        parsedTitle,
        parsedSubtitle,
        contentType,
        codeFormat,
        sourceType,
        isFavorite,
        imagePath,
        extraData,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scan_records';
  @override
  VerificationContext validateIntegrity(Insertable<ScanRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('raw_value')) {
      context.handle(_rawValueMeta,
          rawValue.isAcceptableOrUnknown(data['raw_value']!, _rawValueMeta));
    } else if (isInserting) {
      context.missing(_rawValueMeta);
    }
    if (data.containsKey('parsed_title')) {
      context.handle(
          _parsedTitleMeta,
          parsedTitle.isAcceptableOrUnknown(
              data['parsed_title']!, _parsedTitleMeta));
    }
    if (data.containsKey('parsed_subtitle')) {
      context.handle(
          _parsedSubtitleMeta,
          parsedSubtitle.isAcceptableOrUnknown(
              data['parsed_subtitle']!, _parsedSubtitleMeta));
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    if (data.containsKey('image_path')) {
      context.handle(_imagePathMeta,
          imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta));
    }
    if (data.containsKey('extra_data')) {
      context.handle(_extraDataMeta,
          extraData.isAcceptableOrUnknown(data['extra_data']!, _extraDataMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScanRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScanRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      rawValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}raw_value'])!,
      parsedTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parsed_title']),
      parsedSubtitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parsed_subtitle']),
      contentType: $ScanRecordsTable.$convertercontentType.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}content_type'])!),
      codeFormat: $ScanRecordsTable.$convertercodeFormat.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}code_format'])!),
      sourceType: $ScanRecordsTable.$convertersourceType.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}source_type'])!),
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
      imagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_path']),
      extraData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}extra_data']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $ScanRecordsTable createAlias(String alias) {
    return $ScanRecordsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CodeContent, int, int> $convertercontentType =
      const EnumIndexConverter<CodeContent>(CodeContent.values);
  static JsonTypeConverter2<CodeFormat, int, int> $convertercodeFormat =
      const EnumIndexConverter<CodeFormat>(CodeFormat.values);
  static JsonTypeConverter2<SourceType, int, int> $convertersourceType =
      const EnumIndexConverter<SourceType>(SourceType.values);
}

class ScanRecord extends DataClass implements Insertable<ScanRecord> {
  final int id;
  final String rawValue;
  final String? parsedTitle;
  final String? parsedSubtitle;
  final CodeContent contentType;
  final CodeFormat codeFormat;
  final SourceType sourceType;
  final bool isFavorite;
  final String? imagePath;
  final String? extraData;
  final DateTime createdAt;
  const ScanRecord(
      {required this.id,
      required this.rawValue,
      this.parsedTitle,
      this.parsedSubtitle,
      required this.contentType,
      required this.codeFormat,
      required this.sourceType,
      required this.isFavorite,
      this.imagePath,
      this.extraData,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['raw_value'] = Variable<String>(rawValue);
    if (!nullToAbsent || parsedTitle != null) {
      map['parsed_title'] = Variable<String>(parsedTitle);
    }
    if (!nullToAbsent || parsedSubtitle != null) {
      map['parsed_subtitle'] = Variable<String>(parsedSubtitle);
    }
    {
      map['content_type'] = Variable<int>(
          $ScanRecordsTable.$convertercontentType.toSql(contentType));
    }
    {
      map['code_format'] = Variable<int>(
          $ScanRecordsTable.$convertercodeFormat.toSql(codeFormat));
    }
    {
      map['source_type'] = Variable<int>(
          $ScanRecordsTable.$convertersourceType.toSql(sourceType));
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    if (!nullToAbsent || imagePath != null) {
      map['image_path'] = Variable<String>(imagePath);
    }
    if (!nullToAbsent || extraData != null) {
      map['extra_data'] = Variable<String>(extraData);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ScanRecordsCompanion toCompanion(bool nullToAbsent) {
    return ScanRecordsCompanion(
      id: Value(id),
      rawValue: Value(rawValue),
      parsedTitle: parsedTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedTitle),
      parsedSubtitle: parsedSubtitle == null && nullToAbsent
          ? const Value.absent()
          : Value(parsedSubtitle),
      contentType: Value(contentType),
      codeFormat: Value(codeFormat),
      sourceType: Value(sourceType),
      isFavorite: Value(isFavorite),
      imagePath: imagePath == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePath),
      extraData: extraData == null && nullToAbsent
          ? const Value.absent()
          : Value(extraData),
      createdAt: Value(createdAt),
    );
  }

  factory ScanRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScanRecord(
      id: serializer.fromJson<int>(json['id']),
      rawValue: serializer.fromJson<String>(json['rawValue']),
      parsedTitle: serializer.fromJson<String?>(json['parsedTitle']),
      parsedSubtitle: serializer.fromJson<String?>(json['parsedSubtitle']),
      contentType: $ScanRecordsTable.$convertercontentType
          .fromJson(serializer.fromJson<int>(json['contentType'])),
      codeFormat: $ScanRecordsTable.$convertercodeFormat
          .fromJson(serializer.fromJson<int>(json['codeFormat'])),
      sourceType: $ScanRecordsTable.$convertersourceType
          .fromJson(serializer.fromJson<int>(json['sourceType'])),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      imagePath: serializer.fromJson<String?>(json['imagePath']),
      extraData: serializer.fromJson<String?>(json['extraData']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'rawValue': serializer.toJson<String>(rawValue),
      'parsedTitle': serializer.toJson<String?>(parsedTitle),
      'parsedSubtitle': serializer.toJson<String?>(parsedSubtitle),
      'contentType': serializer.toJson<int>(
          $ScanRecordsTable.$convertercontentType.toJson(contentType)),
      'codeFormat': serializer.toJson<int>(
          $ScanRecordsTable.$convertercodeFormat.toJson(codeFormat)),
      'sourceType': serializer.toJson<int>(
          $ScanRecordsTable.$convertersourceType.toJson(sourceType)),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'imagePath': serializer.toJson<String?>(imagePath),
      'extraData': serializer.toJson<String?>(extraData),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ScanRecord copyWith(
          {int? id,
          String? rawValue,
          Value<String?> parsedTitle = const Value.absent(),
          Value<String?> parsedSubtitle = const Value.absent(),
          CodeContent? contentType,
          CodeFormat? codeFormat,
          SourceType? sourceType,
          bool? isFavorite,
          Value<String?> imagePath = const Value.absent(),
          Value<String?> extraData = const Value.absent(),
          DateTime? createdAt}) =>
      ScanRecord(
        id: id ?? this.id,
        rawValue: rawValue ?? this.rawValue,
        parsedTitle: parsedTitle.present ? parsedTitle.value : this.parsedTitle,
        parsedSubtitle:
            parsedSubtitle.present ? parsedSubtitle.value : this.parsedSubtitle,
        contentType: contentType ?? this.contentType,
        codeFormat: codeFormat ?? this.codeFormat,
        sourceType: sourceType ?? this.sourceType,
        isFavorite: isFavorite ?? this.isFavorite,
        imagePath: imagePath.present ? imagePath.value : this.imagePath,
        extraData: extraData.present ? extraData.value : this.extraData,
        createdAt: createdAt ?? this.createdAt,
      );
  ScanRecord copyWithCompanion(ScanRecordsCompanion data) {
    return ScanRecord(
      id: data.id.present ? data.id.value : this.id,
      rawValue: data.rawValue.present ? data.rawValue.value : this.rawValue,
      parsedTitle:
          data.parsedTitle.present ? data.parsedTitle.value : this.parsedTitle,
      parsedSubtitle: data.parsedSubtitle.present
          ? data.parsedSubtitle.value
          : this.parsedSubtitle,
      contentType:
          data.contentType.present ? data.contentType.value : this.contentType,
      codeFormat:
          data.codeFormat.present ? data.codeFormat.value : this.codeFormat,
      sourceType:
          data.sourceType.present ? data.sourceType.value : this.sourceType,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      extraData: data.extraData.present ? data.extraData.value : this.extraData,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScanRecord(')
          ..write('id: $id, ')
          ..write('rawValue: $rawValue, ')
          ..write('parsedTitle: $parsedTitle, ')
          ..write('parsedSubtitle: $parsedSubtitle, ')
          ..write('contentType: $contentType, ')
          ..write('codeFormat: $codeFormat, ')
          ..write('sourceType: $sourceType, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('imagePath: $imagePath, ')
          ..write('extraData: $extraData, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      rawValue,
      parsedTitle,
      parsedSubtitle,
      contentType,
      codeFormat,
      sourceType,
      isFavorite,
      imagePath,
      extraData,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScanRecord &&
          other.id == this.id &&
          other.rawValue == this.rawValue &&
          other.parsedTitle == this.parsedTitle &&
          other.parsedSubtitle == this.parsedSubtitle &&
          other.contentType == this.contentType &&
          other.codeFormat == this.codeFormat &&
          other.sourceType == this.sourceType &&
          other.isFavorite == this.isFavorite &&
          other.imagePath == this.imagePath &&
          other.extraData == this.extraData &&
          other.createdAt == this.createdAt);
}

class ScanRecordsCompanion extends UpdateCompanion<ScanRecord> {
  final Value<int> id;
  final Value<String> rawValue;
  final Value<String?> parsedTitle;
  final Value<String?> parsedSubtitle;
  final Value<CodeContent> contentType;
  final Value<CodeFormat> codeFormat;
  final Value<SourceType> sourceType;
  final Value<bool> isFavorite;
  final Value<String?> imagePath;
  final Value<String?> extraData;
  final Value<DateTime> createdAt;
  const ScanRecordsCompanion({
    this.id = const Value.absent(),
    this.rawValue = const Value.absent(),
    this.parsedTitle = const Value.absent(),
    this.parsedSubtitle = const Value.absent(),
    this.contentType = const Value.absent(),
    this.codeFormat = const Value.absent(),
    this.sourceType = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.extraData = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ScanRecordsCompanion.insert({
    this.id = const Value.absent(),
    required String rawValue,
    this.parsedTitle = const Value.absent(),
    this.parsedSubtitle = const Value.absent(),
    required CodeContent contentType,
    required CodeFormat codeFormat,
    required SourceType sourceType,
    this.isFavorite = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.extraData = const Value.absent(),
    this.createdAt = const Value.absent(),
  })  : rawValue = Value(rawValue),
        contentType = Value(contentType),
        codeFormat = Value(codeFormat),
        sourceType = Value(sourceType);
  static Insertable<ScanRecord> custom({
    Expression<int>? id,
    Expression<String>? rawValue,
    Expression<String>? parsedTitle,
    Expression<String>? parsedSubtitle,
    Expression<int>? contentType,
    Expression<int>? codeFormat,
    Expression<int>? sourceType,
    Expression<bool>? isFavorite,
    Expression<String>? imagePath,
    Expression<String>? extraData,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (rawValue != null) 'raw_value': rawValue,
      if (parsedTitle != null) 'parsed_title': parsedTitle,
      if (parsedSubtitle != null) 'parsed_subtitle': parsedSubtitle,
      if (contentType != null) 'content_type': contentType,
      if (codeFormat != null) 'code_format': codeFormat,
      if (sourceType != null) 'source_type': sourceType,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (imagePath != null) 'image_path': imagePath,
      if (extraData != null) 'extra_data': extraData,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ScanRecordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? rawValue,
      Value<String?>? parsedTitle,
      Value<String?>? parsedSubtitle,
      Value<CodeContent>? contentType,
      Value<CodeFormat>? codeFormat,
      Value<SourceType>? sourceType,
      Value<bool>? isFavorite,
      Value<String?>? imagePath,
      Value<String?>? extraData,
      Value<DateTime>? createdAt}) {
    return ScanRecordsCompanion(
      id: id ?? this.id,
      rawValue: rawValue ?? this.rawValue,
      parsedTitle: parsedTitle ?? this.parsedTitle,
      parsedSubtitle: parsedSubtitle ?? this.parsedSubtitle,
      contentType: contentType ?? this.contentType,
      codeFormat: codeFormat ?? this.codeFormat,
      sourceType: sourceType ?? this.sourceType,
      isFavorite: isFavorite ?? this.isFavorite,
      imagePath: imagePath ?? this.imagePath,
      extraData: extraData ?? this.extraData,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (rawValue.present) {
      map['raw_value'] = Variable<String>(rawValue.value);
    }
    if (parsedTitle.present) {
      map['parsed_title'] = Variable<String>(parsedTitle.value);
    }
    if (parsedSubtitle.present) {
      map['parsed_subtitle'] = Variable<String>(parsedSubtitle.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<int>(
          $ScanRecordsTable.$convertercontentType.toSql(contentType.value));
    }
    if (codeFormat.present) {
      map['code_format'] = Variable<int>(
          $ScanRecordsTable.$convertercodeFormat.toSql(codeFormat.value));
    }
    if (sourceType.present) {
      map['source_type'] = Variable<int>(
          $ScanRecordsTable.$convertersourceType.toSql(sourceType.value));
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (extraData.present) {
      map['extra_data'] = Variable<String>(extraData.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScanRecordsCompanion(')
          ..write('id: $id, ')
          ..write('rawValue: $rawValue, ')
          ..write('parsedTitle: $parsedTitle, ')
          ..write('parsedSubtitle: $parsedSubtitle, ')
          ..write('contentType: $contentType, ')
          ..write('codeFormat: $codeFormat, ')
          ..write('sourceType: $sourceType, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('imagePath: $imagePath, ')
          ..write('extraData: $extraData, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTableTable extends AppSettingsTable
    with TableInfo<$AppSettingsTableTable, AppSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  late final GeneratedColumnWithTypeConverter<ThemeModeOption, int> themeMode =
      GeneratedColumn<int>('theme_mode', aliasedName, false,
              type: DriftSqlType.int,
              requiredDuringInsert: false,
              defaultValue: const Constant(0))
          .withConverter<ThemeModeOption>(
              $AppSettingsTableTable.$converterthemeMode);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('en'));
  static const VerificationMeta _beepEnabledMeta =
      const VerificationMeta('beepEnabled');
  @override
  late final GeneratedColumn<bool> beepEnabled = GeneratedColumn<bool>(
      'beep_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("beep_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _vibrateEnabledMeta =
      const VerificationMeta('vibrateEnabled');
  @override
  late final GeneratedColumn<bool> vibrateEnabled = GeneratedColumn<bool>(
      'vibrate_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("vibrate_enabled" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _saveHistoryMeta =
      const VerificationMeta('saveHistory');
  @override
  late final GeneratedColumn<bool> saveHistory = GeneratedColumn<bool>(
      'save_history', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("save_history" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _storeImagesMeta =
      const VerificationMeta('storeImages');
  @override
  late final GeneratedColumn<bool> storeImages = GeneratedColumn<bool>(
      'store_images', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("store_images" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _autoCopyClipboardMeta =
      const VerificationMeta('autoCopyClipboard');
  @override
  late final GeneratedColumn<bool> autoCopyClipboard = GeneratedColumn<bool>(
      'auto_copy_clipboard', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("auto_copy_clipboard" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _autoOpenUrlMeta =
      const VerificationMeta('autoOpenUrl');
  @override
  late final GeneratedColumn<bool> autoOpenUrl = GeneratedColumn<bool>(
      'auto_open_url', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("auto_open_url" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _bulkScanModeMeta =
      const VerificationMeta('bulkScanMode');
  @override
  late final GeneratedColumn<bool> bulkScanMode = GeneratedColumn<bool>(
      'bulk_scan_mode', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("bulk_scan_mode" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        themeMode,
        language,
        beepEnabled,
        vibrateEnabled,
        saveHistory,
        storeImages,
        autoCopyClipboard,
        autoOpenUrl,
        bulkScanMode
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
      Insertable<AppSettingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    }
    if (data.containsKey('beep_enabled')) {
      context.handle(
          _beepEnabledMeta,
          beepEnabled.isAcceptableOrUnknown(
              data['beep_enabled']!, _beepEnabledMeta));
    }
    if (data.containsKey('vibrate_enabled')) {
      context.handle(
          _vibrateEnabledMeta,
          vibrateEnabled.isAcceptableOrUnknown(
              data['vibrate_enabled']!, _vibrateEnabledMeta));
    }
    if (data.containsKey('save_history')) {
      context.handle(
          _saveHistoryMeta,
          saveHistory.isAcceptableOrUnknown(
              data['save_history']!, _saveHistoryMeta));
    }
    if (data.containsKey('store_images')) {
      context.handle(
          _storeImagesMeta,
          storeImages.isAcceptableOrUnknown(
              data['store_images']!, _storeImagesMeta));
    }
    if (data.containsKey('auto_copy_clipboard')) {
      context.handle(
          _autoCopyClipboardMeta,
          autoCopyClipboard.isAcceptableOrUnknown(
              data['auto_copy_clipboard']!, _autoCopyClipboardMeta));
    }
    if (data.containsKey('auto_open_url')) {
      context.handle(
          _autoOpenUrlMeta,
          autoOpenUrl.isAcceptableOrUnknown(
              data['auto_open_url']!, _autoOpenUrlMeta));
    }
    if (data.containsKey('bulk_scan_mode')) {
      context.handle(
          _bulkScanModeMeta,
          bulkScanMode.isAcceptableOrUnknown(
              data['bulk_scan_mode']!, _bulkScanModeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      themeMode: $AppSettingsTableTable.$converterthemeMode.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.int, data['${effectivePrefix}theme_mode'])!),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      beepEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}beep_enabled'])!,
      vibrateEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}vibrate_enabled'])!,
      saveHistory: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}save_history'])!,
      storeImages: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}store_images'])!,
      autoCopyClipboard: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}auto_copy_clipboard'])!,
      autoOpenUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}auto_open_url'])!,
      bulkScanMode: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}bulk_scan_mode'])!,
    );
  }

  @override
  $AppSettingsTableTable createAlias(String alias) {
    return $AppSettingsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ThemeModeOption, int, int> $converterthemeMode =
      const EnumIndexConverter<ThemeModeOption>(ThemeModeOption.values);
}

class AppSettingsTableData extends DataClass
    implements Insertable<AppSettingsTableData> {
  final int id;
  final ThemeModeOption themeMode;
  final String language;
  final bool beepEnabled;
  final bool vibrateEnabled;
  final bool saveHistory;
  final bool storeImages;
  final bool autoCopyClipboard;
  final bool autoOpenUrl;
  final bool bulkScanMode;
  const AppSettingsTableData(
      {required this.id,
      required this.themeMode,
      required this.language,
      required this.beepEnabled,
      required this.vibrateEnabled,
      required this.saveHistory,
      required this.storeImages,
      required this.autoCopyClipboard,
      required this.autoOpenUrl,
      required this.bulkScanMode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['theme_mode'] = Variable<int>(
          $AppSettingsTableTable.$converterthemeMode.toSql(themeMode));
    }
    map['language'] = Variable<String>(language);
    map['beep_enabled'] = Variable<bool>(beepEnabled);
    map['vibrate_enabled'] = Variable<bool>(vibrateEnabled);
    map['save_history'] = Variable<bool>(saveHistory);
    map['store_images'] = Variable<bool>(storeImages);
    map['auto_copy_clipboard'] = Variable<bool>(autoCopyClipboard);
    map['auto_open_url'] = Variable<bool>(autoOpenUrl);
    map['bulk_scan_mode'] = Variable<bool>(bulkScanMode);
    return map;
  }

  AppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsTableCompanion(
      id: Value(id),
      themeMode: Value(themeMode),
      language: Value(language),
      beepEnabled: Value(beepEnabled),
      vibrateEnabled: Value(vibrateEnabled),
      saveHistory: Value(saveHistory),
      storeImages: Value(storeImages),
      autoCopyClipboard: Value(autoCopyClipboard),
      autoOpenUrl: Value(autoOpenUrl),
      bulkScanMode: Value(bulkScanMode),
    );
  }

  factory AppSettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingsTableData(
      id: serializer.fromJson<int>(json['id']),
      themeMode: $AppSettingsTableTable.$converterthemeMode
          .fromJson(serializer.fromJson<int>(json['themeMode'])),
      language: serializer.fromJson<String>(json['language']),
      beepEnabled: serializer.fromJson<bool>(json['beepEnabled']),
      vibrateEnabled: serializer.fromJson<bool>(json['vibrateEnabled']),
      saveHistory: serializer.fromJson<bool>(json['saveHistory']),
      storeImages: serializer.fromJson<bool>(json['storeImages']),
      autoCopyClipboard: serializer.fromJson<bool>(json['autoCopyClipboard']),
      autoOpenUrl: serializer.fromJson<bool>(json['autoOpenUrl']),
      bulkScanMode: serializer.fromJson<bool>(json['bulkScanMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'themeMode': serializer.toJson<int>(
          $AppSettingsTableTable.$converterthemeMode.toJson(themeMode)),
      'language': serializer.toJson<String>(language),
      'beepEnabled': serializer.toJson<bool>(beepEnabled),
      'vibrateEnabled': serializer.toJson<bool>(vibrateEnabled),
      'saveHistory': serializer.toJson<bool>(saveHistory),
      'storeImages': serializer.toJson<bool>(storeImages),
      'autoCopyClipboard': serializer.toJson<bool>(autoCopyClipboard),
      'autoOpenUrl': serializer.toJson<bool>(autoOpenUrl),
      'bulkScanMode': serializer.toJson<bool>(bulkScanMode),
    };
  }

  AppSettingsTableData copyWith(
          {int? id,
          ThemeModeOption? themeMode,
          String? language,
          bool? beepEnabled,
          bool? vibrateEnabled,
          bool? saveHistory,
          bool? storeImages,
          bool? autoCopyClipboard,
          bool? autoOpenUrl,
          bool? bulkScanMode}) =>
      AppSettingsTableData(
        id: id ?? this.id,
        themeMode: themeMode ?? this.themeMode,
        language: language ?? this.language,
        beepEnabled: beepEnabled ?? this.beepEnabled,
        vibrateEnabled: vibrateEnabled ?? this.vibrateEnabled,
        saveHistory: saveHistory ?? this.saveHistory,
        storeImages: storeImages ?? this.storeImages,
        autoCopyClipboard: autoCopyClipboard ?? this.autoCopyClipboard,
        autoOpenUrl: autoOpenUrl ?? this.autoOpenUrl,
        bulkScanMode: bulkScanMode ?? this.bulkScanMode,
      );
  AppSettingsTableData copyWithCompanion(AppSettingsTableCompanion data) {
    return AppSettingsTableData(
      id: data.id.present ? data.id.value : this.id,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      language: data.language.present ? data.language.value : this.language,
      beepEnabled:
          data.beepEnabled.present ? data.beepEnabled.value : this.beepEnabled,
      vibrateEnabled: data.vibrateEnabled.present
          ? data.vibrateEnabled.value
          : this.vibrateEnabled,
      saveHistory:
          data.saveHistory.present ? data.saveHistory.value : this.saveHistory,
      storeImages:
          data.storeImages.present ? data.storeImages.value : this.storeImages,
      autoCopyClipboard: data.autoCopyClipboard.present
          ? data.autoCopyClipboard.value
          : this.autoCopyClipboard,
      autoOpenUrl:
          data.autoOpenUrl.present ? data.autoOpenUrl.value : this.autoOpenUrl,
      bulkScanMode: data.bulkScanMode.present
          ? data.bulkScanMode.value
          : this.bulkScanMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableData(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('language: $language, ')
          ..write('beepEnabled: $beepEnabled, ')
          ..write('vibrateEnabled: $vibrateEnabled, ')
          ..write('saveHistory: $saveHistory, ')
          ..write('storeImages: $storeImages, ')
          ..write('autoCopyClipboard: $autoCopyClipboard, ')
          ..write('autoOpenUrl: $autoOpenUrl, ')
          ..write('bulkScanMode: $bulkScanMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      themeMode,
      language,
      beepEnabled,
      vibrateEnabled,
      saveHistory,
      storeImages,
      autoCopyClipboard,
      autoOpenUrl,
      bulkScanMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingsTableData &&
          other.id == this.id &&
          other.themeMode == this.themeMode &&
          other.language == this.language &&
          other.beepEnabled == this.beepEnabled &&
          other.vibrateEnabled == this.vibrateEnabled &&
          other.saveHistory == this.saveHistory &&
          other.storeImages == this.storeImages &&
          other.autoCopyClipboard == this.autoCopyClipboard &&
          other.autoOpenUrl == this.autoOpenUrl &&
          other.bulkScanMode == this.bulkScanMode);
}

class AppSettingsTableCompanion extends UpdateCompanion<AppSettingsTableData> {
  final Value<int> id;
  final Value<ThemeModeOption> themeMode;
  final Value<String> language;
  final Value<bool> beepEnabled;
  final Value<bool> vibrateEnabled;
  final Value<bool> saveHistory;
  final Value<bool> storeImages;
  final Value<bool> autoCopyClipboard;
  final Value<bool> autoOpenUrl;
  final Value<bool> bulkScanMode;
  const AppSettingsTableCompanion({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.language = const Value.absent(),
    this.beepEnabled = const Value.absent(),
    this.vibrateEnabled = const Value.absent(),
    this.saveHistory = const Value.absent(),
    this.storeImages = const Value.absent(),
    this.autoCopyClipboard = const Value.absent(),
    this.autoOpenUrl = const Value.absent(),
    this.bulkScanMode = const Value.absent(),
  });
  AppSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.language = const Value.absent(),
    this.beepEnabled = const Value.absent(),
    this.vibrateEnabled = const Value.absent(),
    this.saveHistory = const Value.absent(),
    this.storeImages = const Value.absent(),
    this.autoCopyClipboard = const Value.absent(),
    this.autoOpenUrl = const Value.absent(),
    this.bulkScanMode = const Value.absent(),
  });
  static Insertable<AppSettingsTableData> custom({
    Expression<int>? id,
    Expression<int>? themeMode,
    Expression<String>? language,
    Expression<bool>? beepEnabled,
    Expression<bool>? vibrateEnabled,
    Expression<bool>? saveHistory,
    Expression<bool>? storeImages,
    Expression<bool>? autoCopyClipboard,
    Expression<bool>? autoOpenUrl,
    Expression<bool>? bulkScanMode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (themeMode != null) 'theme_mode': themeMode,
      if (language != null) 'language': language,
      if (beepEnabled != null) 'beep_enabled': beepEnabled,
      if (vibrateEnabled != null) 'vibrate_enabled': vibrateEnabled,
      if (saveHistory != null) 'save_history': saveHistory,
      if (storeImages != null) 'store_images': storeImages,
      if (autoCopyClipboard != null) 'auto_copy_clipboard': autoCopyClipboard,
      if (autoOpenUrl != null) 'auto_open_url': autoOpenUrl,
      if (bulkScanMode != null) 'bulk_scan_mode': bulkScanMode,
    });
  }

  AppSettingsTableCompanion copyWith(
      {Value<int>? id,
      Value<ThemeModeOption>? themeMode,
      Value<String>? language,
      Value<bool>? beepEnabled,
      Value<bool>? vibrateEnabled,
      Value<bool>? saveHistory,
      Value<bool>? storeImages,
      Value<bool>? autoCopyClipboard,
      Value<bool>? autoOpenUrl,
      Value<bool>? bulkScanMode}) {
    return AppSettingsTableCompanion(
      id: id ?? this.id,
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
      beepEnabled: beepEnabled ?? this.beepEnabled,
      vibrateEnabled: vibrateEnabled ?? this.vibrateEnabled,
      saveHistory: saveHistory ?? this.saveHistory,
      storeImages: storeImages ?? this.storeImages,
      autoCopyClipboard: autoCopyClipboard ?? this.autoCopyClipboard,
      autoOpenUrl: autoOpenUrl ?? this.autoOpenUrl,
      bulkScanMode: bulkScanMode ?? this.bulkScanMode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<int>(
          $AppSettingsTableTable.$converterthemeMode.toSql(themeMode.value));
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (beepEnabled.present) {
      map['beep_enabled'] = Variable<bool>(beepEnabled.value);
    }
    if (vibrateEnabled.present) {
      map['vibrate_enabled'] = Variable<bool>(vibrateEnabled.value);
    }
    if (saveHistory.present) {
      map['save_history'] = Variable<bool>(saveHistory.value);
    }
    if (storeImages.present) {
      map['store_images'] = Variable<bool>(storeImages.value);
    }
    if (autoCopyClipboard.present) {
      map['auto_copy_clipboard'] = Variable<bool>(autoCopyClipboard.value);
    }
    if (autoOpenUrl.present) {
      map['auto_open_url'] = Variable<bool>(autoOpenUrl.value);
    }
    if (bulkScanMode.present) {
      map['bulk_scan_mode'] = Variable<bool>(bulkScanMode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('themeMode: $themeMode, ')
          ..write('language: $language, ')
          ..write('beepEnabled: $beepEnabled, ')
          ..write('vibrateEnabled: $vibrateEnabled, ')
          ..write('saveHistory: $saveHistory, ')
          ..write('storeImages: $storeImages, ')
          ..write('autoCopyClipboard: $autoCopyClipboard, ')
          ..write('autoOpenUrl: $autoOpenUrl, ')
          ..write('bulkScanMode: $bulkScanMode')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ScanRecordsTable scanRecords = $ScanRecordsTable(this);
  late final $AppSettingsTableTable appSettingsTable =
      $AppSettingsTableTable(this);
  late final ScanRecordDao scanRecordDao = ScanRecordDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [scanRecords, appSettingsTable];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$ScanRecordsTableCreateCompanionBuilder = ScanRecordsCompanion
    Function({
  Value<int> id,
  required String rawValue,
  Value<String?> parsedTitle,
  Value<String?> parsedSubtitle,
  required CodeContent contentType,
  required CodeFormat codeFormat,
  required SourceType sourceType,
  Value<bool> isFavorite,
  Value<String?> imagePath,
  Value<String?> extraData,
  Value<DateTime> createdAt,
});
typedef $$ScanRecordsTableUpdateCompanionBuilder = ScanRecordsCompanion
    Function({
  Value<int> id,
  Value<String> rawValue,
  Value<String?> parsedTitle,
  Value<String?> parsedSubtitle,
  Value<CodeContent> contentType,
  Value<CodeFormat> codeFormat,
  Value<SourceType> sourceType,
  Value<bool> isFavorite,
  Value<String?> imagePath,
  Value<String?> extraData,
  Value<DateTime> createdAt,
});

class $$ScanRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $ScanRecordsTable> {
  $$ScanRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get rawValue => $composableBuilder(
      column: $table.rawValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parsedTitle => $composableBuilder(
      column: $table.parsedTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parsedSubtitle => $composableBuilder(
      column: $table.parsedSubtitle,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CodeContent, CodeContent, int>
      get contentType => $composableBuilder(
          column: $table.contentType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<CodeFormat, CodeFormat, int> get codeFormat =>
      $composableBuilder(
          column: $table.codeFormat,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<SourceType, SourceType, int> get sourceType =>
      $composableBuilder(
          column: $table.sourceType,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get extraData => $composableBuilder(
      column: $table.extraData, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$ScanRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScanRecordsTable> {
  $$ScanRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get rawValue => $composableBuilder(
      column: $table.rawValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parsedTitle => $composableBuilder(
      column: $table.parsedTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parsedSubtitle => $composableBuilder(
      column: $table.parsedSubtitle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get contentType => $composableBuilder(
      column: $table.contentType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get codeFormat => $composableBuilder(
      column: $table.codeFormat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get sourceType => $composableBuilder(
      column: $table.sourceType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imagePath => $composableBuilder(
      column: $table.imagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get extraData => $composableBuilder(
      column: $table.extraData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$ScanRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScanRecordsTable> {
  $$ScanRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get rawValue =>
      $composableBuilder(column: $table.rawValue, builder: (column) => column);

  GeneratedColumn<String> get parsedTitle => $composableBuilder(
      column: $table.parsedTitle, builder: (column) => column);

  GeneratedColumn<String> get parsedSubtitle => $composableBuilder(
      column: $table.parsedSubtitle, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CodeContent, int> get contentType =>
      $composableBuilder(
          column: $table.contentType, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CodeFormat, int> get codeFormat =>
      $composableBuilder(
          column: $table.codeFormat, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SourceType, int> get sourceType =>
      $composableBuilder(
          column: $table.sourceType, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<String> get extraData =>
      $composableBuilder(column: $table.extraData, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ScanRecordsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ScanRecordsTable,
    ScanRecord,
    $$ScanRecordsTableFilterComposer,
    $$ScanRecordsTableOrderingComposer,
    $$ScanRecordsTableAnnotationComposer,
    $$ScanRecordsTableCreateCompanionBuilder,
    $$ScanRecordsTableUpdateCompanionBuilder,
    (ScanRecord, BaseReferences<_$AppDatabase, $ScanRecordsTable, ScanRecord>),
    ScanRecord,
    PrefetchHooks Function()> {
  $$ScanRecordsTableTableManager(_$AppDatabase db, $ScanRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScanRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScanRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScanRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> rawValue = const Value.absent(),
            Value<String?> parsedTitle = const Value.absent(),
            Value<String?> parsedSubtitle = const Value.absent(),
            Value<CodeContent> contentType = const Value.absent(),
            Value<CodeFormat> codeFormat = const Value.absent(),
            Value<SourceType> sourceType = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> extraData = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ScanRecordsCompanion(
            id: id,
            rawValue: rawValue,
            parsedTitle: parsedTitle,
            parsedSubtitle: parsedSubtitle,
            contentType: contentType,
            codeFormat: codeFormat,
            sourceType: sourceType,
            isFavorite: isFavorite,
            imagePath: imagePath,
            extraData: extraData,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String rawValue,
            Value<String?> parsedTitle = const Value.absent(),
            Value<String?> parsedSubtitle = const Value.absent(),
            required CodeContent contentType,
            required CodeFormat codeFormat,
            required SourceType sourceType,
            Value<bool> isFavorite = const Value.absent(),
            Value<String?> imagePath = const Value.absent(),
            Value<String?> extraData = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              ScanRecordsCompanion.insert(
            id: id,
            rawValue: rawValue,
            parsedTitle: parsedTitle,
            parsedSubtitle: parsedSubtitle,
            contentType: contentType,
            codeFormat: codeFormat,
            sourceType: sourceType,
            isFavorite: isFavorite,
            imagePath: imagePath,
            extraData: extraData,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ScanRecordsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ScanRecordsTable,
    ScanRecord,
    $$ScanRecordsTableFilterComposer,
    $$ScanRecordsTableOrderingComposer,
    $$ScanRecordsTableAnnotationComposer,
    $$ScanRecordsTableCreateCompanionBuilder,
    $$ScanRecordsTableUpdateCompanionBuilder,
    (ScanRecord, BaseReferences<_$AppDatabase, $ScanRecordsTable, ScanRecord>),
    ScanRecord,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableTableCreateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<ThemeModeOption> themeMode,
  Value<String> language,
  Value<bool> beepEnabled,
  Value<bool> vibrateEnabled,
  Value<bool> saveHistory,
  Value<bool> storeImages,
  Value<bool> autoCopyClipboard,
  Value<bool> autoOpenUrl,
  Value<bool> bulkScanMode,
});
typedef $$AppSettingsTableTableUpdateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<int> id,
  Value<ThemeModeOption> themeMode,
  Value<String> language,
  Value<bool> beepEnabled,
  Value<bool> vibrateEnabled,
  Value<bool> saveHistory,
  Value<bool> storeImages,
  Value<bool> autoCopyClipboard,
  Value<bool> autoOpenUrl,
  Value<bool> bulkScanMode,
});

class $$AppSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<ThemeModeOption, ThemeModeOption, int>
      get themeMode => $composableBuilder(
          column: $table.themeMode,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get beepEnabled => $composableBuilder(
      column: $table.beepEnabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get vibrateEnabled => $composableBuilder(
      column: $table.vibrateEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get saveHistory => $composableBuilder(
      column: $table.saveHistory, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get storeImages => $composableBuilder(
      column: $table.storeImages, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get autoCopyClipboard => $composableBuilder(
      column: $table.autoCopyClipboard,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get autoOpenUrl => $composableBuilder(
      column: $table.autoOpenUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get bulkScanMode => $composableBuilder(
      column: $table.bulkScanMode, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get themeMode => $composableBuilder(
      column: $table.themeMode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get beepEnabled => $composableBuilder(
      column: $table.beepEnabled, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get vibrateEnabled => $composableBuilder(
      column: $table.vibrateEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get saveHistory => $composableBuilder(
      column: $table.saveHistory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get storeImages => $composableBuilder(
      column: $table.storeImages, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get autoCopyClipboard => $composableBuilder(
      column: $table.autoCopyClipboard,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get autoOpenUrl => $composableBuilder(
      column: $table.autoOpenUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get bulkScanMode => $composableBuilder(
      column: $table.bulkScanMode,
      builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ThemeModeOption, int> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<bool> get beepEnabled => $composableBuilder(
      column: $table.beepEnabled, builder: (column) => column);

  GeneratedColumn<bool> get vibrateEnabled => $composableBuilder(
      column: $table.vibrateEnabled, builder: (column) => column);

  GeneratedColumn<bool> get saveHistory => $composableBuilder(
      column: $table.saveHistory, builder: (column) => column);

  GeneratedColumn<bool> get storeImages => $composableBuilder(
      column: $table.storeImages, builder: (column) => column);

  GeneratedColumn<bool> get autoCopyClipboard => $composableBuilder(
      column: $table.autoCopyClipboard, builder: (column) => column);

  GeneratedColumn<bool> get autoOpenUrl => $composableBuilder(
      column: $table.autoOpenUrl, builder: (column) => column);

  GeneratedColumn<bool> get bulkScanMode => $composableBuilder(
      column: $table.bulkScanMode, builder: (column) => column);
}

class $$AppSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableAnnotationComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder,
    (
      AppSettingsTableData,
      BaseReferences<_$AppDatabase, $AppSettingsTableTable,
          AppSettingsTableData>
    ),
    AppSettingsTableData,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableTableManager(
      _$AppDatabase db, $AppSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ThemeModeOption> themeMode = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<bool> beepEnabled = const Value.absent(),
            Value<bool> vibrateEnabled = const Value.absent(),
            Value<bool> saveHistory = const Value.absent(),
            Value<bool> storeImages = const Value.absent(),
            Value<bool> autoCopyClipboard = const Value.absent(),
            Value<bool> autoOpenUrl = const Value.absent(),
            Value<bool> bulkScanMode = const Value.absent(),
          }) =>
              AppSettingsTableCompanion(
            id: id,
            themeMode: themeMode,
            language: language,
            beepEnabled: beepEnabled,
            vibrateEnabled: vibrateEnabled,
            saveHistory: saveHistory,
            storeImages: storeImages,
            autoCopyClipboard: autoCopyClipboard,
            autoOpenUrl: autoOpenUrl,
            bulkScanMode: bulkScanMode,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<ThemeModeOption> themeMode = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<bool> beepEnabled = const Value.absent(),
            Value<bool> vibrateEnabled = const Value.absent(),
            Value<bool> saveHistory = const Value.absent(),
            Value<bool> storeImages = const Value.absent(),
            Value<bool> autoCopyClipboard = const Value.absent(),
            Value<bool> autoOpenUrl = const Value.absent(),
            Value<bool> bulkScanMode = const Value.absent(),
          }) =>
              AppSettingsTableCompanion.insert(
            id: id,
            themeMode: themeMode,
            language: language,
            beepEnabled: beepEnabled,
            vibrateEnabled: vibrateEnabled,
            saveHistory: saveHistory,
            storeImages: storeImages,
            autoCopyClipboard: autoCopyClipboard,
            autoOpenUrl: autoOpenUrl,
            bulkScanMode: bulkScanMode,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableAnnotationComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder,
    (
      AppSettingsTableData,
      BaseReferences<_$AppDatabase, $AppSettingsTableTable,
          AppSettingsTableData>
    ),
    AppSettingsTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ScanRecordsTableTableManager get scanRecords =>
      $$ScanRecordsTableTableManager(_db, _db.scanRecords);
  $$AppSettingsTableTableTableManager get appSettingsTable =>
      $$AppSettingsTableTableTableManager(_db, _db.appSettingsTable);
}

// dart format width=80
// ignore_for_file: type=lint
import 'package:drift/drift.dart' as i0;
import 'package:immich_mobile/infrastructure/entities/remote_asset_metadata.entity.drift.dart'
    as i1;
import 'package:immich_mobile/domain/models/asset/asset_metadata.model.dart'
    as i2;
import 'dart:typed_data' as i3;
import 'package:immich_mobile/infrastructure/entities/remote_asset_metadata.entity.dart'
    as i4;
import 'package:drift/extensions/json1.dart' as i5;
import 'package:immich_mobile/infrastructure/entities/remote_asset.entity.drift.dart'
    as i6;
import 'package:drift/internal/modular.dart' as i7;

typedef $$RemoteAssetMetadataEntityTableCreateCompanionBuilder =
    i1.RemoteAssetMetadataEntityCompanion Function({
      required String assetId,
      required i2.RemoteAssetMetadataKey key,
      required Map<String, Object?> value,
    });
typedef $$RemoteAssetMetadataEntityTableUpdateCompanionBuilder =
    i1.RemoteAssetMetadataEntityCompanion Function({
      i0.Value<String> assetId,
      i0.Value<i2.RemoteAssetMetadataKey> key,
      i0.Value<Map<String, Object?>> value,
    });

final class $$RemoteAssetMetadataEntityTableReferences
    extends
        i0.BaseReferences<
          i0.GeneratedDatabase,
          i1.$RemoteAssetMetadataEntityTable,
          i1.RemoteAssetMetadataEntityData
        > {
  $$RemoteAssetMetadataEntityTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static i6.$RemoteAssetEntityTable _assetIdTable(i0.GeneratedDatabase db) =>
      i7.ReadDatabaseContainer(db)
          .resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity')
          .createAlias(
            i0.$_aliasNameGenerator(
              i7.ReadDatabaseContainer(db)
                  .resultSet<i1.$RemoteAssetMetadataEntityTable>(
                    'remote_asset_metadata_entity',
                  )
                  .assetId,
              i7.ReadDatabaseContainer(
                db,
              ).resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity').id,
            ),
          );

  i6.$$RemoteAssetEntityTableProcessedTableManager get assetId {
    final $_column = $_itemColumn<String>('asset_id')!;

    final manager = i6
        .$$RemoteAssetEntityTableTableManager(
          $_db,
          i7.ReadDatabaseContainer(
            $_db,
          ).resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity'),
        )
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_assetIdTable($_db));
    if (item == null) return manager;
    return i0.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RemoteAssetMetadataEntityTableFilterComposer
    extends
        i0.Composer<i0.GeneratedDatabase, i1.$RemoteAssetMetadataEntityTable> {
  $$RemoteAssetMetadataEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnWithTypeConverterFilters<
    i2.RemoteAssetMetadataKey,
    i2.RemoteAssetMetadataKey,
    String
  >
  get key => $composableBuilder(
    column: $table.key,
    builder: (column) => i0.ColumnWithTypeConverterFilters(column),
  );

  i0.ColumnFilters<String> get cloudId => $composableBuilder(
    column: $table.cloudId,
    builder: (column) => i0.ColumnFilters(column),
  );

  i0.ColumnWithTypeConverterFilters<
    Map<String, Object?>,
    Map<String, Object>,
    i3.Uint8List
  >
  get value => $composableBuilder(
    column: $table.value,
    builder: (column) => i0.ColumnWithTypeConverterFilters(column),
  );

  i6.$$RemoteAssetEntityTableFilterComposer get assetId {
    final i6.$$RemoteAssetEntityTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.assetId,
      referencedTable: i7.ReadDatabaseContainer(
        $db,
      ).resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity'),
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => i6.$$RemoteAssetEntityTableFilterComposer(
            $db: $db,
            $table: i7.ReadDatabaseContainer(
              $db,
            ).resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity'),
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RemoteAssetMetadataEntityTableOrderingComposer
    extends
        i0.Composer<i0.GeneratedDatabase, i1.$RemoteAssetMetadataEntityTable> {
  $$RemoteAssetMetadataEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<String> get cloudId => $composableBuilder(
    column: $table.cloudId,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i0.ColumnOrderings<i3.Uint8List> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => i0.ColumnOrderings(column),
  );

  i6.$$RemoteAssetEntityTableOrderingComposer get assetId {
    final i6.$$RemoteAssetEntityTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.assetId,
          referencedTable: i7.ReadDatabaseContainer(
            $db,
          ).resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity'),
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => i6.$$RemoteAssetEntityTableOrderingComposer(
                $db: $db,
                $table: i7.ReadDatabaseContainer(
                  $db,
                ).resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity'),
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$RemoteAssetMetadataEntityTableAnnotationComposer
    extends
        i0.Composer<i0.GeneratedDatabase, i1.$RemoteAssetMetadataEntityTable> {
  $$RemoteAssetMetadataEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  i0.GeneratedColumnWithTypeConverter<i2.RemoteAssetMetadataKey, String>
  get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  i0.GeneratedColumn<String> get cloudId =>
      $composableBuilder(column: $table.cloudId, builder: (column) => column);

  i0.GeneratedColumnWithTypeConverter<Map<String, Object?>, i3.Uint8List>
  get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  i6.$$RemoteAssetEntityTableAnnotationComposer get assetId {
    final i6.$$RemoteAssetEntityTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.assetId,
          referencedTable: i7.ReadDatabaseContainer(
            $db,
          ).resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity'),
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => i6.$$RemoteAssetEntityTableAnnotationComposer(
                $db: $db,
                $table: i7.ReadDatabaseContainer(
                  $db,
                ).resultSet<i6.$RemoteAssetEntityTable>('remote_asset_entity'),
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$RemoteAssetMetadataEntityTableTableManager
    extends
        i0.RootTableManager<
          i0.GeneratedDatabase,
          i1.$RemoteAssetMetadataEntityTable,
          i1.RemoteAssetMetadataEntityData,
          i1.$$RemoteAssetMetadataEntityTableFilterComposer,
          i1.$$RemoteAssetMetadataEntityTableOrderingComposer,
          i1.$$RemoteAssetMetadataEntityTableAnnotationComposer,
          $$RemoteAssetMetadataEntityTableCreateCompanionBuilder,
          $$RemoteAssetMetadataEntityTableUpdateCompanionBuilder,
          (
            i1.RemoteAssetMetadataEntityData,
            i1.$$RemoteAssetMetadataEntityTableReferences,
          ),
          i1.RemoteAssetMetadataEntityData,
          i0.PrefetchHooks Function({bool assetId})
        > {
  $$RemoteAssetMetadataEntityTableTableManager(
    i0.GeneratedDatabase db,
    i1.$RemoteAssetMetadataEntityTable table,
  ) : super(
        i0.TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              i1.$$RemoteAssetMetadataEntityTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              i1.$$RemoteAssetMetadataEntityTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              i1.$$RemoteAssetMetadataEntityTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                i0.Value<String> assetId = const i0.Value.absent(),
                i0.Value<i2.RemoteAssetMetadataKey> key =
                    const i0.Value.absent(),
                i0.Value<Map<String, Object?>> value = const i0.Value.absent(),
              }) => i1.RemoteAssetMetadataEntityCompanion(
                assetId: assetId,
                key: key,
                value: value,
              ),
          createCompanionCallback:
              ({
                required String assetId,
                required i2.RemoteAssetMetadataKey key,
                required Map<String, Object?> value,
              }) => i1.RemoteAssetMetadataEntityCompanion.insert(
                assetId: assetId,
                key: key,
                value: value,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  i1.$$RemoteAssetMetadataEntityTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({assetId = false}) {
            return i0.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends i0.TableManagerState<
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
                    if (assetId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.assetId,
                                referencedTable: i1
                                    .$$RemoteAssetMetadataEntityTableReferences
                                    ._assetIdTable(db),
                                referencedColumn: i1
                                    .$$RemoteAssetMetadataEntityTableReferences
                                    ._assetIdTable(db)
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

typedef $$RemoteAssetMetadataEntityTableProcessedTableManager =
    i0.ProcessedTableManager<
      i0.GeneratedDatabase,
      i1.$RemoteAssetMetadataEntityTable,
      i1.RemoteAssetMetadataEntityData,
      i1.$$RemoteAssetMetadataEntityTableFilterComposer,
      i1.$$RemoteAssetMetadataEntityTableOrderingComposer,
      i1.$$RemoteAssetMetadataEntityTableAnnotationComposer,
      $$RemoteAssetMetadataEntityTableCreateCompanionBuilder,
      $$RemoteAssetMetadataEntityTableUpdateCompanionBuilder,
      (
        i1.RemoteAssetMetadataEntityData,
        i1.$$RemoteAssetMetadataEntityTableReferences,
      ),
      i1.RemoteAssetMetadataEntityData,
      i0.PrefetchHooks Function({bool assetId})
    >;
i0.Index get uQRemoteAssetMetadataCloudId => i0.Index(
  'UQ_remote_asset_metadata_cloud_id',
  'CREATE UNIQUE INDEX IF NOT EXISTS UQ_remote_asset_metadata_cloud_id ON remote_asset_metadata_entity (cloud_id) WHERE("key" = \'mobile-app\')',
);

class $RemoteAssetMetadataEntityTable extends i4.RemoteAssetMetadataEntity
    with
        i0.TableInfo<
          $RemoteAssetMetadataEntityTable,
          i1.RemoteAssetMetadataEntityData
        > {
  @override
  final i0.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RemoteAssetMetadataEntityTable(this.attachedDatabase, [this._alias]);
  static const i0.VerificationMeta _assetIdMeta = const i0.VerificationMeta(
    'assetId',
  );
  @override
  late final i0.GeneratedColumn<String> assetId = i0.GeneratedColumn<String>(
    'asset_id',
    aliasedName,
    false,
    type: i0.DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: i0.GeneratedColumn.constraintIsAlways(
      'REFERENCES remote_asset_entity (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final i0.GeneratedColumnWithTypeConverter<
    i2.RemoteAssetMetadataKey,
    String
  >
  key =
      i0.GeneratedColumn<String>(
        'key',
        aliasedName,
        false,
        type: i0.DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<i2.RemoteAssetMetadataKey>(
        i1.$RemoteAssetMetadataEntityTable.$converterkey,
      );
  static const i0.VerificationMeta _cloudIdMeta = const i0.VerificationMeta(
    'cloudId',
  );
  @override
  late final i0.GeneratedColumn<String> cloudId = i0.GeneratedColumn<String>(
    'cloud_id',
    aliasedName,
    false,
    generatedAs: i0.GeneratedAs(
      i5.JsonExtensions(key).jsonExtract(r'$.iCloudId'),
      false,
    ),
    type: i0.DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final i0.GeneratedColumnWithTypeConverter<
    Map<String, Object?>,
    i3.Uint8List
  >
  value =
      i0.GeneratedColumn<i3.Uint8List>(
        'value',
        aliasedName,
        false,
        type: i0.DriftSqlType.blob,
        requiredDuringInsert: true,
      ).withConverter<Map<String, Object?>>(
        i1.$RemoteAssetMetadataEntityTable.$convertervalue,
      );
  @override
  List<i0.GeneratedColumn> get $columns => [assetId, key, cloudId, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'remote_asset_metadata_entity';
  @override
  i0.VerificationContext validateIntegrity(
    i0.Insertable<i1.RemoteAssetMetadataEntityData> instance, {
    bool isInserting = false,
  }) {
    final context = i0.VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('asset_id')) {
      context.handle(
        _assetIdMeta,
        assetId.isAcceptableOrUnknown(data['asset_id']!, _assetIdMeta),
      );
    } else if (isInserting) {
      context.missing(_assetIdMeta);
    }
    if (data.containsKey('cloud_id')) {
      context.handle(
        _cloudIdMeta,
        cloudId.isAcceptableOrUnknown(data['cloud_id']!, _cloudIdMeta),
      );
    }
    return context;
  }

  @override
  Set<i0.GeneratedColumn> get $primaryKey => {assetId, key};
  @override
  i1.RemoteAssetMetadataEntityData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return i1.RemoteAssetMetadataEntityData(
      assetId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}asset_id'],
      )!,
      key: i1.$RemoteAssetMetadataEntityTable.$converterkey.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.string,
          data['${effectivePrefix}key'],
        )!,
      ),
      cloudId: attachedDatabase.typeMapping.read(
        i0.DriftSqlType.string,
        data['${effectivePrefix}cloud_id'],
      )!,
      value: i1.$RemoteAssetMetadataEntityTable.$convertervalue.fromSql(
        attachedDatabase.typeMapping.read(
          i0.DriftSqlType.blob,
          data['${effectivePrefix}value'],
        )!,
      ),
    );
  }

  @override
  $RemoteAssetMetadataEntityTable createAlias(String alias) {
    return $RemoteAssetMetadataEntityTable(attachedDatabase, alias);
  }

  static i0.TypeConverter<i2.RemoteAssetMetadataKey, String> $converterkey =
      const i4.RemoteAssetMetadataKeyConverter();
  static i0.JsonTypeConverter2<Map<String, Object?>, i3.Uint8List, Object?>
  $convertervalue = i4.assetMetadataConverter;
  @override
  bool get withoutRowId => true;
  @override
  bool get isStrict => true;
}

class RemoteAssetMetadataEntityData extends i0.DataClass
    implements i0.Insertable<i1.RemoteAssetMetadataEntityData> {
  final String assetId;
  final i2.RemoteAssetMetadataKey key;
  final String cloudId;
  final Map<String, Object?> value;
  const RemoteAssetMetadataEntityData({
    required this.assetId,
    required this.key,
    required this.cloudId,
    required this.value,
  });
  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    map['asset_id'] = i0.Variable<String>(assetId);
    {
      map['key'] = i0.Variable<String>(
        i1.$RemoteAssetMetadataEntityTable.$converterkey.toSql(key),
      );
    }
    {
      map['value'] = i0.Variable<i3.Uint8List>(
        i1.$RemoteAssetMetadataEntityTable.$convertervalue.toSql(value),
      );
    }
    return map;
  }

  factory RemoteAssetMetadataEntityData.fromJson(
    Map<String, dynamic> json, {
    i0.ValueSerializer? serializer,
  }) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return RemoteAssetMetadataEntityData(
      assetId: serializer.fromJson<String>(json['assetId']),
      key: serializer.fromJson<i2.RemoteAssetMetadataKey>(json['key']),
      cloudId: serializer.fromJson<String>(json['cloudId']),
      value: i1.$RemoteAssetMetadataEntityTable.$convertervalue.fromJson(
        serializer.fromJson<Object?>(json['value']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({i0.ValueSerializer? serializer}) {
    serializer ??= i0.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'assetId': serializer.toJson<String>(assetId),
      'key': serializer.toJson<i2.RemoteAssetMetadataKey>(key),
      'cloudId': serializer.toJson<String>(cloudId),
      'value': serializer.toJson<Object?>(
        i1.$RemoteAssetMetadataEntityTable.$convertervalue.toJson(value),
      ),
    };
  }

  i1.RemoteAssetMetadataEntityData copyWith({
    String? assetId,
    i2.RemoteAssetMetadataKey? key,
    String? cloudId,
    Map<String, Object?>? value,
  }) => i1.RemoteAssetMetadataEntityData(
    assetId: assetId ?? this.assetId,
    key: key ?? this.key,
    cloudId: cloudId ?? this.cloudId,
    value: value ?? this.value,
  );
  @override
  String toString() {
    return (StringBuffer('RemoteAssetMetadataEntityData(')
          ..write('assetId: $assetId, ')
          ..write('key: $key, ')
          ..write('cloudId: $cloudId, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(assetId, key, cloudId, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is i1.RemoteAssetMetadataEntityData &&
          other.assetId == this.assetId &&
          other.key == this.key &&
          other.cloudId == this.cloudId &&
          other.value == this.value);
}

class RemoteAssetMetadataEntityCompanion
    extends i0.UpdateCompanion<i1.RemoteAssetMetadataEntityData> {
  final i0.Value<String> assetId;
  final i0.Value<i2.RemoteAssetMetadataKey> key;
  final i0.Value<Map<String, Object?>> value;
  const RemoteAssetMetadataEntityCompanion({
    this.assetId = const i0.Value.absent(),
    this.key = const i0.Value.absent(),
    this.value = const i0.Value.absent(),
  });
  RemoteAssetMetadataEntityCompanion.insert({
    required String assetId,
    required i2.RemoteAssetMetadataKey key,
    required Map<String, Object?> value,
  }) : assetId = i0.Value(assetId),
       key = i0.Value(key),
       value = i0.Value(value);
  static i0.Insertable<i1.RemoteAssetMetadataEntityData> custom({
    i0.Expression<String>? assetId,
    i0.Expression<String>? key,
    i0.Expression<i3.Uint8List>? value,
  }) {
    return i0.RawValuesInsertable({
      if (assetId != null) 'asset_id': assetId,
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    });
  }

  i1.RemoteAssetMetadataEntityCompanion copyWith({
    i0.Value<String>? assetId,
    i0.Value<i2.RemoteAssetMetadataKey>? key,
    i0.Value<Map<String, Object?>>? value,
  }) {
    return i1.RemoteAssetMetadataEntityCompanion(
      assetId: assetId ?? this.assetId,
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  @override
  Map<String, i0.Expression> toColumns(bool nullToAbsent) {
    final map = <String, i0.Expression>{};
    if (assetId.present) {
      map['asset_id'] = i0.Variable<String>(assetId.value);
    }
    if (key.present) {
      map['key'] = i0.Variable<String>(
        i1.$RemoteAssetMetadataEntityTable.$converterkey.toSql(key.value),
      );
    }
    if (value.present) {
      map['value'] = i0.Variable<i3.Uint8List>(
        i1.$RemoteAssetMetadataEntityTable.$convertervalue.toSql(value.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RemoteAssetMetadataEntityCompanion(')
          ..write('assetId: $assetId, ')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }
}

import 'dart:async';

import 'package:deka_appps_ios/models/entities/pengaturan_autocode_android/pengaturan_autocode_android.dart';
import 'package:deka_appps_ios/models/entities/pengaturan_autocode_android/pengaturan_autocode_android_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class PengaturanAutocodeAndroidDaoImpl extends PengaturanAutocodeAndroidDao {
  PengaturanAutocodeAndroidDaoImpl(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _insertionAdapter = InsertionAdapter(
            database,
            'pengaturan_autocode_android',
                (PengaturanAutocodeAndroidEntity item) => <String, Object?>{
              'code' : item.code,
              'value' : item.value,
              'count' : item.count,
              'status': item.status,
              'statusKirim': item.statusKirim,
              'createdAt': item.createdAt,
              'updatedAt': item.updatedAt,
            }),
        _updateAdapter = UpdateAdapter(
            database,
            'pengaturan_autocode_android',
            ['code'],
                (PengaturanAutocodeAndroidEntity item) => <String, Object?>{
              'code' : item.code,
              'value' : item.value,
              'count' : item.count,
              'status': item.status,
              'statusKirim': item.statusKirim,
              'createdAt': item.createdAt,
              'updatedAt': item.updatedAt,
            }),
        _deletionAdapter = DeletionAdapter(
            database,
            'pengaturan_autocode_android',
            ['code'],
                (PengaturanAutocodeAndroidEntity item) => <String, Object?>{
              'code' : item.code,
              'value' : item.value,
              'count' : item.count,
              'status': item.status,
              'statusKirim': item.statusKirim,
              'createdAt': item.createdAt,
              'updatedAt': item.updatedAt,
            });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PengaturanAutocodeAndroidEntity> _insertionAdapter;

  final UpdateAdapter<PengaturanAutocodeAndroidEntity> _updateAdapter;

  final DeletionAdapter<PengaturanAutocodeAndroidEntity> _deletionAdapter;

  @override
  Future<void> insertEntity(PengaturanAutocodeAndroidEntity model) async {
    await _insertionAdapter.insert(model, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateEntity(PengaturanAutocodeAndroidEntity model) async {
    await _updateAdapter.update(model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteEntity(PengaturanAutocodeAndroidEntity model) async {
    await _deletionAdapter.delete(model);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM pengaturan_autocode_android');
  }

  @override
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroid() {
    return _queryAdapter.queryList('SELECT * FROM pengaturan_autocode_android',
        mapper: (Map<String, Object?> row) => _mapper(row)
    );
  }

  @override
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroidByCode(String code) {
    return _queryAdapter.queryList('SELECT * FROM pengaturan_autocode_android WHERE code LIKE :code',
        mapper: (Map<String, Object?> row) => _mapper(row)
    );
  }

  @override
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroidOne(String code) {
    return _queryAdapter.queryList('SELECT * FROM pengaturan_autocode_android WHERE code = :code',
        mapper: (Map<String, Object?> row) => _mapper(row)
    );
  }

  PengaturanAutocodeAndroidEntity _mapper(Map<String, Object?> row) {
    return PengaturanAutocodeAndroidEntity(
      code: row['code'] as String?,
      value: row['value'] as String?,
      count: row['count'] as String?,
      status: row['status'] as int?,
      statusKirim: row['statusKirim'] as int?,
      createdAt: row['createdAt'] as String?,
      updatedAt: row['updatedAt'] as String?,
    );
  }
}
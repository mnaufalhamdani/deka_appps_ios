import 'dart:async';

import 'package:deka_appps_ios/models/entities/pengaturan_autocode_android/pengaturan_autocode_android.dart';
import 'package:deka_appps_ios/models/entities/pengaturan_autocode_android/pengaturan_autocode_android_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

class PengaturanAutocodeAndroidDaoImpl extends PengaturanAutocodeAndroidDao {
  PengaturanAutocodeAndroidDaoImpl(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _pengaturanAutocodeAndroidInsertionAdapter = InsertionAdapter(
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
        _pengaturanAutocodeAndroidDeletionAdapter = DeletionAdapter(
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

  final InsertionAdapter<PengaturanAutocodeAndroidEntity> _pengaturanAutocodeAndroidInsertionAdapter;

  final DeletionAdapter<PengaturanAutocodeAndroidEntity> _pengaturanAutocodeAndroidDeletionAdapter;

  @override
  Future<void> insertPengaturanAutocodeAndroid(PengaturanAutocodeAndroidEntity model) async {
    await _pengaturanAutocodeAndroidInsertionAdapter.insert(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePengaturanAutocodeAndroid(PengaturanAutocodeAndroidEntity model) async {
    await _pengaturanAutocodeAndroidDeletionAdapter.delete(model);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM profile');
  }

  @override
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroid() {
    return _queryAdapter.queryList('SELECT * FROM pengaturan_autocode_android',
        mapper: (Map<String, Object?> row) => _pengaturanAutocodeAndroidMapper(row)
    );
  }

  @override
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroidByCode(String code) {
    return _queryAdapter.queryList('SELECT * FROM pengaturan_autocode_android WHERE code LIKE :code',
        mapper: (Map<String, Object?> row) => _pengaturanAutocodeAndroidMapper(row)
    );
  }

  @override
  Future<List<PengaturanAutocodeAndroidEntity>> getPengaturanAutocodeAndroidOne(String code) {
    return _queryAdapter.queryList('SELECT * FROM pengaturan_autocode_android WHERE code = :code',
        mapper: (Map<String, Object?> row) => _pengaturanAutocodeAndroidMapper(row)
    );
  }

  PengaturanAutocodeAndroidEntity _pengaturanAutocodeAndroidMapper(Map<String, Object?> row) {
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
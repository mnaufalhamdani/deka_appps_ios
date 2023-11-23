import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'master_reason.dart';
import 'master_reason_dao.dart';

class MasterReasonDaoImpl extends MasterReasonDao {
  MasterReasonDaoImpl(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _insertionAdapter = InsertionAdapter(
            database,
            'master_reason',
                (MasterReasonEntity item) => <String, Object?>{
              'code' : item.code,
              'name' : item.name,
              'type' : item.type,
              'keterangan' : item.keterangan,
              'potong_cuti' : item.potong_cuti,
              'status': item.status,
              'statusKirim': item.statusKirim,
              'createdAt': item.createdAt,
              'updatedAt': item.updatedAt,
            }),
        _updateAdapter = UpdateAdapter(
            database,
            'master_reason',
            ['code'],
                (MasterReasonEntity item) => <String, Object?>{
              'code' : item.code,
              'name' : item.name,
              'type' : item.type,
              'keterangan' : item.keterangan,
              'potong_cuti' : item.potong_cuti,
              'status': item.status,
              'statusKirim': item.statusKirim,
              'createdAt': item.createdAt,
              'updatedAt': item.updatedAt,
            }),
        _deletionAdapter = DeletionAdapter(
            database,
            'master_reason',
            ['code'],
                (MasterReasonEntity item) => <String, Object?>{
              'code' : item.code,
              'name' : item.name,
              'type' : item.type,
              'keterangan' : item.keterangan,
              'potong_cuti' : item.potong_cuti,
              'status': item.status,
              'statusKirim': item.statusKirim,
              'createdAt': item.createdAt,
              'updatedAt': item.updatedAt,
            });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MasterReasonEntity> _insertionAdapter;

  final UpdateAdapter<MasterReasonEntity> _updateAdapter;

  final DeletionAdapter<MasterReasonEntity> _deletionAdapter;

  @override
  Future<void> insertEntity(MasterReasonEntity model) async {
    await _insertionAdapter.insert(model, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateEntity(MasterReasonEntity model) async {
    await _insertionAdapter.insert(model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteEntity(MasterReasonEntity model) async {
    await _deletionAdapter.delete(model);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM master_reason');
  }

  @override
  Future<List<MasterReasonEntity>> getMasterReason() {
    return _queryAdapter.queryList('SELECT * FROM master_reason WHERE status = 1 ORDER BY name ASC',
        mapper: (Map<String, Object?> row) => _mapper(row)
    );
  }

  @override
  Future<List<MasterReasonEntity>> getMasterReasonByType(int type) {
    return _queryAdapter.queryList('SELECT * FROM master_reason WHERE status = 1 AND type = :type ORDER BY name ASC',
        mapper: (Map<String, Object?> row) => _mapper(row)
    );
  }

  @override
  Future<List<MasterReasonEntity>> getMasterReasonOne(String code) {
    return _queryAdapter.queryList('SELECT * FROM master_reason WHERE status = 1 AND code = :code ORDER BY name ASC',
        mapper: (Map<String, Object?> row) => _mapper(row)
    );
  }

  MasterReasonEntity _mapper(Map<String, Object?> row) {
    return MasterReasonEntity(
      code: row['code'] as String?,
      name: row['name'] as String?,
      type: row['type'] as int?,
      keterangan: row['keterangan'] as String?,
      potong_cuti: row['potong_cuti'] as String?,
      status: row['status'] as int?,
      statusKirim: row['statusKirim'] as int?,
      createdAt: row['createdAt'] as String?,
      updatedAt: row['updatedAt'] as String?,
    );
  }
}
import 'dart:convert';

import 'package:deka_appps_ios/extensions/constants.dart';
import 'package:deka_appps_ios/models/response/sync_data_master_model.dart';
import 'package:intl/intl.dart';

import '../config/database_config.dart';
import '../config/service/other/sync_data_master_service.dart';
import '../core/data/data_state.dart';
import '../models/entities/profile/profile.dart';
import '../models/mapper/profile_mapper.dart';
import '../models/response/error_model.dart';
import '../models/response/login_model.dart';

abstract class SyncDataMasterRepository {
  Future<DataState<ProfileEntity>> getProfile();

  Future<void> deleteProfileAll();

  Future<void> insertProfile(LoginModel model);

  Future<DataState<SyncDataMasterModel>> syncDataMaster();

  Future<DataState<SyncDataMasterModel>> updateMasterReasonType(SyncDataMasterModel model);
}

class SyncDataMasterRepositoryImpl extends SyncDataMasterRepository {
  final SyncDataMasterService _syncDataMasterService;
  final DatabaseConfig _databaseConfig;

  SyncDataMasterRepositoryImpl(this._syncDataMasterService, this._databaseConfig);

  @override
  Future<DataState<ProfileEntity>> getProfile() async {
    final models = await _databaseConfig.profileDao.getProfile();
    if(models.isEmpty) throw DataFailed(ErrorModel());

    return DataSuccess(models.first);
  }

  @override
  Future<void> insertProfile(LoginModel model) {
    final profileMapper = ProfileMapper(model);
    return _databaseConfig.profileDao.insertProfile(profileMapper);
  }

  @override
  Future<void> deleteProfileAll() {
    return _databaseConfig.profileDao.deleteAll();
  }

  @override
  Future<DataState<SyncDataMasterModel>> syncDataMaster() async {
    try {
      final profile = await getProfile();
      for (var item in listPengaturanAutocode){
        final pengaturanAutocode = await _databaseConfig.pengaturanAutocodeAndroidDao.getPengaturanAutocodeAndroidOne(item.code!);
        if(pengaturanAutocode.isEmpty){
          _databaseConfig.pengaturanAutocodeAndroidDao.insertPengaturanAutocodeAndroid(item);
        }
      }

      final slugPengaturanAutocodes = await _databaseConfig.pengaturanAutocodeAndroidDao.getPengaturanAutocodeAndroid();

      final httpResponse = await _syncDataMasterService.syncDataMaster(
          user_id: profile.data!.userId,
          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          slug_database: jsonEncode(slugPengaturanAutocodes)
      );

      return DataSuccess(httpResponse.data);
    } on ErrorModel catch (e) {
      throw DataFailed(e);
    }
  }

  @override
  Future<DataState<SyncDataMasterModel>> updateMasterReasonType(SyncDataMasterModel model) async {
    return DataSuccess(model);
  }
}
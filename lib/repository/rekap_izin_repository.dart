// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:deka_appps_ios/config/service/rekap_izin/rekap_izin_service.dart';
import 'package:deka_appps_ios/models/domain/save_rekap_izin_domain.dart';
import 'package:deka_appps_ios/models/response/error_model.dart';
import 'package:deka_appps_ios/models/response/rekap_izin_model.dart';
import 'package:deka_appps_ios/models/response/view_cuti_model.dart';

import '../config/database_config.dart';
import '../core/data/data_state.dart';
import '../models/entities/profile/profile.dart';

//domain - repository
abstract class RekapIzinRepository {
  Future<DataState<ProfileEntity>> getProfile();

  Future<DataState<ViewCutiModel>> getViewCuti();

  Future<DataState<List<RekapIzinModel>>> getRekapIzin();

  Future<DataState<String>> saveRekapIzin(SaveRekapIzinDomain domain);
}

//data - repository
class RekapIzinRepositoryImpl extends RekapIzinRepository {
  final RekapIzinService _rekapIzinService;
  final DatabaseConfig _databaseConfig;

  RekapIzinRepositoryImpl(this._rekapIzinService, this._databaseConfig);

  @override
  Future<DataState<ProfileEntity>> getProfile() async {
    final models = await _databaseConfig.profileDao.getProfile();
    if(models.isEmpty) throw DataFailed(ErrorModel());

    return DataSuccess(models.first);
  }

  @override
  Future<DataState<ViewCutiModel>> getViewCuti() async {
    try {
      final profile = await getProfile();
      final httpResponse = await _rekapIzinService.getViewCuti(nik: profile.data?.nik);

      final totalWaiting =
          int.tryParse(httpResponse.data.totalWaiting ?? "0") ?? 0;
      final totalApproved =
          int.tryParse(httpResponse.data.totalApproved ?? "0") ?? 0;
      final totalRejected =
          int.tryParse(httpResponse.data.totalReject ?? "0") ?? 0;
      final totalIzin = totalWaiting + totalApproved + totalRejected;
      httpResponse.data.totalIzin = totalIzin.toString();

      return DataSuccess(httpResponse.data);
    } on ErrorModel catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<RekapIzinModel>>> getRekapIzin() async {
    try {
      final profile = await getProfile();
      final httpResponse = await _rekapIzinService.getRekapIzin(nik: profile.data?.nik);
      return DataSuccess(httpResponse.data);
    } on ErrorModel catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<String>> saveRekapIzin(SaveRekapIzinDomain domain) async {
    try {
      domain.latitude = "37.4219983";
      domain.longitude = "-122.084";

      final data = jsonEncode(domain);
      print(data.toString());
      final httpResponse = await _rekapIzinService.saveRekapIzin(data: data.toString());

      return DataSuccess(httpResponse.data.message!);
    } on ErrorModel catch (e) {
      return DataFailed(e);
    }
  }
}

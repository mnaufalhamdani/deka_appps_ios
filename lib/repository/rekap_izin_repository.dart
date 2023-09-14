import 'package:deka_appps_ios/config/service/rekap_izin/rekap_izin_service.dart';
import 'package:deka_appps_ios/models/response/error_model.dart';
import 'package:deka_appps_ios/models/response/rekap_izin_model.dart';
import 'package:deka_appps_ios/models/response/view_cuti_model.dart';

import '../core/data/data_state.dart';

//domain - repository
abstract class RekapIzinRepository {
  Future<DataState<List<RekapIzinModel>>> getRekapIzin(String nik);

  Future<DataState<ViewCutiModel>> getViewCuti(String nik);
}

//data - repository
class RekapIzinRepositoryImpl extends RekapIzinRepository {
  final RekapIzinService _rekapIzinService;

  RekapIzinRepositoryImpl(this._rekapIzinService);

  @override
  Future<DataState<List<RekapIzinModel>>> getRekapIzin(String nik) async {
    try {
      final httpResponse = await _rekapIzinService.getRekapIzin(nik: nik);
      return DataSuccess(httpResponse.data);
    } on ErrorModel catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<ViewCutiModel>> getViewCuti(String nik) async {
    try {
      final httpResponse = await Future.wait([
        _rekapIzinService.getViewCuti(nik: nik),
      ]);

      final getViewCuti = httpResponse[0].data;

      final totalWaiting =
          int.tryParse(getViewCuti.totalWaiting ?? "0") ?? 0;
      final totalApproved =
          int.tryParse(getViewCuti.totalApproved ?? "0") ?? 0;
      final totalRejected =
          int.tryParse(getViewCuti.totalReject ?? "0") ?? 0;
      final totalIzin = totalWaiting + totalApproved + totalRejected;
      getViewCuti.totalIzin = totalIzin.toString();

      return DataSuccess(getViewCuti);
    } on ErrorModel catch (e) {
      return DataFailed(e);
    }
  }
}

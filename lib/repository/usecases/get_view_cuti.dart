import 'package:deka_appps_ios/models/response/view_cuti_model.dart';

import '../../core/data/data_state.dart';
import '../rekap_izin_repository.dart';

abstract class GetViewCutiUseCaseImpl<Type, Params> {
  Future<Type> getViewCuti({Params nik});
}

class GetViewCutiUseCase implements GetViewCutiUseCaseImpl<DataState<ViewCutiModel>, String> {
  final RekapIzinRepository _repository;
  GetViewCutiUseCase(this._repository);

  @override
  Future<DataState<ViewCutiModel>> getViewCuti({String ? nik}) {
    return _repository.getViewCuti(nik!);
  }
}

import 'package:deka_appps_ios/models/response/general_model.dart';
import 'package:deka_appps_ios/repository/login_repository.dart';

import '../../core/data/data_state.dart';

abstract class GetResetUseCaseImpl<Type, Params> {
  Future<Type> getReset({Params nik});
}

class GetResetUseCase implements GetResetUseCaseImpl<DataState<GeneralModel>, String> {
  final LoginRepository _repository;
  GetResetUseCase(this._repository);

  @override
  Future<DataState<GeneralModel>> getReset({String? nik}) {
    return _repository.getReset(nik!);
  }
}
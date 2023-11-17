
import 'package:deka_appps_ios/models/domain/register_domain.dart';
import 'package:deka_appps_ios/models/response/general_model.dart';
import 'package:deka_appps_ios/repository/login_repository.dart';

import '../../core/data/data_state.dart';

abstract class SaveRegisterUseCaseImpl<Type, Params> {
  Future<Type> register({Params domain});
}

class SaveRegisterUseCase implements SaveRegisterUseCaseImpl<DataState<GeneralModel>, RegisterDomain> {
  final LoginRepository _repository;
  SaveRegisterUseCase(this._repository);

  @override
  Future<DataState<GeneralModel>> register({RegisterDomain? domain}) {
    return _repository.register(domain!);
  }
}
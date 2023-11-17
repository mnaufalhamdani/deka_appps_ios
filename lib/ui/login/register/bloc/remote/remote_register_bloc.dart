import 'package:deka_appps_ios/models/response/general_model.dart';
import 'package:deka_appps_ios/repository/usecases/save_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/bloc_state.dart';
import '../../../../../core/data/data_state.dart';
import '../../../../../models/domain/register_domain.dart';

//Bloc
class RemoteRegisterBloc extends Bloc<RemoteRegisterEvent, BaseBlocState>{
  final SaveRegisterUseCase useCase;

  RemoteRegisterBloc(this.useCase) : super(BaseResponseDefault()){
    on <GetRegister> (onLoad);
  }

  void onLoad(GetRegister event, Emitter < BaseBlocState > emit) async {
    emit(BaseResponseLoading());
    final dataState = await useCase.register(domain: event.domain);

    if (dataState is DataSuccess) {
      emit(RegisterResponseDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(BaseResponseError(dataState.error!));
    }
  }
}

//Event
abstract class RemoteRegisterEvent {
  final RegisterDomain ? domain;
  const RemoteRegisterEvent({this.domain});
}

class OnLoadRegister extends RemoteRegisterEvent {
  OnLoadRegister() : super();
}

class GetRegister extends RemoteRegisterEvent {
  GetRegister(RegisterDomain domain) : super(domain: domain);
}

//State
class RegisterResponseDone extends BaseBlocState {
  final GeneralModel model;

  RegisterResponseDone(this.model);
}
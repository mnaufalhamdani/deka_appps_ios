import 'package:deka_appps_ios/models/response/error_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/data/data_state.dart';
import '../../../../../repository/usecases/get_rekap_izin.dart';
import '../../../../models/response/rekap_izin_model.dart';

//Bloc
class RemoteRekapIzinBloc extends Bloc<RemoteRekapIzinEvent, RemoteRekapIzinState>{
  final GetRekapIzinUseCase useCase;

  RemoteRekapIzinBloc(this.useCase) : super(const RemoteRekapIzinLoading()){
    on <GetRekapIzin> (onRekapIzin);
  }

  void onRekapIzin(GetRekapIzin event, Emitter < RemoteRekapIzinState > emit) async {
    final dataState = await useCase.getRekapIzin(nik: event.nik);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteRekapIzinDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteRekapIzinError(dataState.error!));
    }
  }
}

//Event
abstract class RemoteRekapIzinEvent {
  final String ? nik;
  const RemoteRekapIzinEvent({this.nik});
}

class GetRekapIzin extends RemoteRekapIzinEvent {
  GetRekapIzin(String nik) : super(nik: nik);
}

//State
abstract class RemoteRekapIzinState extends Equatable {
  final List<RekapIzinModel> ? model;
  final ErrorModel ? error;

  const RemoteRekapIzinState({this.model, this.error});

  @override
  List<Object> get props => [model!, error!];
}

class RemoteRekapIzinLoading extends RemoteRekapIzinState {
  const RemoteRekapIzinLoading();
}

class RemoteRekapIzinDone extends RemoteRekapIzinState {
  const RemoteRekapIzinDone(List<RekapIzinModel> _model): super(model: _model);
}

class RemoteRekapIzinError extends RemoteRekapIzinState {
  const RemoteRekapIzinError(ErrorModel _error): super(error: _error);
}
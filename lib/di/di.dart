import 'package:deka_appps_ios/config/database_config.dart';
import 'package:deka_appps_ios/config/service/account/account_service.dart';
import 'package:deka_appps_ios/config/service/rekap_izin/rekap_izin_service.dart';
import 'package:deka_appps_ios/repository/login_repository.dart';
import 'package:deka_appps_ios/repository/usecases/get_check_nik.dart';
import 'package:deka_appps_ios/repository/usecases/get_login.dart';
import 'package:deka_appps_ios/repository/usecases/get_reset.dart';
import 'package:deka_appps_ios/repository/usecases/get_sync_data_master.dart';
import 'package:deka_appps_ios/repository/usecases/get_view_cuti.dart';
import 'package:deka_appps_ios/repository/usecases/save_register.dart';
import 'package:deka_appps_ios/repository/usecases/save_rekap_izin.dart';
import 'package:deka_appps_ios/ui/dashboard/bloc/local/local_profile_bloc.dart';
import 'package:deka_appps_ios/ui/dashboard/bloc/remote/remote_sync_data_master_bloc.dart';
import 'package:deka_appps_ios/ui/dashboard/bloc/remote/remote_view_cuti_bloc.dart';
import 'package:deka_appps_ios/ui/login/bloc/remote/remote_login_bloc.dart';
import 'package:deka_appps_ios/ui/login/register/bloc/remote/remote_check_nik_bloc.dart';
import 'package:deka_appps_ios/ui/login/register/bloc/remote/remote_register_bloc.dart';
import 'package:deka_appps_ios/ui/login/reset/bloc/remote/remote_reset_bloc.dart';
import 'package:deka_appps_ios/ui/rekap_izin/input/bloc/remote/remote_save_rekap_izin_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../config/service/other/sync_data_master_service.dart';
import '../repository/rekap_izin_repository.dart';
import '../repository/sync_data_master_repository.dart';
import '../repository/usecases/get_rekap_izin.dart';
import '../ui/rekap_izin/bloc/remote/remote_rekap_izin_bloc.dart';

final get = GetIt.instance;
Future<void> dependencyInjection() async {
  //region - Floor
  final database = await $FloorAppDatabase.databaseBuilder('deka_db.db').build();
  get.registerSingleton<DatabaseConfig>(database);
  //endregion

  //region - Dio
  get.registerSingleton<Dio>(Dio());
  //endregion

  //region - Service
  get.registerSingleton<RekapIzinService>(RekapIzinService(get()));
  get.registerSingleton<AccountService>(AccountService(get()));
  get.registerSingleton<SyncDataMasterService>(SyncDataMasterService(get()));
  //endregion

  //region - Repository
  get.registerSingleton<RekapIzinRepository>(RekapIzinRepositoryImpl(get(), get()));
  get.registerSingleton<LoginRepository>(LoginRepositoryImpl(get(), get()));
  get.registerSingleton<SyncDataMasterRepository>(SyncDataMasterRepositoryImpl(get(), get()));
  //endregion

  //region - UseCase
  get.registerSingleton<SyncDataMasterUseCase>(SyncDataMasterUseCase(get()));

  get.registerSingleton<GetRekapIzinUseCase>(GetRekapIzinUseCase(get()));
  get.registerSingleton<GetViewCutiUseCase>(GetViewCutiUseCase(get()));
  get.registerSingleton<GetLoginUseCase>(GetLoginUseCase(get()));
  get.registerSingleton<GetResetUseCase>(GetResetUseCase(get()));
  get.registerSingleton<GetCheckNikUseCase>(GetCheckNikUseCase(get()));

  get.registerSingleton<SaveRekapIzinUseCase>(SaveRekapIzinUseCase(get()));
  get.registerSingleton<SaveRegisterUseCase>(SaveRegisterUseCase(get()));
  //endregion

  //region - Bloc - REMOTE
  get.registerFactory<RemoteRekapIzinBloc>(()=> RemoteRekapIzinBloc(get()));
  get.registerFactory<RemoteViewCutiBloc>(()=> RemoteViewCutiBloc(get()));
  get.registerFactory<RemoteLoginBloc>(()=> RemoteLoginBloc(get(), get(), ));
  get.registerFactory<RemoteSyncDataMasterBloc>(() => RemoteSyncDataMasterBloc(get()));
  get.registerFactory<RemoteSaveRekapIzinBloc>(() => RemoteSaveRekapIzinBloc(get()));
  get.registerFactory<RemoteResetBloc>(() => RemoteResetBloc(get()));
  get.registerFactory<RemoteRegisterBloc>(() => RemoteRegisterBloc(get()));
  get.registerFactory<RemoteCheckNikBloc>(() => RemoteCheckNikBloc(get()));
  //endregion

  //region - Bloc - LOCAL
  get.registerFactory<LocalProfileBloc>(() => LocalProfileBloc(get()));
  //endregion
}

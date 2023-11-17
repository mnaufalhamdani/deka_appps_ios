import 'dart:io';

import 'package:deka_appps_ios/extensions/constants.dart';
import 'package:deka_appps_ios/models/response/employee_model.dart';
import 'package:deka_appps_ios/models/response/error_model.dart';
import 'package:deka_appps_ios/models/response/general_model.dart';
import 'package:deka_appps_ios/models/response/login_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'account_service_impl.dart';

@RestApi(baseUrl: BASE_URL)
abstract class AccountService {
  factory AccountService(Dio dio) = AccountServiceImpl;

  @FormUrlEncoded()
  @POST('login')
  Future<HttpResponse<LoginModel>> getLogin({
    @Field("username") String ? username,
    @Field("password") String ? password,
    @Field("firebase_id") String ? firebaseId
  });

  @GET('reset-password')
  Future<HttpResponse<GeneralModel>> getReset({
    @Query("nik") String ? nik
  });

  @GET('sync-data-hris')
  Future<HttpResponse<EmployeeModel>> checkNik({
    @Query("code") String ? code,
    @Query("nik") String ? nik
  });

  @FormUrlEncoded()
  @POST('register-user')
  Future<HttpResponse<GeneralModel>> register({
    @Field("data") String ? data
  });
}
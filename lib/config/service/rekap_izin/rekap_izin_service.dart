import 'dart:io';

import 'package:deka_appps_ios/extensions/constants.dart';
import 'package:deka_appps_ios/models/response/rekap_izin_model.dart';
import 'package:deka_appps_ios/models/response/view_cuti_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../models/response/error_model.dart';

part 'rekap_izin_service_impl.dart';

@RestApi(baseUrl: BASE_URL)
abstract class RekapIzinService {
  factory RekapIzinService(Dio dio) = RekapIzinServiceImpl;

  @FormUrlEncoded()
  @POST('perizinan/list')
  Future<HttpResponse<List<RekapIzinModel>>> getRekapIzin({
    @Field("nik") String ? nik
  });

  @FormUrlEncoded()
  @POST('perizinan/view-cuti')
  Future<HttpResponse<ViewCutiModel>> getViewCuti({
    @Field("nik") String ? nik
  });
}
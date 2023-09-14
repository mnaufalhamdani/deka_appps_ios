// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rekap_izin_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class RekapIzinServiceImpl implements RekapIzinService {
  RekapIzinServiceImpl(this._dio, {this.baseUrl}) {
    baseUrl ??= BASE_URL;
  }

  final Dio _dio;
  String? baseUrl;

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  @override
  Future<HttpResponse<List<RekapIzinModel>>> getRekapIzin({nik}) async {
    const extra = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = FormData.fromMap({
      'nik': nik
    });

    final result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<void>>(
            Options(method: 'POST', headers: headers, extra: extra, validateStatus: (status) => true)
                .compose(_dio.options, 'perizinan/list', data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

    if(result.statusCode == HttpStatus.ok) {
      List<RekapIzinModel> value = result.data!['data']
          .map<RekapIzinModel>((dynamic i) => RekapIzinModel.fromJson(i as Map<String, dynamic>))
          .toList();
      return HttpResponse(value, result);
    } else {
      throw ErrorModel.fromJson(result.data ?? ErrorModel(message: result.data.toString()));
    }

  }

  @override
  Future<HttpResponse<ViewCutiModel>> getViewCuti({nik}) async {
    const extra = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = FormData.fromMap({
      'nik': nik
    });

    final result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<void>>(
            Options(method: 'POST', headers: headers, extra: extra, validateStatus: (status) => true)
                .compose(_dio.options, 'perizinan/view-cuti', data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));


    if(result.statusCode == HttpStatus.ok) {
      ViewCutiModel value = ViewCutiModel.fromJson(result.data!['data']);
      return HttpResponse(value, result);
    } else {
      throw ErrorModel.fromJson(result.data ?? ErrorModel(message: result.data.toString()));
    }
  }

}

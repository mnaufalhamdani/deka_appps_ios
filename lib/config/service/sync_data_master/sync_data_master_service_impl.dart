// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_data_master_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class SyncDataMasterServiceImpl implements SyncDataMasterService {
  SyncDataMasterServiceImpl(this._dio, {this.baseUrl}) {
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
  Future<HttpResponse<SyncDataMasterModel>> syncDataMaster({String? user_id, String? date, String? slug_database}) async {
    const extra = <String, dynamic>{};
    final params = <String, dynamic>{
      'user_id': user_id,
      'date': date,
    };
    final headers = <String, dynamic>{};
    final data = FormData.fromMap({
      'slug_database': slug_database
    });

    final result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<void>>(
            Options(method: 'POST', headers: headers, extra: extra, validateStatus: (status) => true)
                .compose(_dio.options, 'sync-data-master', data: data, queryParameters: params)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

    if(result.statusCode == HttpStatus.ok) {
      SyncDataMasterModel value = SyncDataMasterModel.fromJson(result.data!['data']);
      return HttpResponse(value, result);
    } else {
      throw ErrorModel.fromJson(result.data ?? ErrorModel(message: result.data.toString()));
    }
  }

}

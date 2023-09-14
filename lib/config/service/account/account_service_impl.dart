// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class AccountServiceImpl implements AccountService {
  AccountServiceImpl(this._dio, {this.baseUrl}) {
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
  Future<HttpResponse<LoginModel>> getLogin({
    username,
    password,
    firebaseId
  }) async {
    const extra = <String, dynamic>{};
    final headers = <String, dynamic>{};
    final data = FormData.fromMap({
      'username' : username,
      'password' : password,
      'firebase_id' : firebaseId
    });

    final result = await _dio.fetch<Map<String,dynamic>>(
        _setStreamType<HttpResponse<void>>(
            Options(method: 'POST', headers: headers, extra: extra, validateStatus: (status) => true)
                .compose(_dio.options, 'login', data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)
        )
    );

    if(result.statusCode == HttpStatus.ok) {
      LoginModel value = LoginModel.fromJson(result.data!['data']['profile']);
      return HttpResponse(value, result);
    } else {
      throw ErrorModel.fromJson(result.data ?? ErrorModel(message: result.data.toString()));
    }
  }
}

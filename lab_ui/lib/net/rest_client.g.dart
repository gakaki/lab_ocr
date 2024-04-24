// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Result<InfoWorkModel>> getInfoListData(
    int page,
    int pageSize,
    String name,
    String t,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'pn': page,
      r'ps': pageSize,
      r'q': name,
      r't': t,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Result<InfoWorkModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'searchV5',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Result<InfoWorkModel>.fromJson(
      _result.data!,
      (json) => InfoWorkModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Result<InfoWorkModel>> getHomeListData(
    String queryFuture,
    String storeId,
    String layoutIds,
    int _timestemp,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'queryFuture': queryFuture,
      r'storeId': storeId,
      r'layoutIds': layoutIds,
      r'_timestemp': _timestemp,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Result<InfoWorkModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'layout/getNewLayDetail',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Result<InfoWorkModel>.fromJson(
      _result.data!,
      (json) => InfoWorkModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Result<InfoWorkModel>> getInfoDetailData(int entityId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'entityId': entityId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Result<InfoWorkModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'pc/items/info',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Result<InfoWorkModel>.fromJson(
      _result.data!,
      (json) => InfoWorkModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Result<InfoWorkModel>> likeThumbsUpOrDown(
      Map<String, dynamic> param) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(param);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Result<InfoWorkModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'thumbsUpOrDown',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Result<InfoWorkModel>.fromJson(
      _result.data!,
      (json) => InfoWorkModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<Result<List<CameraModel>>> getCameraListData(String labId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'lab_id': labId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Result<List<CameraModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'cameras',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Result<List<CameraModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<CameraModel>(
                  (i) => CameraModel.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<Result<List<ExperimentalReportModel>>> getExperimentalReportListData(
      String cameraId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'camera_id': cameraId};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Result<List<ExperimentalReportModel>>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'experimental_reports',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Result<List<ExperimentalReportModel>>.fromJson(
      _result.data!,
      (json) => json is List<dynamic>
          ? json
              .map<ExperimentalReportModel>((i) =>
                  ExperimentalReportModel.fromJson(i as Map<String, dynamic>))
              .toList()
          : List.empty(),
    );
    return value;
  }

  @override
  Future<Result<UserLoginModel>> token(
    String username,
    String password,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Result<UserLoginModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              'token',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Result<UserLoginModel>.fromJson(
      _result.data!,
      (json) => UserLoginModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

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

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/utils.dart';

import 'net_decoder.dart';
import 'net_exception.dart';
import 'net_options.dart';
import 'network_connectivity.dart';

/// A method to make http request, which is a alias of  [dio.fetch(RequestOptions)].
Future<T> fetch<T>(
  String path, {
  String method = 'GET',
  Object? data,
  bool silent = true,
  Map<String, dynamic>? queryParameters,
  Options? options,
  CancelToken? cancelToken,
  ProgressCallback? onSendProgress,
  ProgressCallback? onReceiveProgress,
  NetDecoder? httpDecode,
  NetConverter<T>? converter,
}) async {
  if (!await NetworkConnectivity().connected) {
    throw NetException(
        message: "network connect error, please check your network status.");
  }

  NetException exception;

  try {
    final response = await NetOptions.instance.dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      options: _checkOptions(method, options),
      onReceiveProgress: onReceiveProgress,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    );
    if (converter != null) {
      return await compute(converter, response);
    } else {
      var decode = await compute(
          _mapCompute<T>,
          _MapBean(response, httpDecode ?? NetOptions.instance.httpDecoder,
              NetOptions.instance.factory));
      return decode;
    }
  } on DioException catch (e) {
    if (kDebugMode) print("$path => DioError${e.message}");
    exception = NetException(
        message: e.message ?? '',
        code: e.response?.statusCode ?? 9999,
        request: "${e.requestOptions.method} ${e.requestOptions.path}");
  } on NetException catch (e) {
    if (kDebugMode) print("$path => NetException${e.toString()}");
    exception = e;
  } on TypeError catch (e) {
    if (kDebugMode) print("$path => TypeError${e.toString()}");
    exception = NetException(message: e.toString(), request: "$method $path");
  }

  if (!silent) {
    var localCode = "error_codes_${exception.code}";
    var msg = localCode.tr == localCode ? exception.message! : localCode.tr;
    SmartDialog.showToast(msg, alignment: Alignment.center, debounce: true);
  }

  throw exception;
}

Options _checkOptions(String method, Options? options) {
  options ??= Options();
  options.method = method;
  return options;
}

/// A method to decode the response. use isolate
T _mapCompute<T>(_MapBean bean) {
  return bean.httpDecode.decode(response: bean.response, factory: bean.factory);
}

/// `_MapBean` is a class that is used to pass parameters to the isolate.
class _MapBean {
  final Response<dynamic> response;
  final NetDecoder httpDecode;
  final EntityFactory factory;

  _MapBean(this.response, this.httpDecode, this.factory);
}

/// A function that takes a `Response` and returns a `Result<T>`.
typedef NetConverter<T> = T Function(Response response);

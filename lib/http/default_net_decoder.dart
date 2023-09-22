import 'package:dio/dio.dart';
import 'package:mobile/http/net_options.dart';

import 'net_decoder.dart';
import 'net_exception.dart';

/// 默认解码器
class DefaultNetDecoder extends NetDecoder {
  /// 单例对象
  static final DefaultNetDecoder _instance = DefaultNetDecoder._internal();

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  DefaultNetDecoder._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory DefaultNetDecoder.getInstance() => _instance;

  @override
  T decode<T>(
      {required Response<dynamic> response, required EntityFactory factory}) {
    var errorCode = response.data['code'];
    if (errorCode != null && errorCode > 9999) {
      throw NetException(
          code: errorCode,
          message: response.data['message'],
          request: response.data['request']);
    }

    var decoder = factory.entityFactor<T>();
    if (decoder != null) {
      if (response.data is List) {
        var list = response.data as List;
        var dataList =
            List<T>.from(list.map((item) => decoder(item)).toList()) as T;
        return dataList;
      } else {
        var data = decoder(response.data);
        return data;
      }
    } else {
      return response.data as T;
    }
  }
}

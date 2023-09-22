import 'package:dio/dio.dart';
import 'package:mobile/http/net_options.dart';

/// Response 解码器
/// 把 Response 转换成对应类型
abstract class NetDecoder {
  ///  解码
  ///  [response] Response
  ///  [responseType] 解码类型
  ///  [T] 返回类型
  T decode<T>(
      {required Response<dynamic> response, required EntityFactory factory});
}

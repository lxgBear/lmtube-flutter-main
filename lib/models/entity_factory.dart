import 'package:mobile/http/net_options.dart';

import 'token_model.dart';

class HEntityFactory implements EntityFactory {
  static final HEntityFactory _instance = HEntityFactory._internal();

  HEntityFactory._internal();

  factory HEntityFactory.getInstance() => _instance;

  @override
  T Function(Map<String, Object?> json)? entityFactor<T>() {
    String entityName = T.toString();
    switch (entityName) {
      case 'TokenModel':
        return TokenModel.fromJson as T Function(Map<String, Object?> json);
      default:
        return null;
    }
  }
}

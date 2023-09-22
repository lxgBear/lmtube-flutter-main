import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';

@unfreezed
class LoginDTO with _$LoginDTO {
  factory LoginDTO({
    @JsonKey(name: 'account') String? account,
    @JsonKey(name: 'secret') String? secret,
    @JsonKey(name: 'source') String? source,
  }) = _LoginDTO;

  factory LoginDTO.fromJson(Map<String, Object?> json) =>
      _$LoginDTOFromJson(json);
}

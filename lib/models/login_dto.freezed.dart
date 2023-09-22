// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginDTO _$LoginDTOFromJson(Map<String, dynamic> json) {
  return _LoginDTO.fromJson(json);
}

/// @nodoc
mixin _$LoginDTO {
  @JsonKey(name: 'account')
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: 'account')
  set account(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'secret')
  String? get secret => throw _privateConstructorUsedError;
  @JsonKey(name: 'secret')
  set secret(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  String? get source => throw _privateConstructorUsedError;
  @JsonKey(name: 'source')
  set source(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginDTOCopyWith<LoginDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDTOCopyWith<$Res> {
  factory $LoginDTOCopyWith(LoginDTO value, $Res Function(LoginDTO) then) =
      _$LoginDTOCopyWithImpl<$Res, LoginDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'account') String? account,
      @JsonKey(name: 'secret') String? secret,
      @JsonKey(name: 'source') String? source});
}

/// @nodoc
class _$LoginDTOCopyWithImpl<$Res, $Val extends LoginDTO>
    implements $LoginDTOCopyWith<$Res> {
  _$LoginDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? secret = freezed,
    Object? source = freezed,
  }) {
    return _then(_value.copyWith(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      secret: freezed == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginDTOCopyWith<$Res> implements $LoginDTOCopyWith<$Res> {
  factory _$$_LoginDTOCopyWith(
          _$_LoginDTO value, $Res Function(_$_LoginDTO) then) =
      __$$_LoginDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'account') String? account,
      @JsonKey(name: 'secret') String? secret,
      @JsonKey(name: 'source') String? source});
}

/// @nodoc
class __$$_LoginDTOCopyWithImpl<$Res>
    extends _$LoginDTOCopyWithImpl<$Res, _$_LoginDTO>
    implements _$$_LoginDTOCopyWith<$Res> {
  __$$_LoginDTOCopyWithImpl(
      _$_LoginDTO _value, $Res Function(_$_LoginDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? secret = freezed,
    Object? source = freezed,
  }) {
    return _then(_$_LoginDTO(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      secret: freezed == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginDTO implements _LoginDTO {
  _$_LoginDTO(
      {@JsonKey(name: 'account') this.account,
      @JsonKey(name: 'secret') this.secret,
      @JsonKey(name: 'source') this.source});

  factory _$_LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$$_LoginDTOFromJson(json);

  @override
  @JsonKey(name: 'account')
  String? account;
  @override
  @JsonKey(name: 'secret')
  String? secret;
  @override
  @JsonKey(name: 'source')
  String? source;

  @override
  String toString() {
    return 'LoginDTO(account: $account, secret: $secret, source: $source)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginDTOCopyWith<_$_LoginDTO> get copyWith =>
      __$$_LoginDTOCopyWithImpl<_$_LoginDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginDTOToJson(
      this,
    );
  }
}

abstract class _LoginDTO implements LoginDTO {
  factory _LoginDTO(
      {@JsonKey(name: 'account') String? account,
      @JsonKey(name: 'secret') String? secret,
      @JsonKey(name: 'source') String? source}) = _$_LoginDTO;

  factory _LoginDTO.fromJson(Map<String, dynamic> json) = _$_LoginDTO.fromJson;

  @override
  @JsonKey(name: 'account')
  String? get account;
  @JsonKey(name: 'account')
  set account(String? value);
  @override
  @JsonKey(name: 'secret')
  String? get secret;
  @JsonKey(name: 'secret')
  set secret(String? value);
  @override
  @JsonKey(name: 'source')
  String? get source;
  @JsonKey(name: 'source')
  set source(String? value);
  @override
  @JsonKey(ignore: true)
  _$$_LoginDTOCopyWith<_$_LoginDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

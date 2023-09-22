// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginDTO _$$_LoginDTOFromJson(Map<String, dynamic> json) => _$_LoginDTO(
      account: json['account'] as String?,
      secret: json['secret'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$$_LoginDTOToJson(_$_LoginDTO instance) =>
    <String, dynamic>{
      'account': instance.account,
      'secret': instance.secret,
      'source': instance.source,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'definition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DefinitionDto _$DefinitionDtoFromJson(Map<String, dynamic> json) =>
    _DefinitionDto(
      key: json['key'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$DefinitionDtoToJson(_DefinitionDto instance) =>
    <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'description': instance.description,
    };

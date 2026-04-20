// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DataPointDto _$DataPointDtoFromJson(Map<String, dynamic> json) =>
    _DataPointDto(
      date: json['date'] as String,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DataPointDtoToJson(_DataPointDto instance) =>
    <String, dynamic>{'date': instance.date, 'value': instance.value};

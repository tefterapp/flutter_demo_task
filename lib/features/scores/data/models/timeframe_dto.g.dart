// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeframe_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimeframeDto _$TimeframeDtoFromJson(Map<String, dynamic> json) =>
    _TimeframeDto(
      points: (json['points'] as List<dynamic>)
          .map((e) => DataPointDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      metrics: _metricsFromJson(json['metrics']),
      insights: (json['insights'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      definitions: (json['definitions'] as List<dynamic>)
          .map((e) => DefinitionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeframeDtoToJson(_TimeframeDto instance) =>
    <String, dynamic>{
      'points': instance.points,
      'metrics': _metricsToJson(instance.metrics),
      'insights': instance.insights,
      'definitions': instance.definitions,
    };

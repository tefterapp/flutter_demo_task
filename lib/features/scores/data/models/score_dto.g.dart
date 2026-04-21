// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScoreDto _$ScoreDtoFromJson(Map<String, dynamic> json) => _ScoreDto(
  type: json['type'] as String,
  currentScore: (json['currentScore'] as num).toDouble(),
  valueLabel: json['valueLabel'] as String,
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

Map<String, dynamic> _$ScoreDtoToJson(_ScoreDto instance) => <String, dynamic>{
  'type': instance.type,
  'currentScore': instance.currentScore,
  'valueLabel': instance.valueLabel,
  'points': instance.points,
  'metrics': _metricsToJson(instance.metrics),
  'insights': instance.insights,
  'definitions': instance.definitions,
};

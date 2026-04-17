// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scores_payload_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScoresPayloadDto _$ScoresPayloadDtoFromJson(Map<String, dynamic> json) =>
    _ScoresPayloadDto(
      scores: (json['scores'] as List<dynamic>)
          .map((e) => ScoreDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScoresPayloadDtoToJson(_ScoresPayloadDto instance) =>
    <String, dynamic>{'scores': instance.scores};

_ScoreDto _$ScoreDtoFromJson(Map<String, dynamic> json) => _ScoreDto(
  type: json['type'] as String,
  currentScore: (json['currentScore'] as num).toDouble(),
  valueLabel: json['valueLabel'] as String,
  timeframes: _timeframesFromJson(json['timeframes']),
);

Map<String, dynamic> _$ScoreDtoToJson(_ScoreDto instance) => <String, dynamic>{
  'type': instance.type,
  'currentScore': instance.currentScore,
  'valueLabel': instance.valueLabel,
  'timeframes': _timeframesToJson(instance.timeframes),
};

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

_DataPointDto _$DataPointDtoFromJson(Map<String, dynamic> json) =>
    _DataPointDto(
      date: json['date'] as String,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DataPointDtoToJson(_DataPointDto instance) =>
    <String, dynamic>{'date': instance.date, 'value': instance.value};

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

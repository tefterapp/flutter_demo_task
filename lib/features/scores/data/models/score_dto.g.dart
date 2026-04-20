// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

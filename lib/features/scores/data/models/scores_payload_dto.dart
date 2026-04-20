import 'package:freezed_annotation/freezed_annotation.dart';

part 'scores_payload_dto.freezed.dart';
part 'scores_payload_dto.g.dart';

@freezed
abstract class ScoresPayloadDto with _$ScoresPayloadDto {
  const factory ScoresPayloadDto({
    required List<ScoreDto> scores,
  }) = _ScoresPayloadDto;

  factory ScoresPayloadDto.fromJson(Map<String, dynamic> json) =>
      _$ScoresPayloadDtoFromJson(json);
}

@freezed
abstract class ScoreDto with _$ScoreDto {
  const factory ScoreDto({
    required String type,
    required double currentScore,
    required String valueLabel,
    @JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson)
    required Map<String, TimeframeDto> timeframes,
  }) = _ScoreDto;

  factory ScoreDto.fromJson(Map<String, dynamic> json) =>
      _$ScoreDtoFromJson(json);
}

Map<String, TimeframeDto> _timeframesFromJson(Object? json) {
  if (json is! Map) {
    throw const FormatException('timeframes must be a JSON object');
  }
  return json.map(
    (key, value) => MapEntry(
      key as String,
      TimeframeDto.fromJson(Map<String, dynamic>.from(value as Map)),
    ),
  );
}

Map<String, Object?> _timeframesToJson(Map<String, TimeframeDto> value) =>
    value.map((k, v) => MapEntry(k, v.toJson()));

@freezed
abstract class TimeframeDto with _$TimeframeDto {
  const factory TimeframeDto({
    required List<DataPointDto> points,
    @JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson)
    required Map<String, List<DataPointDto>> metrics,
    required List<String> insights,
    required List<DefinitionDto> definitions,
  }) = _TimeframeDto;

  factory TimeframeDto.fromJson(Map<String, dynamic> json) =>
      _$TimeframeDtoFromJson(json);
}

Map<String, List<DataPointDto>> _metricsFromJson(Object? json) {
  if (json is! Map) {
    throw const FormatException('metrics must be a JSON object');
  }
  return json.map(
    (key, value) => MapEntry(
      key as String,
      (value as List<dynamic>)
          .map(
            (e) => DataPointDto.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList(),
    ),
  );
}

Map<String, Object?> _metricsToJson(Map<String, List<DataPointDto>> value) =>
    value.map((k, v) => MapEntry(k, v.map((e) => e.toJson()).toList()));

@freezed
abstract class DataPointDto with _$DataPointDto {
  const factory DataPointDto({
    required String date,
    double? value,
  }) = _DataPointDto;

  factory DataPointDto.fromJson(Map<String, dynamic> json) =>
      _$DataPointDtoFromJson(json);
}

@freezed
abstract class DefinitionDto with _$DefinitionDto {
  const factory DefinitionDto({
    required String key,
    required String title,
    required String description,
  }) = _DefinitionDto;

  factory DefinitionDto.fromJson(Map<String, dynamic> json) =>
      _$DefinitionDtoFromJson(json);
}

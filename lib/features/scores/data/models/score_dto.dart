import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_point_dto.dart';
import 'definition_dto.dart';

part 'score_dto.freezed.dart';
part 'score_dto.g.dart';

@freezed
abstract class ScoreDto with _$ScoreDto {
  const factory ScoreDto({
    required String type,
    required double currentScore,
    required String valueLabel,
    required List<DataPointDto> points,
    @JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson)
    required Map<String, List<DataPointDto>> metrics,
    required List<String> insights,
    required List<DefinitionDto> definitions,
  }) = _ScoreDto;

  factory ScoreDto.fromJson(Map<String, dynamic> json) =>
      _$ScoreDtoFromJson(json);
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

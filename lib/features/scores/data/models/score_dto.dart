import 'package:freezed_annotation/freezed_annotation.dart';

import 'timeframe_dto.dart';

part 'score_dto.freezed.dart';
part 'score_dto.g.dart';

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

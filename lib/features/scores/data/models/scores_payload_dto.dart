import 'package:freezed_annotation/freezed_annotation.dart';

import 'score_dto.dart';

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

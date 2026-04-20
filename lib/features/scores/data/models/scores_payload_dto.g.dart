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

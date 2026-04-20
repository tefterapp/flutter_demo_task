import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_point_dto.freezed.dart';
part 'data_point_dto.g.dart';

@freezed
abstract class DataPointDto with _$DataPointDto {
  const factory DataPointDto({
    required String date,
    double? value,
  }) = _DataPointDto;

  factory DataPointDto.fromJson(Map<String, dynamic> json) =>
      _$DataPointDtoFromJson(json);
}

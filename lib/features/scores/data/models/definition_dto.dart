import 'package:freezed_annotation/freezed_annotation.dart';

part 'definition_dto.freezed.dart';
part 'definition_dto.g.dart';

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

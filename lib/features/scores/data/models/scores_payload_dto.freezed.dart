// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scores_payload_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScoresPayloadDto {

 List<ScoreDto> get scores;
/// Create a copy of ScoresPayloadDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoresPayloadDtoCopyWith<ScoresPayloadDto> get copyWith => _$ScoresPayloadDtoCopyWithImpl<ScoresPayloadDto>(this as ScoresPayloadDto, _$identity);

  /// Serializes this ScoresPayloadDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoresPayloadDto&&const DeepCollectionEquality().equals(other.scores, scores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(scores));

@override
String toString() {
  return 'ScoresPayloadDto(scores: $scores)';
}


}

/// @nodoc
abstract mixin class $ScoresPayloadDtoCopyWith<$Res>  {
  factory $ScoresPayloadDtoCopyWith(ScoresPayloadDto value, $Res Function(ScoresPayloadDto) _then) = _$ScoresPayloadDtoCopyWithImpl;
@useResult
$Res call({
 List<ScoreDto> scores
});




}
/// @nodoc
class _$ScoresPayloadDtoCopyWithImpl<$Res>
    implements $ScoresPayloadDtoCopyWith<$Res> {
  _$ScoresPayloadDtoCopyWithImpl(this._self, this._then);

  final ScoresPayloadDto _self;
  final $Res Function(ScoresPayloadDto) _then;

/// Create a copy of ScoresPayloadDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? scores = null,}) {
  return _then(_self.copyWith(
scores: null == scores ? _self.scores : scores // ignore: cast_nullable_to_non_nullable
as List<ScoreDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoresPayloadDto].
extension ScoresPayloadDtoPatterns on ScoresPayloadDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoresPayloadDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoresPayloadDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoresPayloadDto value)  $default,){
final _that = this;
switch (_that) {
case _ScoresPayloadDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoresPayloadDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScoresPayloadDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ScoreDto> scores)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoresPayloadDto() when $default != null:
return $default(_that.scores);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ScoreDto> scores)  $default,) {final _that = this;
switch (_that) {
case _ScoresPayloadDto():
return $default(_that.scores);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ScoreDto> scores)?  $default,) {final _that = this;
switch (_that) {
case _ScoresPayloadDto() when $default != null:
return $default(_that.scores);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoresPayloadDto implements ScoresPayloadDto {
  const _ScoresPayloadDto({required final  List<ScoreDto> scores}): _scores = scores;
  factory _ScoresPayloadDto.fromJson(Map<String, dynamic> json) => _$ScoresPayloadDtoFromJson(json);

 final  List<ScoreDto> _scores;
@override List<ScoreDto> get scores {
  if (_scores is EqualUnmodifiableListView) return _scores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_scores);
}


/// Create a copy of ScoresPayloadDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoresPayloadDtoCopyWith<_ScoresPayloadDto> get copyWith => __$ScoresPayloadDtoCopyWithImpl<_ScoresPayloadDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoresPayloadDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoresPayloadDto&&const DeepCollectionEquality().equals(other._scores, _scores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_scores));

@override
String toString() {
  return 'ScoresPayloadDto(scores: $scores)';
}


}

/// @nodoc
abstract mixin class _$ScoresPayloadDtoCopyWith<$Res> implements $ScoresPayloadDtoCopyWith<$Res> {
  factory _$ScoresPayloadDtoCopyWith(_ScoresPayloadDto value, $Res Function(_ScoresPayloadDto) _then) = __$ScoresPayloadDtoCopyWithImpl;
@override @useResult
$Res call({
 List<ScoreDto> scores
});




}
/// @nodoc
class __$ScoresPayloadDtoCopyWithImpl<$Res>
    implements _$ScoresPayloadDtoCopyWith<$Res> {
  __$ScoresPayloadDtoCopyWithImpl(this._self, this._then);

  final _ScoresPayloadDto _self;
  final $Res Function(_ScoresPayloadDto) _then;

/// Create a copy of ScoresPayloadDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? scores = null,}) {
  return _then(_ScoresPayloadDto(
scores: null == scores ? _self._scores : scores // ignore: cast_nullable_to_non_nullable
as List<ScoreDto>,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScoreDto {

 String get type; double get currentScore; String get valueLabel;@JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson) Map<String, TimeframeDto> get timeframes;
/// Create a copy of ScoreDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDtoCopyWith<ScoreDto> get copyWith => _$ScoreDtoCopyWithImpl<ScoreDto>(this as ScoreDto, _$identity);

  /// Serializes this ScoreDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDto&&(identical(other.type, type) || other.type == type)&&(identical(other.currentScore, currentScore) || other.currentScore == currentScore)&&(identical(other.valueLabel, valueLabel) || other.valueLabel == valueLabel)&&const DeepCollectionEquality().equals(other.timeframes, timeframes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,currentScore,valueLabel,const DeepCollectionEquality().hash(timeframes));

@override
String toString() {
  return 'ScoreDto(type: $type, currentScore: $currentScore, valueLabel: $valueLabel, timeframes: $timeframes)';
}


}

/// @nodoc
abstract mixin class $ScoreDtoCopyWith<$Res>  {
  factory $ScoreDtoCopyWith(ScoreDto value, $Res Function(ScoreDto) _then) = _$ScoreDtoCopyWithImpl;
@useResult
$Res call({
 String type, double currentScore, String valueLabel,@JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson) Map<String, TimeframeDto> timeframes
});




}
/// @nodoc
class _$ScoreDtoCopyWithImpl<$Res>
    implements $ScoreDtoCopyWith<$Res> {
  _$ScoreDtoCopyWithImpl(this._self, this._then);

  final ScoreDto _self;
  final $Res Function(ScoreDto) _then;

/// Create a copy of ScoreDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? currentScore = null,Object? valueLabel = null,Object? timeframes = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,currentScore: null == currentScore ? _self.currentScore : currentScore // ignore: cast_nullable_to_non_nullable
as double,valueLabel: null == valueLabel ? _self.valueLabel : valueLabel // ignore: cast_nullable_to_non_nullable
as String,timeframes: null == timeframes ? _self.timeframes : timeframes // ignore: cast_nullable_to_non_nullable
as Map<String, TimeframeDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoreDto].
extension ScoreDtoPatterns on ScoreDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoreDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoreDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoreDto value)  $default,){
final _that = this;
switch (_that) {
case _ScoreDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoreDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScoreDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  double currentScore,  String valueLabel, @JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson)  Map<String, TimeframeDto> timeframes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoreDto() when $default != null:
return $default(_that.type,_that.currentScore,_that.valueLabel,_that.timeframes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  double currentScore,  String valueLabel, @JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson)  Map<String, TimeframeDto> timeframes)  $default,) {final _that = this;
switch (_that) {
case _ScoreDto():
return $default(_that.type,_that.currentScore,_that.valueLabel,_that.timeframes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  double currentScore,  String valueLabel, @JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson)  Map<String, TimeframeDto> timeframes)?  $default,) {final _that = this;
switch (_that) {
case _ScoreDto() when $default != null:
return $default(_that.type,_that.currentScore,_that.valueLabel,_that.timeframes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoreDto implements ScoreDto {
  const _ScoreDto({required this.type, required this.currentScore, required this.valueLabel, @JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson) required final  Map<String, TimeframeDto> timeframes}): _timeframes = timeframes;
  factory _ScoreDto.fromJson(Map<String, dynamic> json) => _$ScoreDtoFromJson(json);

@override final  String type;
@override final  double currentScore;
@override final  String valueLabel;
 final  Map<String, TimeframeDto> _timeframes;
@override@JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson) Map<String, TimeframeDto> get timeframes {
  if (_timeframes is EqualUnmodifiableMapView) return _timeframes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_timeframes);
}


/// Create a copy of ScoreDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreDtoCopyWith<_ScoreDto> get copyWith => __$ScoreDtoCopyWithImpl<_ScoreDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreDto&&(identical(other.type, type) || other.type == type)&&(identical(other.currentScore, currentScore) || other.currentScore == currentScore)&&(identical(other.valueLabel, valueLabel) || other.valueLabel == valueLabel)&&const DeepCollectionEquality().equals(other._timeframes, _timeframes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,currentScore,valueLabel,const DeepCollectionEquality().hash(_timeframes));

@override
String toString() {
  return 'ScoreDto(type: $type, currentScore: $currentScore, valueLabel: $valueLabel, timeframes: $timeframes)';
}


}

/// @nodoc
abstract mixin class _$ScoreDtoCopyWith<$Res> implements $ScoreDtoCopyWith<$Res> {
  factory _$ScoreDtoCopyWith(_ScoreDto value, $Res Function(_ScoreDto) _then) = __$ScoreDtoCopyWithImpl;
@override @useResult
$Res call({
 String type, double currentScore, String valueLabel,@JsonKey(fromJson: _timeframesFromJson, toJson: _timeframesToJson) Map<String, TimeframeDto> timeframes
});




}
/// @nodoc
class __$ScoreDtoCopyWithImpl<$Res>
    implements _$ScoreDtoCopyWith<$Res> {
  __$ScoreDtoCopyWithImpl(this._self, this._then);

  final _ScoreDto _self;
  final $Res Function(_ScoreDto) _then;

/// Create a copy of ScoreDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? currentScore = null,Object? valueLabel = null,Object? timeframes = null,}) {
  return _then(_ScoreDto(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,currentScore: null == currentScore ? _self.currentScore : currentScore // ignore: cast_nullable_to_non_nullable
as double,valueLabel: null == valueLabel ? _self.valueLabel : valueLabel // ignore: cast_nullable_to_non_nullable
as String,timeframes: null == timeframes ? _self._timeframes : timeframes // ignore: cast_nullable_to_non_nullable
as Map<String, TimeframeDto>,
  ));
}


}

// dart format on

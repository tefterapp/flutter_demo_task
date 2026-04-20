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


/// @nodoc
mixin _$TimeframeDto {

 List<DataPointDto> get points;@JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson) Map<String, List<DataPointDto>> get metrics; List<String> get insights; List<DefinitionDto> get definitions;
/// Create a copy of TimeframeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeframeDtoCopyWith<TimeframeDto> get copyWith => _$TimeframeDtoCopyWithImpl<TimeframeDto>(this as TimeframeDto, _$identity);

  /// Serializes this TimeframeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeframeDto&&const DeepCollectionEquality().equals(other.points, points)&&const DeepCollectionEquality().equals(other.metrics, metrics)&&const DeepCollectionEquality().equals(other.insights, insights)&&const DeepCollectionEquality().equals(other.definitions, definitions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(points),const DeepCollectionEquality().hash(metrics),const DeepCollectionEquality().hash(insights),const DeepCollectionEquality().hash(definitions));

@override
String toString() {
  return 'TimeframeDto(points: $points, metrics: $metrics, insights: $insights, definitions: $definitions)';
}


}

/// @nodoc
abstract mixin class $TimeframeDtoCopyWith<$Res>  {
  factory $TimeframeDtoCopyWith(TimeframeDto value, $Res Function(TimeframeDto) _then) = _$TimeframeDtoCopyWithImpl;
@useResult
$Res call({
 List<DataPointDto> points,@JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson) Map<String, List<DataPointDto>> metrics, List<String> insights, List<DefinitionDto> definitions
});




}
/// @nodoc
class _$TimeframeDtoCopyWithImpl<$Res>
    implements $TimeframeDtoCopyWith<$Res> {
  _$TimeframeDtoCopyWithImpl(this._self, this._then);

  final TimeframeDto _self;
  final $Res Function(TimeframeDto) _then;

/// Create a copy of TimeframeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? points = null,Object? metrics = null,Object? insights = null,Object? definitions = null,}) {
  return _then(_self.copyWith(
points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<DataPointDto>,metrics: null == metrics ? _self.metrics : metrics // ignore: cast_nullable_to_non_nullable
as Map<String, List<DataPointDto>>,insights: null == insights ? _self.insights : insights // ignore: cast_nullable_to_non_nullable
as List<String>,definitions: null == definitions ? _self.definitions : definitions // ignore: cast_nullable_to_non_nullable
as List<DefinitionDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeframeDto].
extension TimeframeDtoPatterns on TimeframeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeframeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeframeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeframeDto value)  $default,){
final _that = this;
switch (_that) {
case _TimeframeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeframeDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimeframeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DataPointDto> points, @JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson)  Map<String, List<DataPointDto>> metrics,  List<String> insights,  List<DefinitionDto> definitions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeframeDto() when $default != null:
return $default(_that.points,_that.metrics,_that.insights,_that.definitions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DataPointDto> points, @JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson)  Map<String, List<DataPointDto>> metrics,  List<String> insights,  List<DefinitionDto> definitions)  $default,) {final _that = this;
switch (_that) {
case _TimeframeDto():
return $default(_that.points,_that.metrics,_that.insights,_that.definitions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DataPointDto> points, @JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson)  Map<String, List<DataPointDto>> metrics,  List<String> insights,  List<DefinitionDto> definitions)?  $default,) {final _that = this;
switch (_that) {
case _TimeframeDto() when $default != null:
return $default(_that.points,_that.metrics,_that.insights,_that.definitions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeframeDto implements TimeframeDto {
  const _TimeframeDto({required final  List<DataPointDto> points, @JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson) required final  Map<String, List<DataPointDto>> metrics, required final  List<String> insights, required final  List<DefinitionDto> definitions}): _points = points,_metrics = metrics,_insights = insights,_definitions = definitions;
  factory _TimeframeDto.fromJson(Map<String, dynamic> json) => _$TimeframeDtoFromJson(json);

 final  List<DataPointDto> _points;
@override List<DataPointDto> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

 final  Map<String, List<DataPointDto>> _metrics;
@override@JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson) Map<String, List<DataPointDto>> get metrics {
  if (_metrics is EqualUnmodifiableMapView) return _metrics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metrics);
}

 final  List<String> _insights;
@override List<String> get insights {
  if (_insights is EqualUnmodifiableListView) return _insights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_insights);
}

 final  List<DefinitionDto> _definitions;
@override List<DefinitionDto> get definitions {
  if (_definitions is EqualUnmodifiableListView) return _definitions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_definitions);
}


/// Create a copy of TimeframeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeframeDtoCopyWith<_TimeframeDto> get copyWith => __$TimeframeDtoCopyWithImpl<_TimeframeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeframeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeframeDto&&const DeepCollectionEquality().equals(other._points, _points)&&const DeepCollectionEquality().equals(other._metrics, _metrics)&&const DeepCollectionEquality().equals(other._insights, _insights)&&const DeepCollectionEquality().equals(other._definitions, _definitions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_points),const DeepCollectionEquality().hash(_metrics),const DeepCollectionEquality().hash(_insights),const DeepCollectionEquality().hash(_definitions));

@override
String toString() {
  return 'TimeframeDto(points: $points, metrics: $metrics, insights: $insights, definitions: $definitions)';
}


}

/// @nodoc
abstract mixin class _$TimeframeDtoCopyWith<$Res> implements $TimeframeDtoCopyWith<$Res> {
  factory _$TimeframeDtoCopyWith(_TimeframeDto value, $Res Function(_TimeframeDto) _then) = __$TimeframeDtoCopyWithImpl;
@override @useResult
$Res call({
 List<DataPointDto> points,@JsonKey(fromJson: _metricsFromJson, toJson: _metricsToJson) Map<String, List<DataPointDto>> metrics, List<String> insights, List<DefinitionDto> definitions
});




}
/// @nodoc
class __$TimeframeDtoCopyWithImpl<$Res>
    implements _$TimeframeDtoCopyWith<$Res> {
  __$TimeframeDtoCopyWithImpl(this._self, this._then);

  final _TimeframeDto _self;
  final $Res Function(_TimeframeDto) _then;

/// Create a copy of TimeframeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? points = null,Object? metrics = null,Object? insights = null,Object? definitions = null,}) {
  return _then(_TimeframeDto(
points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<DataPointDto>,metrics: null == metrics ? _self._metrics : metrics // ignore: cast_nullable_to_non_nullable
as Map<String, List<DataPointDto>>,insights: null == insights ? _self._insights : insights // ignore: cast_nullable_to_non_nullable
as List<String>,definitions: null == definitions ? _self._definitions : definitions // ignore: cast_nullable_to_non_nullable
as List<DefinitionDto>,
  ));
}


}


/// @nodoc
mixin _$DataPointDto {

 String get date; double? get value;
/// Create a copy of DataPointDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataPointDtoCopyWith<DataPointDto> get copyWith => _$DataPointDtoCopyWithImpl<DataPointDto>(this as DataPointDto, _$identity);

  /// Serializes this DataPointDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataPointDto&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value);

@override
String toString() {
  return 'DataPointDto(date: $date, value: $value)';
}


}

/// @nodoc
abstract mixin class $DataPointDtoCopyWith<$Res>  {
  factory $DataPointDtoCopyWith(DataPointDto value, $Res Function(DataPointDto) _then) = _$DataPointDtoCopyWithImpl;
@useResult
$Res call({
 String date, double? value
});




}
/// @nodoc
class _$DataPointDtoCopyWithImpl<$Res>
    implements $DataPointDtoCopyWith<$Res> {
  _$DataPointDtoCopyWithImpl(this._self, this._then);

  final DataPointDto _self;
  final $Res Function(DataPointDto) _then;

/// Create a copy of DataPointDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? value = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DataPointDto].
extension DataPointDtoPatterns on DataPointDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataPointDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataPointDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataPointDto value)  $default,){
final _that = this;
switch (_that) {
case _DataPointDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataPointDto value)?  $default,){
final _that = this;
switch (_that) {
case _DataPointDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double? value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataPointDto() when $default != null:
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double? value)  $default,) {final _that = this;
switch (_that) {
case _DataPointDto():
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double? value)?  $default,) {final _that = this;
switch (_that) {
case _DataPointDto() when $default != null:
return $default(_that.date,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataPointDto implements DataPointDto {
  const _DataPointDto({required this.date, this.value});
  factory _DataPointDto.fromJson(Map<String, dynamic> json) => _$DataPointDtoFromJson(json);

@override final  String date;
@override final  double? value;

/// Create a copy of DataPointDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataPointDtoCopyWith<_DataPointDto> get copyWith => __$DataPointDtoCopyWithImpl<_DataPointDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataPointDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataPointDto&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value);

@override
String toString() {
  return 'DataPointDto(date: $date, value: $value)';
}


}

/// @nodoc
abstract mixin class _$DataPointDtoCopyWith<$Res> implements $DataPointDtoCopyWith<$Res> {
  factory _$DataPointDtoCopyWith(_DataPointDto value, $Res Function(_DataPointDto) _then) = __$DataPointDtoCopyWithImpl;
@override @useResult
$Res call({
 String date, double? value
});




}
/// @nodoc
class __$DataPointDtoCopyWithImpl<$Res>
    implements _$DataPointDtoCopyWith<$Res> {
  __$DataPointDtoCopyWithImpl(this._self, this._then);

  final _DataPointDto _self;
  final $Res Function(_DataPointDto) _then;

/// Create a copy of DataPointDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? value = freezed,}) {
  return _then(_DataPointDto(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$DefinitionDto {

 String get key; String get title; String get description;
/// Create a copy of DefinitionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DefinitionDtoCopyWith<DefinitionDto> get copyWith => _$DefinitionDtoCopyWithImpl<DefinitionDto>(this as DefinitionDto, _$identity);

  /// Serializes this DefinitionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DefinitionDto&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,title,description);

@override
String toString() {
  return 'DefinitionDto(key: $key, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class $DefinitionDtoCopyWith<$Res>  {
  factory $DefinitionDtoCopyWith(DefinitionDto value, $Res Function(DefinitionDto) _then) = _$DefinitionDtoCopyWithImpl;
@useResult
$Res call({
 String key, String title, String description
});




}
/// @nodoc
class _$DefinitionDtoCopyWithImpl<$Res>
    implements $DefinitionDtoCopyWith<$Res> {
  _$DefinitionDtoCopyWithImpl(this._self, this._then);

  final DefinitionDto _self;
  final $Res Function(DefinitionDto) _then;

/// Create a copy of DefinitionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? title = null,Object? description = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DefinitionDto].
extension DefinitionDtoPatterns on DefinitionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DefinitionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DefinitionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DefinitionDto value)  $default,){
final _that = this;
switch (_that) {
case _DefinitionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DefinitionDto value)?  $default,){
final _that = this;
switch (_that) {
case _DefinitionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String title,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DefinitionDto() when $default != null:
return $default(_that.key,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String title,  String description)  $default,) {final _that = this;
switch (_that) {
case _DefinitionDto():
return $default(_that.key,_that.title,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String title,  String description)?  $default,) {final _that = this;
switch (_that) {
case _DefinitionDto() when $default != null:
return $default(_that.key,_that.title,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DefinitionDto implements DefinitionDto {
  const _DefinitionDto({required this.key, required this.title, required this.description});
  factory _DefinitionDto.fromJson(Map<String, dynamic> json) => _$DefinitionDtoFromJson(json);

@override final  String key;
@override final  String title;
@override final  String description;

/// Create a copy of DefinitionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefinitionDtoCopyWith<_DefinitionDto> get copyWith => __$DefinitionDtoCopyWithImpl<_DefinitionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DefinitionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefinitionDto&&(identical(other.key, key) || other.key == key)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,title,description);

@override
String toString() {
  return 'DefinitionDto(key: $key, title: $title, description: $description)';
}


}

/// @nodoc
abstract mixin class _$DefinitionDtoCopyWith<$Res> implements $DefinitionDtoCopyWith<$Res> {
  factory _$DefinitionDtoCopyWith(_DefinitionDto value, $Res Function(_DefinitionDto) _then) = __$DefinitionDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, String title, String description
});




}
/// @nodoc
class __$DefinitionDtoCopyWithImpl<$Res>
    implements _$DefinitionDtoCopyWith<$Res> {
  __$DefinitionDtoCopyWithImpl(this._self, this._then);

  final _DefinitionDto _self;
  final $Res Function(_DefinitionDto) _then;

/// Create a copy of DefinitionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? title = null,Object? description = null,}) {
  return _then(_DefinitionDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeframe_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

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

// dart format on

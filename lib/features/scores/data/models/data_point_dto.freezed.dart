// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_point_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

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

// dart format on

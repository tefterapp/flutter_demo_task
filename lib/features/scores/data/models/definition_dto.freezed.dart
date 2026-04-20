// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'definition_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

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

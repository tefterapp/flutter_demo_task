// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scores_home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScoresHomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoresHomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoresHomeState()';
}


}

/// @nodoc
class $ScoresHomeStateCopyWith<$Res>  {
$ScoresHomeStateCopyWith(ScoresHomeState _, $Res Function(ScoresHomeState) __);
}


/// Adds pattern-matching-related methods to [ScoresHomeState].
extension ScoresHomeStatePatterns on ScoresHomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScoresHomeInitial value)?  initial,TResult Function( ScoresHomeLoading value)?  loading,TResult Function( ScoresHomeSuccess value)?  success,TResult Function( ScoresHomeEmpty value)?  empty,TResult Function( ScoresHomeFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScoresHomeInitial() when initial != null:
return initial(_that);case ScoresHomeLoading() when loading != null:
return loading(_that);case ScoresHomeSuccess() when success != null:
return success(_that);case ScoresHomeEmpty() when empty != null:
return empty(_that);case ScoresHomeFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScoresHomeInitial value)  initial,required TResult Function( ScoresHomeLoading value)  loading,required TResult Function( ScoresHomeSuccess value)  success,required TResult Function( ScoresHomeEmpty value)  empty,required TResult Function( ScoresHomeFailure value)  failure,}){
final _that = this;
switch (_that) {
case ScoresHomeInitial():
return initial(_that);case ScoresHomeLoading():
return loading(_that);case ScoresHomeSuccess():
return success(_that);case ScoresHomeEmpty():
return empty(_that);case ScoresHomeFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScoresHomeInitial value)?  initial,TResult? Function( ScoresHomeLoading value)?  loading,TResult? Function( ScoresHomeSuccess value)?  success,TResult? Function( ScoresHomeEmpty value)?  empty,TResult? Function( ScoresHomeFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ScoresHomeInitial() when initial != null:
return initial(_that);case ScoresHomeLoading() when loading != null:
return loading(_that);case ScoresHomeSuccess() when success != null:
return success(_that);case ScoresHomeEmpty() when empty != null:
return empty(_that);case ScoresHomeFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<HomeScoreCard> cards)?  success,TResult Function()?  empty,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScoresHomeInitial() when initial != null:
return initial();case ScoresHomeLoading() when loading != null:
return loading();case ScoresHomeSuccess() when success != null:
return success(_that.cards);case ScoresHomeEmpty() when empty != null:
return empty();case ScoresHomeFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<HomeScoreCard> cards)  success,required TResult Function()  empty,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case ScoresHomeInitial():
return initial();case ScoresHomeLoading():
return loading();case ScoresHomeSuccess():
return success(_that.cards);case ScoresHomeEmpty():
return empty();case ScoresHomeFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<HomeScoreCard> cards)?  success,TResult? Function()?  empty,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case ScoresHomeInitial() when initial != null:
return initial();case ScoresHomeLoading() when loading != null:
return loading();case ScoresHomeSuccess() when success != null:
return success(_that.cards);case ScoresHomeEmpty() when empty != null:
return empty();case ScoresHomeFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ScoresHomeInitial implements ScoresHomeState {
  const ScoresHomeInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoresHomeInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoresHomeState.initial()';
}


}




/// @nodoc


class ScoresHomeLoading implements ScoresHomeState {
  const ScoresHomeLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoresHomeLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoresHomeState.loading()';
}


}




/// @nodoc


class ScoresHomeSuccess implements ScoresHomeState {
  const ScoresHomeSuccess({required final  List<HomeScoreCard> cards}): _cards = cards;
  

 final  List<HomeScoreCard> _cards;
 List<HomeScoreCard> get cards {
  if (_cards is EqualUnmodifiableListView) return _cards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cards);
}


/// Create a copy of ScoresHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoresHomeSuccessCopyWith<ScoresHomeSuccess> get copyWith => _$ScoresHomeSuccessCopyWithImpl<ScoresHomeSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoresHomeSuccess&&const DeepCollectionEquality().equals(other._cards, _cards));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cards));

@override
String toString() {
  return 'ScoresHomeState.success(cards: $cards)';
}


}

/// @nodoc
abstract mixin class $ScoresHomeSuccessCopyWith<$Res> implements $ScoresHomeStateCopyWith<$Res> {
  factory $ScoresHomeSuccessCopyWith(ScoresHomeSuccess value, $Res Function(ScoresHomeSuccess) _then) = _$ScoresHomeSuccessCopyWithImpl;
@useResult
$Res call({
 List<HomeScoreCard> cards
});




}
/// @nodoc
class _$ScoresHomeSuccessCopyWithImpl<$Res>
    implements $ScoresHomeSuccessCopyWith<$Res> {
  _$ScoresHomeSuccessCopyWithImpl(this._self, this._then);

  final ScoresHomeSuccess _self;
  final $Res Function(ScoresHomeSuccess) _then;

/// Create a copy of ScoresHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? cards = null,}) {
  return _then(ScoresHomeSuccess(
cards: null == cards ? _self._cards : cards // ignore: cast_nullable_to_non_nullable
as List<HomeScoreCard>,
  ));
}


}

/// @nodoc


class ScoresHomeEmpty implements ScoresHomeState {
  const ScoresHomeEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoresHomeEmpty);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoresHomeState.empty()';
}


}




/// @nodoc


class ScoresHomeFailure implements ScoresHomeState {
  const ScoresHomeFailure({required this.failure});
  

 final  Failure failure;

/// Create a copy of ScoresHomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoresHomeFailureCopyWith<ScoresHomeFailure> get copyWith => _$ScoresHomeFailureCopyWithImpl<ScoresHomeFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoresHomeFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ScoresHomeState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ScoresHomeFailureCopyWith<$Res> implements $ScoresHomeStateCopyWith<$Res> {
  factory $ScoresHomeFailureCopyWith(ScoresHomeFailure value, $Res Function(ScoresHomeFailure) _then) = _$ScoresHomeFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ScoresHomeFailureCopyWithImpl<$Res>
    implements $ScoresHomeFailureCopyWith<$Res> {
  _$ScoresHomeFailureCopyWithImpl(this._self, this._then);

  final ScoresHomeFailure _self;
  final $Res Function(ScoresHomeFailure) _then;

/// Create a copy of ScoresHomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ScoresHomeFailure(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on

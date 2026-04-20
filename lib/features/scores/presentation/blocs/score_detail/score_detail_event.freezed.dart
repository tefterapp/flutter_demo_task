// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScoreDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoreDetailEvent()';
}


}

/// @nodoc
class $ScoreDetailEventCopyWith<$Res>  {
$ScoreDetailEventCopyWith(ScoreDetailEvent _, $Res Function(ScoreDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ScoreDetailEvent].
extension ScoreDetailEventPatterns on ScoreDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScoreDetailStarted value)?  started,TResult Function( ScoreDetailRefreshed value)?  refreshed,TResult Function( ScoreDetailTimeframeChanged value)?  timeframeChanged,TResult Function( ScoreDetailDateChanged value)?  dateChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScoreDetailStarted() when started != null:
return started(_that);case ScoreDetailRefreshed() when refreshed != null:
return refreshed(_that);case ScoreDetailTimeframeChanged() when timeframeChanged != null:
return timeframeChanged(_that);case ScoreDetailDateChanged() when dateChanged != null:
return dateChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScoreDetailStarted value)  started,required TResult Function( ScoreDetailRefreshed value)  refreshed,required TResult Function( ScoreDetailTimeframeChanged value)  timeframeChanged,required TResult Function( ScoreDetailDateChanged value)  dateChanged,}){
final _that = this;
switch (_that) {
case ScoreDetailStarted():
return started(_that);case ScoreDetailRefreshed():
return refreshed(_that);case ScoreDetailTimeframeChanged():
return timeframeChanged(_that);case ScoreDetailDateChanged():
return dateChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScoreDetailStarted value)?  started,TResult? Function( ScoreDetailRefreshed value)?  refreshed,TResult? Function( ScoreDetailTimeframeChanged value)?  timeframeChanged,TResult? Function( ScoreDetailDateChanged value)?  dateChanged,}){
final _that = this;
switch (_that) {
case ScoreDetailStarted() when started != null:
return started(_that);case ScoreDetailRefreshed() when refreshed != null:
return refreshed(_that);case ScoreDetailTimeframeChanged() when timeframeChanged != null:
return timeframeChanged(_that);case ScoreDetailDateChanged() when dateChanged != null:
return dateChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ScoreSummary summary)?  started,TResult Function()?  refreshed,TResult Function( Timeframe timeframe)?  timeframeChanged,TResult Function( DateTime date)?  dateChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScoreDetailStarted() when started != null:
return started(_that.summary);case ScoreDetailRefreshed() when refreshed != null:
return refreshed();case ScoreDetailTimeframeChanged() when timeframeChanged != null:
return timeframeChanged(_that.timeframe);case ScoreDetailDateChanged() when dateChanged != null:
return dateChanged(_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ScoreSummary summary)  started,required TResult Function()  refreshed,required TResult Function( Timeframe timeframe)  timeframeChanged,required TResult Function( DateTime date)  dateChanged,}) {final _that = this;
switch (_that) {
case ScoreDetailStarted():
return started(_that.summary);case ScoreDetailRefreshed():
return refreshed();case ScoreDetailTimeframeChanged():
return timeframeChanged(_that.timeframe);case ScoreDetailDateChanged():
return dateChanged(_that.date);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ScoreSummary summary)?  started,TResult? Function()?  refreshed,TResult? Function( Timeframe timeframe)?  timeframeChanged,TResult? Function( DateTime date)?  dateChanged,}) {final _that = this;
switch (_that) {
case ScoreDetailStarted() when started != null:
return started(_that.summary);case ScoreDetailRefreshed() when refreshed != null:
return refreshed();case ScoreDetailTimeframeChanged() when timeframeChanged != null:
return timeframeChanged(_that.timeframe);case ScoreDetailDateChanged() when dateChanged != null:
return dateChanged(_that.date);case _:
  return null;

}
}

}

/// @nodoc


class ScoreDetailStarted implements ScoreDetailEvent {
  const ScoreDetailStarted(this.summary);
  

 final  ScoreSummary summary;

/// Create a copy of ScoreDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDetailStartedCopyWith<ScoreDetailStarted> get copyWith => _$ScoreDetailStartedCopyWithImpl<ScoreDetailStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailStarted&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode => Object.hash(runtimeType,summary);

@override
String toString() {
  return 'ScoreDetailEvent.started(summary: $summary)';
}


}

/// @nodoc
abstract mixin class $ScoreDetailStartedCopyWith<$Res> implements $ScoreDetailEventCopyWith<$Res> {
  factory $ScoreDetailStartedCopyWith(ScoreDetailStarted value, $Res Function(ScoreDetailStarted) _then) = _$ScoreDetailStartedCopyWithImpl;
@useResult
$Res call({
 ScoreSummary summary
});




}
/// @nodoc
class _$ScoreDetailStartedCopyWithImpl<$Res>
    implements $ScoreDetailStartedCopyWith<$Res> {
  _$ScoreDetailStartedCopyWithImpl(this._self, this._then);

  final ScoreDetailStarted _self;
  final $Res Function(ScoreDetailStarted) _then;

/// Create a copy of ScoreDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? summary = null,}) {
  return _then(ScoreDetailStarted(
null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ScoreSummary,
  ));
}


}

/// @nodoc


class ScoreDetailRefreshed implements ScoreDetailEvent {
  const ScoreDetailRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ScoreDetailEvent.refreshed()';
}


}




/// @nodoc


class ScoreDetailTimeframeChanged implements ScoreDetailEvent {
  const ScoreDetailTimeframeChanged(this.timeframe);
  

 final  Timeframe timeframe;

/// Create a copy of ScoreDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDetailTimeframeChangedCopyWith<ScoreDetailTimeframeChanged> get copyWith => _$ScoreDetailTimeframeChangedCopyWithImpl<ScoreDetailTimeframeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailTimeframeChanged&&(identical(other.timeframe, timeframe) || other.timeframe == timeframe));
}


@override
int get hashCode => Object.hash(runtimeType,timeframe);

@override
String toString() {
  return 'ScoreDetailEvent.timeframeChanged(timeframe: $timeframe)';
}


}

/// @nodoc
abstract mixin class $ScoreDetailTimeframeChangedCopyWith<$Res> implements $ScoreDetailEventCopyWith<$Res> {
  factory $ScoreDetailTimeframeChangedCopyWith(ScoreDetailTimeframeChanged value, $Res Function(ScoreDetailTimeframeChanged) _then) = _$ScoreDetailTimeframeChangedCopyWithImpl;
@useResult
$Res call({
 Timeframe timeframe
});




}
/// @nodoc
class _$ScoreDetailTimeframeChangedCopyWithImpl<$Res>
    implements $ScoreDetailTimeframeChangedCopyWith<$Res> {
  _$ScoreDetailTimeframeChangedCopyWithImpl(this._self, this._then);

  final ScoreDetailTimeframeChanged _self;
  final $Res Function(ScoreDetailTimeframeChanged) _then;

/// Create a copy of ScoreDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timeframe = null,}) {
  return _then(ScoreDetailTimeframeChanged(
null == timeframe ? _self.timeframe : timeframe // ignore: cast_nullable_to_non_nullable
as Timeframe,
  ));
}


}

/// @nodoc


class ScoreDetailDateChanged implements ScoreDetailEvent {
  const ScoreDetailDateChanged(this.date);
  

 final  DateTime date;

/// Create a copy of ScoreDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDetailDateChangedCopyWith<ScoreDetailDateChanged> get copyWith => _$ScoreDetailDateChangedCopyWithImpl<ScoreDetailDateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailDateChanged&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'ScoreDetailEvent.dateChanged(date: $date)';
}


}

/// @nodoc
abstract mixin class $ScoreDetailDateChangedCopyWith<$Res> implements $ScoreDetailEventCopyWith<$Res> {
  factory $ScoreDetailDateChangedCopyWith(ScoreDetailDateChanged value, $Res Function(ScoreDetailDateChanged) _then) = _$ScoreDetailDateChangedCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$ScoreDetailDateChangedCopyWithImpl<$Res>
    implements $ScoreDetailDateChangedCopyWith<$Res> {
  _$ScoreDetailDateChangedCopyWithImpl(this._self, this._then);

  final ScoreDetailDateChanged _self;
  final $Res Function(ScoreDetailDateChanged) _then;

/// Create a copy of ScoreDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(ScoreDetailDateChanged(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScoreDetailState {

 ScoreSummary get summary; Timeframe get timeframe; DateTime get selectedDate;
/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDetailStateCopyWith<ScoreDetailState> get copyWith => _$ScoreDetailStateCopyWithImpl<ScoreDetailState>(this as ScoreDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailState&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.timeframe, timeframe) || other.timeframe == timeframe)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,summary,timeframe,selectedDate);

@override
String toString() {
  return 'ScoreDetailState(summary: $summary, timeframe: $timeframe, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class $ScoreDetailStateCopyWith<$Res>  {
  factory $ScoreDetailStateCopyWith(ScoreDetailState value, $Res Function(ScoreDetailState) _then) = _$ScoreDetailStateCopyWithImpl;
@useResult
$Res call({
 ScoreSummary summary, Timeframe timeframe, DateTime selectedDate
});




}
/// @nodoc
class _$ScoreDetailStateCopyWithImpl<$Res>
    implements $ScoreDetailStateCopyWith<$Res> {
  _$ScoreDetailStateCopyWithImpl(this._self, this._then);

  final ScoreDetailState _self;
  final $Res Function(ScoreDetailState) _then;

/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? timeframe = null,Object? selectedDate = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ScoreSummary,timeframe: null == timeframe ? _self.timeframe : timeframe // ignore: cast_nullable_to_non_nullable
as Timeframe,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoreDetailState].
extension ScoreDetailStatePatterns on ScoreDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ScoreDetailInitial value)?  initial,TResult Function( ScoreDetailLoading value)?  loading,TResult Function( ScoreDetailSuccess value)?  success,TResult Function( ScoreDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ScoreDetailInitial() when initial != null:
return initial(_that);case ScoreDetailLoading() when loading != null:
return loading(_that);case ScoreDetailSuccess() when success != null:
return success(_that);case ScoreDetailFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ScoreDetailInitial value)  initial,required TResult Function( ScoreDetailLoading value)  loading,required TResult Function( ScoreDetailSuccess value)  success,required TResult Function( ScoreDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case ScoreDetailInitial():
return initial(_that);case ScoreDetailLoading():
return loading(_that);case ScoreDetailSuccess():
return success(_that);case ScoreDetailFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ScoreDetailInitial value)?  initial,TResult? Function( ScoreDetailLoading value)?  loading,TResult? Function( ScoreDetailSuccess value)?  success,TResult? Function( ScoreDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ScoreDetailInitial() when initial != null:
return initial(_that);case ScoreDetailLoading() when loading != null:
return loading(_that);case ScoreDetailSuccess() when success != null:
return success(_that);case ScoreDetailFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate)?  initial,TResult Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate)?  loading,TResult Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate,  ScoreDetail detail,  bool isEmpty,  List<ScoreDetail> siblingDetails)?  success,TResult Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate,  Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ScoreDetailInitial() when initial != null:
return initial(_that.summary,_that.timeframe,_that.selectedDate);case ScoreDetailLoading() when loading != null:
return loading(_that.summary,_that.timeframe,_that.selectedDate);case ScoreDetailSuccess() when success != null:
return success(_that.summary,_that.timeframe,_that.selectedDate,_that.detail,_that.isEmpty,_that.siblingDetails);case ScoreDetailFailure() when failure != null:
return failure(_that.summary,_that.timeframe,_that.selectedDate,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate)  initial,required TResult Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate)  loading,required TResult Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate,  ScoreDetail detail,  bool isEmpty,  List<ScoreDetail> siblingDetails)  success,required TResult Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate,  Failure failure)  failure,}) {final _that = this;
switch (_that) {
case ScoreDetailInitial():
return initial(_that.summary,_that.timeframe,_that.selectedDate);case ScoreDetailLoading():
return loading(_that.summary,_that.timeframe,_that.selectedDate);case ScoreDetailSuccess():
return success(_that.summary,_that.timeframe,_that.selectedDate,_that.detail,_that.isEmpty,_that.siblingDetails);case ScoreDetailFailure():
return failure(_that.summary,_that.timeframe,_that.selectedDate,_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate)?  initial,TResult? Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate)?  loading,TResult? Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate,  ScoreDetail detail,  bool isEmpty,  List<ScoreDetail> siblingDetails)?  success,TResult? Function( ScoreSummary summary,  Timeframe timeframe,  DateTime selectedDate,  Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case ScoreDetailInitial() when initial != null:
return initial(_that.summary,_that.timeframe,_that.selectedDate);case ScoreDetailLoading() when loading != null:
return loading(_that.summary,_that.timeframe,_that.selectedDate);case ScoreDetailSuccess() when success != null:
return success(_that.summary,_that.timeframe,_that.selectedDate,_that.detail,_that.isEmpty,_that.siblingDetails);case ScoreDetailFailure() when failure != null:
return failure(_that.summary,_that.timeframe,_that.selectedDate,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ScoreDetailInitial implements ScoreDetailState {
  const ScoreDetailInitial({required this.summary, required this.timeframe, required this.selectedDate});
  

@override final  ScoreSummary summary;
@override final  Timeframe timeframe;
@override final  DateTime selectedDate;

/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDetailInitialCopyWith<ScoreDetailInitial> get copyWith => _$ScoreDetailInitialCopyWithImpl<ScoreDetailInitial>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailInitial&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.timeframe, timeframe) || other.timeframe == timeframe)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,summary,timeframe,selectedDate);

@override
String toString() {
  return 'ScoreDetailState.initial(summary: $summary, timeframe: $timeframe, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class $ScoreDetailInitialCopyWith<$Res> implements $ScoreDetailStateCopyWith<$Res> {
  factory $ScoreDetailInitialCopyWith(ScoreDetailInitial value, $Res Function(ScoreDetailInitial) _then) = _$ScoreDetailInitialCopyWithImpl;
@override @useResult
$Res call({
 ScoreSummary summary, Timeframe timeframe, DateTime selectedDate
});




}
/// @nodoc
class _$ScoreDetailInitialCopyWithImpl<$Res>
    implements $ScoreDetailInitialCopyWith<$Res> {
  _$ScoreDetailInitialCopyWithImpl(this._self, this._then);

  final ScoreDetailInitial _self;
  final $Res Function(ScoreDetailInitial) _then;

/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? timeframe = null,Object? selectedDate = null,}) {
  return _then(ScoreDetailInitial(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ScoreSummary,timeframe: null == timeframe ? _self.timeframe : timeframe // ignore: cast_nullable_to_non_nullable
as Timeframe,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ScoreDetailLoading implements ScoreDetailState {
  const ScoreDetailLoading({required this.summary, required this.timeframe, required this.selectedDate});
  

@override final  ScoreSummary summary;
@override final  Timeframe timeframe;
@override final  DateTime selectedDate;

/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDetailLoadingCopyWith<ScoreDetailLoading> get copyWith => _$ScoreDetailLoadingCopyWithImpl<ScoreDetailLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailLoading&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.timeframe, timeframe) || other.timeframe == timeframe)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,summary,timeframe,selectedDate);

@override
String toString() {
  return 'ScoreDetailState.loading(summary: $summary, timeframe: $timeframe, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class $ScoreDetailLoadingCopyWith<$Res> implements $ScoreDetailStateCopyWith<$Res> {
  factory $ScoreDetailLoadingCopyWith(ScoreDetailLoading value, $Res Function(ScoreDetailLoading) _then) = _$ScoreDetailLoadingCopyWithImpl;
@override @useResult
$Res call({
 ScoreSummary summary, Timeframe timeframe, DateTime selectedDate
});




}
/// @nodoc
class _$ScoreDetailLoadingCopyWithImpl<$Res>
    implements $ScoreDetailLoadingCopyWith<$Res> {
  _$ScoreDetailLoadingCopyWithImpl(this._self, this._then);

  final ScoreDetailLoading _self;
  final $Res Function(ScoreDetailLoading) _then;

/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? timeframe = null,Object? selectedDate = null,}) {
  return _then(ScoreDetailLoading(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ScoreSummary,timeframe: null == timeframe ? _self.timeframe : timeframe // ignore: cast_nullable_to_non_nullable
as Timeframe,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ScoreDetailSuccess implements ScoreDetailState {
  const ScoreDetailSuccess({required this.summary, required this.timeframe, required this.selectedDate, required this.detail, required this.isEmpty, final  List<ScoreDetail> siblingDetails = const <ScoreDetail>[]}): _siblingDetails = siblingDetails;
  

@override final  ScoreSummary summary;
@override final  Timeframe timeframe;
@override final  DateTime selectedDate;
 final  ScoreDetail detail;
 final  bool isEmpty;
 final  List<ScoreDetail> _siblingDetails;
@JsonKey() List<ScoreDetail> get siblingDetails {
  if (_siblingDetails is EqualUnmodifiableListView) return _siblingDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_siblingDetails);
}


/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDetailSuccessCopyWith<ScoreDetailSuccess> get copyWith => _$ScoreDetailSuccessCopyWithImpl<ScoreDetailSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailSuccess&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.timeframe, timeframe) || other.timeframe == timeframe)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.isEmpty, isEmpty) || other.isEmpty == isEmpty)&&const DeepCollectionEquality().equals(other._siblingDetails, _siblingDetails));
}


@override
int get hashCode => Object.hash(runtimeType,summary,timeframe,selectedDate,detail,isEmpty,const DeepCollectionEquality().hash(_siblingDetails));

@override
String toString() {
  return 'ScoreDetailState.success(summary: $summary, timeframe: $timeframe, selectedDate: $selectedDate, detail: $detail, isEmpty: $isEmpty, siblingDetails: $siblingDetails)';
}


}

/// @nodoc
abstract mixin class $ScoreDetailSuccessCopyWith<$Res> implements $ScoreDetailStateCopyWith<$Res> {
  factory $ScoreDetailSuccessCopyWith(ScoreDetailSuccess value, $Res Function(ScoreDetailSuccess) _then) = _$ScoreDetailSuccessCopyWithImpl;
@override @useResult
$Res call({
 ScoreSummary summary, Timeframe timeframe, DateTime selectedDate, ScoreDetail detail, bool isEmpty, List<ScoreDetail> siblingDetails
});




}
/// @nodoc
class _$ScoreDetailSuccessCopyWithImpl<$Res>
    implements $ScoreDetailSuccessCopyWith<$Res> {
  _$ScoreDetailSuccessCopyWithImpl(this._self, this._then);

  final ScoreDetailSuccess _self;
  final $Res Function(ScoreDetailSuccess) _then;

/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? timeframe = null,Object? selectedDate = null,Object? detail = null,Object? isEmpty = null,Object? siblingDetails = null,}) {
  return _then(ScoreDetailSuccess(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ScoreSummary,timeframe: null == timeframe ? _self.timeframe : timeframe // ignore: cast_nullable_to_non_nullable
as Timeframe,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,detail: null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as ScoreDetail,isEmpty: null == isEmpty ? _self.isEmpty : isEmpty // ignore: cast_nullable_to_non_nullable
as bool,siblingDetails: null == siblingDetails ? _self._siblingDetails : siblingDetails // ignore: cast_nullable_to_non_nullable
as List<ScoreDetail>,
  ));
}


}

/// @nodoc


class ScoreDetailFailure implements ScoreDetailState {
  const ScoreDetailFailure({required this.summary, required this.timeframe, required this.selectedDate, required this.failure});
  

@override final  ScoreSummary summary;
@override final  Timeframe timeframe;
@override final  DateTime selectedDate;
 final  Failure failure;

/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreDetailFailureCopyWith<ScoreDetailFailure> get copyWith => _$ScoreDetailFailureCopyWithImpl<ScoreDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreDetailFailure&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.timeframe, timeframe) || other.timeframe == timeframe)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,summary,timeframe,selectedDate,failure);

@override
String toString() {
  return 'ScoreDetailState.failure(summary: $summary, timeframe: $timeframe, selectedDate: $selectedDate, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ScoreDetailFailureCopyWith<$Res> implements $ScoreDetailStateCopyWith<$Res> {
  factory $ScoreDetailFailureCopyWith(ScoreDetailFailure value, $Res Function(ScoreDetailFailure) _then) = _$ScoreDetailFailureCopyWithImpl;
@override @useResult
$Res call({
 ScoreSummary summary, Timeframe timeframe, DateTime selectedDate, Failure failure
});




}
/// @nodoc
class _$ScoreDetailFailureCopyWithImpl<$Res>
    implements $ScoreDetailFailureCopyWith<$Res> {
  _$ScoreDetailFailureCopyWithImpl(this._self, this._then);

  final ScoreDetailFailure _self;
  final $Res Function(ScoreDetailFailure) _then;

/// Create a copy of ScoreDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? timeframe = null,Object? selectedDate = null,Object? failure = null,}) {
  return _then(ScoreDetailFailure(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ScoreSummary,timeframe: null == timeframe ? _self.timeframe : timeframe // ignore: cast_nullable_to_non_nullable
as Timeframe,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on

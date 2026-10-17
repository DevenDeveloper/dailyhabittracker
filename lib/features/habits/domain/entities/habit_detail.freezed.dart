// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayStatus {

 DateTime get date; bool get isDone;
/// Create a copy of DayStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayStatusCopyWith<DayStatus> get copyWith => _$DayStatusCopyWithImpl<DayStatus>(this as DayStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DayStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayStatus&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.isDone, _this.isDone) || other.isDone == _this.isDone));
}


@override
int get hashCode {
  final _this = this as DayStatus;
  return Object.hash(runtimeType,_this.date,_this.isDone);
}

@override
String toString() {
  final _this = this as DayStatus;
  return 'DayStatus(date: ${_this.date}, isDone: ${_this.isDone})';
}


}

/// @nodoc
abstract mixin class $DayStatusCopyWith<$Res>  {
  factory $DayStatusCopyWith(DayStatus value, $Res Function(DayStatus) _then) = _$DayStatusCopyWithImpl;
@useResult
$Res call({
 DateTime date, bool isDone
});




}
/// @nodoc
class _$DayStatusCopyWithImpl<$Res>
    implements $DayStatusCopyWith<$Res> {
  _$DayStatusCopyWithImpl(this._self, this._then);

  final DayStatus _self;
  final $Res Function(DayStatus) _then;

/// Create a copy of DayStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? isDone = null,}) {
  return _then(DayStatus(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DayStatus].
extension DayStatusPatterns on DayStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayStatus value)  $default,){
final _that = this;
switch (_that) {
case _DayStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayStatus value)?  $default,){
final _that = this;
switch (_that) {
case _DayStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  bool isDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayStatus() when $default != null:
return $default(_that.date,_that.isDone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  bool isDone)  $default,) {final _that = this;
switch (_that) {
case _DayStatus():
return $default(_that.date,_that.isDone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  bool isDone)?  $default,) {final _that = this;
switch (_that) {
case _DayStatus() when $default != null:
return $default(_that.date,_that.isDone);case _:
  return null;

}
}

}

/// @nodoc


class _DayStatus implements DayStatus {
  const _DayStatus({required this.date, required this.isDone});
  

@override final  DateTime date;
@override final  bool isDone;

/// Create a copy of DayStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayStatusCopyWith<_DayStatus> get copyWith => __$DayStatusCopyWithImpl<_DayStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayStatus&&(identical(other.date, date) || other.date == date)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,isDone);
}

@override
String toString() {
    return 'DayStatus(date: $date, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class _$DayStatusCopyWith<$Res> implements $DayStatusCopyWith<$Res> {
  factory _$DayStatusCopyWith(_DayStatus value, $Res Function(_DayStatus) _then) = __$DayStatusCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, bool isDone
});




}
/// @nodoc
class __$DayStatusCopyWithImpl<$Res>
    implements _$DayStatusCopyWith<$Res> {
  __$DayStatusCopyWithImpl(this._self, this._then);

  final _DayStatus _self;
  final $Res Function(_DayStatus) _then;

/// Create a copy of DayStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? isDone = null,}) {
  return _then(_DayStatus(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$HabitDetail {

 Habit get habit;/// Last 7 days, oldest first; the last item is today.
 List<DayStatus> get last7Days; int get doneInLast7; int get currentStreak;
/// Create a copy of HabitDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitDetailCopyWith<HabitDetail> get copyWith => _$HabitDetailCopyWithImpl<HabitDetail>(this as HabitDetail, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as HabitDetail;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitDetail&&(identical(other.habit, _this.habit) || other.habit == _this.habit)&&const DeepCollectionEquality().equals(other.last7Days, _this.last7Days)&&(identical(other.doneInLast7, _this.doneInLast7) || other.doneInLast7 == _this.doneInLast7)&&(identical(other.currentStreak, _this.currentStreak) || other.currentStreak == _this.currentStreak));
}


@override
int get hashCode {
  final _this = this as HabitDetail;
  return Object.hash(runtimeType,_this.habit,const DeepCollectionEquality().hash(_this.last7Days),_this.doneInLast7,_this.currentStreak);
}

@override
String toString() {
  final _this = this as HabitDetail;
  return 'HabitDetail(habit: ${_this.habit}, last7Days: ${_this.last7Days}, doneInLast7: ${_this.doneInLast7}, currentStreak: ${_this.currentStreak})';
}


}

/// @nodoc
abstract mixin class $HabitDetailCopyWith<$Res>  {
  factory $HabitDetailCopyWith(HabitDetail value, $Res Function(HabitDetail) _then) = _$HabitDetailCopyWithImpl;
@useResult
$Res call({
 Habit habit, List<DayStatus> last7Days, int doneInLast7, int currentStreak
});


$HabitCopyWith<$Res> get habit;

}
/// @nodoc
class _$HabitDetailCopyWithImpl<$Res>
    implements $HabitDetailCopyWith<$Res> {
  _$HabitDetailCopyWithImpl(this._self, this._then);

  final HabitDetail _self;
  final $Res Function(HabitDetail) _then;

/// Create a copy of HabitDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? habit = null,Object? last7Days = null,Object? doneInLast7 = null,Object? currentStreak = null,}) {
  return _then(HabitDetail(
habit: null == habit ? _self.habit : habit // ignore: cast_nullable_to_non_nullable
as Habit,last7Days: null == last7Days ? _self.last7Days : last7Days // ignore: cast_nullable_to_non_nullable
as List<DayStatus>,doneInLast7: null == doneInLast7 ? _self.doneInLast7 : doneInLast7 // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of HabitDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get habit {
  
  return $HabitCopyWith<$Res>(_self.habit, (value) {
    return _then(_self.copyWith(habit: value));
  });
}
}


/// Adds pattern-matching-related methods to [HabitDetail].
extension HabitDetailPatterns on HabitDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitDetail value)  $default,){
final _that = this;
switch (_that) {
case _HabitDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitDetail value)?  $default,){
final _that = this;
switch (_that) {
case _HabitDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Habit habit,  List<DayStatus> last7Days,  int doneInLast7,  int currentStreak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitDetail() when $default != null:
return $default(_that.habit,_that.last7Days,_that.doneInLast7,_that.currentStreak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Habit habit,  List<DayStatus> last7Days,  int doneInLast7,  int currentStreak)  $default,) {final _that = this;
switch (_that) {
case _HabitDetail():
return $default(_that.habit,_that.last7Days,_that.doneInLast7,_that.currentStreak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Habit habit,  List<DayStatus> last7Days,  int doneInLast7,  int currentStreak)?  $default,) {final _that = this;
switch (_that) {
case _HabitDetail() when $default != null:
return $default(_that.habit,_that.last7Days,_that.doneInLast7,_that.currentStreak);case _:
  return null;

}
}

}

/// @nodoc


class _HabitDetail extends HabitDetail {
  const _HabitDetail({required this.habit, required  List<DayStatus> last7Days, required this.doneInLast7, required this.currentStreak}): _last7Days = last7Days,super._();
  

@override final  Habit habit;
/// Last 7 days, oldest first; the last item is today.
 final  List<DayStatus> _last7Days;
/// Last 7 days, oldest first; the last item is today.
@override List<DayStatus> get last7Days {
  if (_last7Days is EqualUnmodifiableListView) return _last7Days;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_last7Days);
}

@override final  int doneInLast7;
@override final  int currentStreak;

/// Create a copy of HabitDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitDetailCopyWith<_HabitDetail> get copyWith => __$HabitDetailCopyWithImpl<_HabitDetail>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitDetail&&(identical(other.habit, habit) || other.habit == habit)&&const DeepCollectionEquality().equals(other.last7Days, _last7Days)&&(identical(other.doneInLast7, doneInLast7) || other.doneInLast7 == doneInLast7)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak));
}


@override
int get hashCode {
    return Object.hash(runtimeType,habit,const DeepCollectionEquality().hash(_last7Days),doneInLast7,currentStreak);
}

@override
String toString() {
    return 'HabitDetail(habit: $habit, last7Days: $last7Days, doneInLast7: $doneInLast7, currentStreak: $currentStreak)';
}


}

/// @nodoc
abstract mixin class _$HabitDetailCopyWith<$Res> implements $HabitDetailCopyWith<$Res> {
  factory _$HabitDetailCopyWith(_HabitDetail value, $Res Function(_HabitDetail) _then) = __$HabitDetailCopyWithImpl;
@override @useResult
$Res call({
 Habit habit, List<DayStatus> last7Days, int doneInLast7, int currentStreak
});


@override $HabitCopyWith<$Res> get habit;

}
/// @nodoc
class __$HabitDetailCopyWithImpl<$Res>
    implements _$HabitDetailCopyWith<$Res> {
  __$HabitDetailCopyWithImpl(this._self, this._then);

  final _HabitDetail _self;
  final $Res Function(_HabitDetail) _then;

/// Create a copy of HabitDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? habit = null,Object? last7Days = null,Object? doneInLast7 = null,Object? currentStreak = null,}) {
  return _then(_HabitDetail(
habit: null == habit ? _self.habit : habit // ignore: cast_nullable_to_non_nullable
as Habit,last7Days: null == last7Days ? _self._last7Days : last7Days // ignore: cast_nullable_to_non_nullable
as List<DayStatus>,doneInLast7: null == doneInLast7 ? _self.doneInLast7 : doneInLast7 // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of HabitDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get habit {
  
  return $HabitCopyWith<$Res>(_self.habit, (value) {
    return _then(_self.copyWith(habit: value));
  });
}
}

// dart format on

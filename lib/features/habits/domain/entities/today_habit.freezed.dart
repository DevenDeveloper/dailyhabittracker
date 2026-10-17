// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodayHabit {

 Habit get habit; bool get isDone;
/// Create a copy of TodayHabit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayHabitCopyWith<TodayHabit> get copyWith => _$TodayHabitCopyWithImpl<TodayHabit>(this as TodayHabit, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TodayHabit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayHabit&&(identical(other.habit, _this.habit) || other.habit == _this.habit)&&(identical(other.isDone, _this.isDone) || other.isDone == _this.isDone));
}


@override
int get hashCode {
  final _this = this as TodayHabit;
  return Object.hash(runtimeType,_this.habit,_this.isDone);
}

@override
String toString() {
  final _this = this as TodayHabit;
  return 'TodayHabit(habit: ${_this.habit}, isDone: ${_this.isDone})';
}


}

/// @nodoc
abstract mixin class $TodayHabitCopyWith<$Res>  {
  factory $TodayHabitCopyWith(TodayHabit value, $Res Function(TodayHabit) _then) = _$TodayHabitCopyWithImpl;
@useResult
$Res call({
 Habit habit, bool isDone
});


$HabitCopyWith<$Res> get habit;

}
/// @nodoc
class _$TodayHabitCopyWithImpl<$Res>
    implements $TodayHabitCopyWith<$Res> {
  _$TodayHabitCopyWithImpl(this._self, this._then);

  final TodayHabit _self;
  final $Res Function(TodayHabit) _then;

/// Create a copy of TodayHabit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? habit = null,Object? isDone = null,}) {
  return _then(TodayHabit(
habit: null == habit ? _self.habit : habit // ignore: cast_nullable_to_non_nullable
as Habit,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TodayHabit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get habit {
  
  return $HabitCopyWith<$Res>(_self.habit, (value) {
    return _then(_self.copyWith(habit: value));
  });
}
}


/// Adds pattern-matching-related methods to [TodayHabit].
extension TodayHabitPatterns on TodayHabit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayHabit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayHabit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayHabit value)  $default,){
final _that = this;
switch (_that) {
case _TodayHabit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayHabit value)?  $default,){
final _that = this;
switch (_that) {
case _TodayHabit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Habit habit,  bool isDone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayHabit() when $default != null:
return $default(_that.habit,_that.isDone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Habit habit,  bool isDone)  $default,) {final _that = this;
switch (_that) {
case _TodayHabit():
return $default(_that.habit,_that.isDone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Habit habit,  bool isDone)?  $default,) {final _that = this;
switch (_that) {
case _TodayHabit() when $default != null:
return $default(_that.habit,_that.isDone);case _:
  return null;

}
}

}

/// @nodoc


class _TodayHabit implements TodayHabit {
  const _TodayHabit({required this.habit, required this.isDone});
  

@override final  Habit habit;
@override final  bool isDone;

/// Create a copy of TodayHabit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayHabitCopyWith<_TodayHabit> get copyWith => __$TodayHabitCopyWithImpl<_TodayHabit>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayHabit&&(identical(other.habit, habit) || other.habit == habit)&&(identical(other.isDone, isDone) || other.isDone == isDone));
}


@override
int get hashCode {
    return Object.hash(runtimeType,habit,isDone);
}

@override
String toString() {
    return 'TodayHabit(habit: $habit, isDone: $isDone)';
}


}

/// @nodoc
abstract mixin class _$TodayHabitCopyWith<$Res> implements $TodayHabitCopyWith<$Res> {
  factory _$TodayHabitCopyWith(_TodayHabit value, $Res Function(_TodayHabit) _then) = __$TodayHabitCopyWithImpl;
@override @useResult
$Res call({
 Habit habit, bool isDone
});


@override $HabitCopyWith<$Res> get habit;

}
/// @nodoc
class __$TodayHabitCopyWithImpl<$Res>
    implements _$TodayHabitCopyWith<$Res> {
  __$TodayHabitCopyWithImpl(this._self, this._then);

  final _TodayHabit _self;
  final $Res Function(_TodayHabit) _then;

/// Create a copy of TodayHabit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? habit = null,Object? isDone = null,}) {
  return _then(_TodayHabit(
habit: null == habit ? _self.habit : habit // ignore: cast_nullable_to_non_nullable
as Habit,isDone: null == isDone ? _self.isDone : isDone // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TodayHabit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitCopyWith<$Res> get habit {
  
  return $HabitCopyWith<$Res>(_self.habit, (value) {
    return _then(_self.copyWith(habit: value));
  });
}
}

/// @nodoc
mixin _$TodaySummary {

 List<TodayHabit> get habits; int get earnedPoints; int get totalPoints; int get doneCount;
/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodaySummaryCopyWith<TodaySummary> get copyWith => _$TodaySummaryCopyWithImpl<TodaySummary>(this as TodaySummary, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TodaySummary;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodaySummary&&const DeepCollectionEquality().equals(other.habits, _this.habits)&&(identical(other.earnedPoints, _this.earnedPoints) || other.earnedPoints == _this.earnedPoints)&&(identical(other.totalPoints, _this.totalPoints) || other.totalPoints == _this.totalPoints)&&(identical(other.doneCount, _this.doneCount) || other.doneCount == _this.doneCount));
}


@override
int get hashCode {
  final _this = this as TodaySummary;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.habits),_this.earnedPoints,_this.totalPoints,_this.doneCount);
}

@override
String toString() {
  final _this = this as TodaySummary;
  return 'TodaySummary(habits: ${_this.habits}, earnedPoints: ${_this.earnedPoints}, totalPoints: ${_this.totalPoints}, doneCount: ${_this.doneCount})';
}


}

/// @nodoc
abstract mixin class $TodaySummaryCopyWith<$Res>  {
  factory $TodaySummaryCopyWith(TodaySummary value, $Res Function(TodaySummary) _then) = _$TodaySummaryCopyWithImpl;
@useResult
$Res call({
 List<TodayHabit> habits, int earnedPoints, int totalPoints, int doneCount
});




}
/// @nodoc
class _$TodaySummaryCopyWithImpl<$Res>
    implements $TodaySummaryCopyWith<$Res> {
  _$TodaySummaryCopyWithImpl(this._self, this._then);

  final TodaySummary _self;
  final $Res Function(TodaySummary) _then;

/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? habits = null,Object? earnedPoints = null,Object? totalPoints = null,Object? doneCount = null,}) {
  return _then(TodaySummary(
habits: null == habits ? _self.habits : habits // ignore: cast_nullable_to_non_nullable
as List<TodayHabit>,earnedPoints: null == earnedPoints ? _self.earnedPoints : earnedPoints // ignore: cast_nullable_to_non_nullable
as int,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,doneCount: null == doneCount ? _self.doneCount : doneCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TodaySummary].
extension TodaySummaryPatterns on TodaySummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodaySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodaySummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodaySummary value)  $default,){
final _that = this;
switch (_that) {
case _TodaySummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodaySummary value)?  $default,){
final _that = this;
switch (_that) {
case _TodaySummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TodayHabit> habits,  int earnedPoints,  int totalPoints,  int doneCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodaySummary() when $default != null:
return $default(_that.habits,_that.earnedPoints,_that.totalPoints,_that.doneCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TodayHabit> habits,  int earnedPoints,  int totalPoints,  int doneCount)  $default,) {final _that = this;
switch (_that) {
case _TodaySummary():
return $default(_that.habits,_that.earnedPoints,_that.totalPoints,_that.doneCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TodayHabit> habits,  int earnedPoints,  int totalPoints,  int doneCount)?  $default,) {final _that = this;
switch (_that) {
case _TodaySummary() when $default != null:
return $default(_that.habits,_that.earnedPoints,_that.totalPoints,_that.doneCount);case _:
  return null;

}
}

}

/// @nodoc


class _TodaySummary implements TodaySummary {
  const _TodaySummary({required  List<TodayHabit> habits, required this.earnedPoints, required this.totalPoints, required this.doneCount}): _habits = habits;
  

 final  List<TodayHabit> _habits;
@override List<TodayHabit> get habits {
  if (_habits is EqualUnmodifiableListView) return _habits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_habits);
}

@override final  int earnedPoints;
@override final  int totalPoints;
@override final  int doneCount;

/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodaySummaryCopyWith<_TodaySummary> get copyWith => __$TodaySummaryCopyWithImpl<_TodaySummary>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodaySummary&&const DeepCollectionEquality().equals(other.habits, _habits)&&(identical(other.earnedPoints, earnedPoints) || other.earnedPoints == earnedPoints)&&(identical(other.totalPoints, totalPoints) || other.totalPoints == totalPoints)&&(identical(other.doneCount, doneCount) || other.doneCount == doneCount));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_habits),earnedPoints,totalPoints,doneCount);
}

@override
String toString() {
    return 'TodaySummary(habits: $habits, earnedPoints: $earnedPoints, totalPoints: $totalPoints, doneCount: $doneCount)';
}


}

/// @nodoc
abstract mixin class _$TodaySummaryCopyWith<$Res> implements $TodaySummaryCopyWith<$Res> {
  factory _$TodaySummaryCopyWith(_TodaySummary value, $Res Function(_TodaySummary) _then) = __$TodaySummaryCopyWithImpl;
@override @useResult
$Res call({
 List<TodayHabit> habits, int earnedPoints, int totalPoints, int doneCount
});




}
/// @nodoc
class __$TodaySummaryCopyWithImpl<$Res>
    implements _$TodaySummaryCopyWith<$Res> {
  __$TodaySummaryCopyWithImpl(this._self, this._then);

  final _TodaySummary _self;
  final $Res Function(_TodaySummary) _then;

/// Create a copy of TodaySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? habits = null,Object? earnedPoints = null,Object? totalPoints = null,Object? doneCount = null,}) {
  return _then(_TodaySummary(
habits: null == habits ? _self._habits : habits // ignore: cast_nullable_to_non_nullable
as List<TodayHabit>,earnedPoints: null == earnedPoints ? _self.earnedPoints : earnedPoints // ignore: cast_nullable_to_non_nullable
as int,totalPoints: null == totalPoints ? _self.totalPoints : totalPoints // ignore: cast_nullable_to_non_nullable
as int,doneCount: null == doneCount ? _self.doneCount : doneCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

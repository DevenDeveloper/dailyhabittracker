// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HabitDetailState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HabitDetailState()';
}


}

/// @nodoc
class $HabitDetailStateCopyWith<$Res>  {
$HabitDetailStateCopyWith(HabitDetailState _, $Res Function(HabitDetailState) __);
}


/// Adds pattern-matching-related methods to [HabitDetailState].
extension HabitDetailStatePatterns on HabitDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HabitDetailLoading value)?  loading,TResult Function( HabitDetailLoaded value)?  loaded,TResult Function( HabitDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HabitDetailLoading() when loading != null:
return loading(_that);case HabitDetailLoaded() when loaded != null:
return loaded(_that);case HabitDetailError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HabitDetailLoading value)  loading,required TResult Function( HabitDetailLoaded value)  loaded,required TResult Function( HabitDetailError value)  error,}){
final _that = this;
switch (_that) {
case HabitDetailLoading():
return loading(_that);case HabitDetailLoaded():
return loaded(_that);case HabitDetailError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HabitDetailLoading value)?  loading,TResult? Function( HabitDetailLoaded value)?  loaded,TResult? Function( HabitDetailError value)?  error,}){
final _that = this;
switch (_that) {
case HabitDetailLoading() when loading != null:
return loading(_that);case HabitDetailLoaded() when loaded != null:
return loaded(_that);case HabitDetailError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( HabitDetail detail)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HabitDetailLoading() when loading != null:
return loading();case HabitDetailLoaded() when loaded != null:
return loaded(_that.detail);case HabitDetailError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( HabitDetail detail)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case HabitDetailLoading():
return loading();case HabitDetailLoaded():
return loaded(_that.detail);case HabitDetailError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( HabitDetail detail)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case HabitDetailLoading() when loading != null:
return loading();case HabitDetailLoaded() when loaded != null:
return loaded(_that.detail);case HabitDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class HabitDetailLoading implements HabitDetailState {
  const HabitDetailLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HabitDetailState.loading()';
}


}




/// @nodoc


class HabitDetailLoaded implements HabitDetailState {
  const HabitDetailLoaded(this.detail);
  

 final  HabitDetail detail;

/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitDetailLoadedCopyWith<HabitDetailLoaded> get copyWith => _$HabitDetailLoadedCopyWithImpl<HabitDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitDetailLoaded&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode {
    return Object.hash(runtimeType,detail);
}

@override
String toString() {
    return 'HabitDetailState.loaded(detail: $detail)';
}


}

/// @nodoc
abstract mixin class $HabitDetailLoadedCopyWith<$Res> implements $HabitDetailStateCopyWith<$Res> {
  factory $HabitDetailLoadedCopyWith(HabitDetailLoaded value, $Res Function(HabitDetailLoaded) _then) = _$HabitDetailLoadedCopyWithImpl;
@useResult
$Res call({
 HabitDetail detail
});


$HabitDetailCopyWith<$Res> get detail;

}
/// @nodoc
class _$HabitDetailLoadedCopyWithImpl<$Res>
    implements $HabitDetailLoadedCopyWith<$Res> {
  _$HabitDetailLoadedCopyWithImpl(this._self, this._then);

  final HabitDetailLoaded _self;
  final $Res Function(HabitDetailLoaded) _then;

/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(HabitDetailLoaded(
null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as HabitDetail,
  ));
}

/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HabitDetailCopyWith<$Res> get detail {
  
  return $HabitDetailCopyWith<$Res>(_self.detail, (value) {
    return _then(_self.copyWith(detail: value));
  });
}
}

/// @nodoc


class HabitDetailError implements HabitDetailState {
  const HabitDetailError(this.message);
  

 final  String message;

/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitDetailErrorCopyWith<HabitDetailError> get copyWith => _$HabitDetailErrorCopyWithImpl<HabitDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'HabitDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $HabitDetailErrorCopyWith<$Res> implements $HabitDetailStateCopyWith<$Res> {
  factory $HabitDetailErrorCopyWith(HabitDetailError value, $Res Function(HabitDetailError) _then) = _$HabitDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HabitDetailErrorCopyWithImpl<$Res>
    implements $HabitDetailErrorCopyWith<$Res> {
  _$HabitDetailErrorCopyWithImpl(this._self, this._then);

  final HabitDetailError _self;
  final $Res Function(HabitDetailError) _then;

/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HabitDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

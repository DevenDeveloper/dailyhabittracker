// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_habit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddHabitState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddHabitState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AddHabitState()';
}


}

/// @nodoc
class $AddHabitStateCopyWith<$Res>  {
$AddHabitStateCopyWith(AddHabitState _, $Res Function(AddHabitState) __);
}


/// Adds pattern-matching-related methods to [AddHabitState].
extension AddHabitStatePatterns on AddHabitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AddHabitInitial value)?  initial,TResult Function( AddHabitSubmitting value)?  submitting,TResult Function( AddHabitSuccess value)?  success,TResult Function( AddHabitError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AddHabitInitial() when initial != null:
return initial(_that);case AddHabitSubmitting() when submitting != null:
return submitting(_that);case AddHabitSuccess() when success != null:
return success(_that);case AddHabitError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AddHabitInitial value)  initial,required TResult Function( AddHabitSubmitting value)  submitting,required TResult Function( AddHabitSuccess value)  success,required TResult Function( AddHabitError value)  error,}){
final _that = this;
switch (_that) {
case AddHabitInitial():
return initial(_that);case AddHabitSubmitting():
return submitting(_that);case AddHabitSuccess():
return success(_that);case AddHabitError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AddHabitInitial value)?  initial,TResult? Function( AddHabitSubmitting value)?  submitting,TResult? Function( AddHabitSuccess value)?  success,TResult? Function( AddHabitError value)?  error,}){
final _that = this;
switch (_that) {
case AddHabitInitial() when initial != null:
return initial(_that);case AddHabitSubmitting() when submitting != null:
return submitting(_that);case AddHabitSuccess() when success != null:
return success(_that);case AddHabitError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function()?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AddHabitInitial() when initial != null:
return initial();case AddHabitSubmitting() when submitting != null:
return submitting();case AddHabitSuccess() when success != null:
return success();case AddHabitError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function()  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AddHabitInitial():
return initial();case AddHabitSubmitting():
return submitting();case AddHabitSuccess():
return success();case AddHabitError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function()?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AddHabitInitial() when initial != null:
return initial();case AddHabitSubmitting() when submitting != null:
return submitting();case AddHabitSuccess() when success != null:
return success();case AddHabitError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AddHabitInitial implements AddHabitState {
  const AddHabitInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddHabitInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AddHabitState.initial()';
}


}




/// @nodoc


class AddHabitSubmitting implements AddHabitState {
  const AddHabitSubmitting();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddHabitSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AddHabitState.submitting()';
}


}




/// @nodoc


class AddHabitSuccess implements AddHabitState {
  const AddHabitSuccess();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddHabitSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'AddHabitState.success()';
}


}




/// @nodoc


class AddHabitError implements AddHabitState {
  const AddHabitError(this.message);
  

 final  String message;

/// Create a copy of AddHabitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddHabitErrorCopyWith<AddHabitError> get copyWith => _$AddHabitErrorCopyWithImpl<AddHabitError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddHabitError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'AddHabitState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AddHabitErrorCopyWith<$Res> implements $AddHabitStateCopyWith<$Res> {
  factory $AddHabitErrorCopyWith(AddHabitError value, $Res Function(AddHabitError) _then) = _$AddHabitErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AddHabitErrorCopyWithImpl<$Res>
    implements $AddHabitErrorCopyWith<$Res> {
  _$AddHabitErrorCopyWithImpl(this._self, this._then);

  final AddHabitError _self;
  final $Res Function(AddHabitError) _then;

/// Create a copy of AddHabitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AddHabitError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodayState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TodayState()';
}


}

/// @nodoc
class $TodayStateCopyWith<$Res>  {
$TodayStateCopyWith(TodayState _, $Res Function(TodayState) __);
}


/// Adds pattern-matching-related methods to [TodayState].
extension TodayStatePatterns on TodayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TodayLoading value)?  loading,TResult Function( TodayLoaded value)?  loaded,TResult Function( TodayError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TodayLoading() when loading != null:
return loading(_that);case TodayLoaded() when loaded != null:
return loaded(_that);case TodayError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TodayLoading value)  loading,required TResult Function( TodayLoaded value)  loaded,required TResult Function( TodayError value)  error,}){
final _that = this;
switch (_that) {
case TodayLoading():
return loading(_that);case TodayLoaded():
return loaded(_that);case TodayError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TodayLoading value)?  loading,TResult? Function( TodayLoaded value)?  loaded,TResult? Function( TodayError value)?  error,}){
final _that = this;
switch (_that) {
case TodayLoading() when loading != null:
return loading(_that);case TodayLoaded() when loaded != null:
return loaded(_that);case TodayError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( TodaySummary summary)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TodayLoading() when loading != null:
return loading();case TodayLoaded() when loaded != null:
return loaded(_that.summary);case TodayError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( TodaySummary summary)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TodayLoading():
return loading();case TodayLoaded():
return loaded(_that.summary);case TodayError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( TodaySummary summary)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TodayLoading() when loading != null:
return loading();case TodayLoaded() when loaded != null:
return loaded(_that.summary);case TodayError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TodayLoading implements TodayState {
  const TodayLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'TodayState.loading()';
}


}




/// @nodoc


class TodayLoaded implements TodayState {
  const TodayLoaded(this.summary);
  

 final  TodaySummary summary;

/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayLoadedCopyWith<TodayLoaded> get copyWith => _$TodayLoadedCopyWithImpl<TodayLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayLoaded&&(identical(other.summary, summary) || other.summary == summary));
}


@override
int get hashCode {
    return Object.hash(runtimeType,summary);
}

@override
String toString() {
    return 'TodayState.loaded(summary: $summary)';
}


}

/// @nodoc
abstract mixin class $TodayLoadedCopyWith<$Res> implements $TodayStateCopyWith<$Res> {
  factory $TodayLoadedCopyWith(TodayLoaded value, $Res Function(TodayLoaded) _then) = _$TodayLoadedCopyWithImpl;
@useResult
$Res call({
 TodaySummary summary
});


$TodaySummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$TodayLoadedCopyWithImpl<$Res>
    implements $TodayLoadedCopyWith<$Res> {
  _$TodayLoadedCopyWithImpl(this._self, this._then);

  final TodayLoaded _self;
  final $Res Function(TodayLoaded) _then;

/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? summary = null,}) {
  return _then(TodayLoaded(
null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as TodaySummary,
  ));
}

/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodaySummaryCopyWith<$Res> get summary {
  
  return $TodaySummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

/// @nodoc


class TodayError implements TodayState {
  const TodayError(this.message);
  

 final  String message;

/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayErrorCopyWith<TodayError> get copyWith => _$TodayErrorCopyWithImpl<TodayError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'TodayState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TodayErrorCopyWith<$Res> implements $TodayStateCopyWith<$Res> {
  factory $TodayErrorCopyWith(TodayError value, $Res Function(TodayError) _then) = _$TodayErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TodayErrorCopyWithImpl<$Res>
    implements $TodayErrorCopyWith<$Res> {
  _$TodayErrorCopyWithImpl(this._self, this._then);

  final TodayError _self;
  final $Res Function(TodayError) _then;

/// Create a copy of TodayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TodayError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

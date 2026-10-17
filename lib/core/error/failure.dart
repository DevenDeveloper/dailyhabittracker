import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.validation(String message) = ValidationFailure;
  const factory Failure.server(String message) = ServerFailure;
  const factory Failure.notFound(String message) = NotFoundFailure;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exaption.freezed.dart';

@freezed
abstract class ResponseFailure with _$ResponseFailure {
  const factory ResponseFailure.invalidCredential({
    required String message,
  }) = InvalidCredentials;

  const factory ResponseFailure.networkFailure({
    required String message,
  }) = NetworkFailure;

  const factory ResponseFailure.unknown({
    required String message,
  }) = Unknown;

  const factory ResponseFailure.limitFailure({
    required String message,
  }) = LimitFailure;
}

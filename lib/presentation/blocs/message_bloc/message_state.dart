part of 'message_bloc.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState.loading() = _Loading;

  const factory MessageState.success() = _Success;

  const factory MessageState.error() = _Error;
}

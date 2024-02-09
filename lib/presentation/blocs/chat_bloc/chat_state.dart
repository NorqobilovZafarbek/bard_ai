part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.loading() = _Loading;

  const factory ChatState.success(List<ChatsViewModel> item) = _Success;

  const factory ChatState.error() = _Error;
}

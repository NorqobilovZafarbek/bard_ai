part of 'message_bloc.dart';

@freezed
class MessageState with _$MessageState {
  const factory MessageState({
    @Default(false) bool isLoading,
    @Default(null) ResponseFailure? error,
    @Default([]) List<ChatModel> item,
    @Default(null) ChatsViewModel? chatsViewModel,
  }) = _MessageState;
}

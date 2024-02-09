part of 'message_bloc.dart';

@freezed
class MessageEvent with _$MessageEvent {
  const factory MessageEvent.started(String id) = _Started;

  const factory MessageEvent.sendMessage(ChatModel chatModel) = _SendMessage;

  const factory MessageEvent.newChat(String id) = _NewChat;
}

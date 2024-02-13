part of 'message_bloc.dart';

@freezed
class MessageEvent with _$MessageEvent {
  const factory MessageEvent.started() = _Started;

  const factory MessageEvent.sendMessage(String message) = _SendMessage;

  const factory MessageEvent.newChat(String id) = _NewChat;
}

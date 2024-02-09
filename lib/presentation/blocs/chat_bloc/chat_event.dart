part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.started() = _Started;

  const factory ChatEvent.getChats() = _GetChats;

  const factory ChatEvent.addToChat(ChatsViewModel model) = _AddToChat;

  const factory ChatEvent.delete(String id) = _Delete;
}

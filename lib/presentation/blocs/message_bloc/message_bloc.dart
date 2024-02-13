import 'package:bard_ai/data/models/chat/chat_model.dart';
import 'package:bard_ai/data/models/chat_view/chat_view_model.dart';
import 'package:bard_ai/domain/exaption/exaption.dart';
import 'package:bard_ai/domain/services/gemini_init/gemini_init.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/services/local_db/chat_services_sqflt.dart';

part 'message_event.dart';

part 'message_state.dart';

part 'message_bloc.freezed.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final MessageDB _messageDB;
  final DB _db;
  String? id;

  MessageBloc(
    this._messageDB,
    this.id,
    this._db,
  ) : super(const MessageState(isLoading: true)) {
    on<MessageEvent>(
      (event, emit) => event.map(
        started: (value) => _started(value, emit),
        sendMessage: (value) => _sendMessage(value, emit),
        newChat: (value) => _newChat(value, emit),
      ),
    );
  }

  Future<void> _started(_Started value, Emitter<MessageState> emit) async {
    if (id != null && (await _db.isCheck(id!))) {
      final data = await _db.getChat(id!);
      emit(MessageState(
        item: await _messageDB.getMessage(id!),
        chatsViewModel: data,
      ));
    } else {
      ChatsViewModel chatsViewModel = ChatsViewModel(
        createdAt: DateTime.now(),
      );
      emit(MessageState(chatsViewModel: chatsViewModel));
      print('-------------------------------------');
      print(chatsViewModel.id);
    }
  }

  Future<void> _sendMessage(
    _SendMessage value,
    Emitter<MessageState> emit,
  ) async {
    ChatModel chatModel = ChatModel(
      chatId: state.chatsViewModel!.id,
      text: value.message,
      role: Role.user,
    );
    await _messageDB.addToMessage(chatModel);
    emit(
      state.copyWith(
        item: await _messageDB.getMessage(
          state.chatsViewModel!.id,
        ),
      ),
    );
    await _messageDB.addToMessage(
      await GeminiInit.write(
        value.message,
        state.chatsViewModel!.id,
      ),
    );
    emit(state.copyWith(
      item: await _messageDB.getMessage(
        state.chatsViewModel!.id,
      ),
    ));
  }

  Future<void> _newChat(_NewChat value, Emitter<MessageState> emit) async {
    emit(const MessageState());
    id = null;
  }
}

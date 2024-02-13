import 'package:bard_ai/data/models/chat_view/chat_view_model.dart';
import 'package:bard_ai/domain/services/local_db/chat_services_sqflt.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';

part 'chat_state.dart';

part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final DB _db;
  final MessageDB messagesDB;

  ChatBloc(this._db, this.messagesDB) : super(const ChatState.loading()) {
    on<ChatEvent>(
      (event, emit) => event.map(
        started: (value) => _started(value, emit),
        getChats: (value) => _getChats(emit),
        addToChat: (value) => _addToChat(value, emit),
        delete: (value) => _delete(value, emit),
      ),
    );
  }

  void _started(_Started value, Emitter<ChatState> emit) {}

  Future<void> _getChats(Emitter<ChatState> emit) async {
    final data = await _db.getChats();
    emit(ChatState.success(data));
  }

  Future<void> _addToChat(_AddToChat value, Emitter<ChatState> emit) async {
    await _db.addToChats(value.model);
    await _getChats(emit);
  }

  Future<void> _delete(_Delete value, Emitter<ChatState> emit) async {
    await _db.delete(value.id);
    await _getChats(emit);
  }
}

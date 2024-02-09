import 'package:bard_ai/data/models/chat_view/chat_view_model.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatState.loading()) {
    on<ChatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

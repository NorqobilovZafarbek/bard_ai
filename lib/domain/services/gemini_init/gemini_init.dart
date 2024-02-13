import 'dart:async';

import 'package:bard_ai/data/models/chat/chat_model.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiInit {
  static final gemini = Gemini.instance;

  static void initialization() {
    Gemini.init(
      apiKey: "AIzaSyB5C7e9HutGgyAMEpEsBV8ccfHGL-bavhg",
      enableDebugging: false,
    );
  }

  static Future<ChatModel> write(
    String text,
    String id,
  ) async {
    final a = await gemini.text(text);

    ChatModel chatModel = ChatModel(
      chatId: id,
      text: a?.output ?? 'null',
      role: Role.model,
    );

    return chatModel;
  }
}

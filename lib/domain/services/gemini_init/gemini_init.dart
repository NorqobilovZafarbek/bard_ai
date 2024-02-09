import 'dart:async';


import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiInit {
  static final gemini = Gemini.instance;

  static void initialization() {
    Gemini.init(
      // apiKey: "AIzaSyCZZf48oPw4MXysXt202us8uDGM-qQgAiI",
      apiKey: "AIzaSyB5C7e9HutGgyAMEpEsBV8ccfHGL-bavhg",
      enableDebugging: false,
    );
  }

  static Future<List<Content>> write(
    List<Content> item,
    String text,
  ) async {
    final a = await gemini.chat(item);

    item.add(
      Content(parts: [Parts(text: a?.output)], role: 'model'),
    );

    print('-------------------2');

    return item;
  }
}

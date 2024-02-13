import 'package:flutter/cupertino.dart';

import 'core/widgets/app_scope.dart';
import 'domain/services/gemini_init/gemini_init.dart';
import 'domain/services/local_db/app_services.dart';
import 'domain/services/local_db/chat_services_sqflt.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.initialize();
  GeminiInit.initialization();

  final db = await DB.create("chats");
  final messagesDB = await MessageDB.create("messages");

  print('-------------------------Main');
  runApp(
    AppScope(
      db: db,
      messagesDB: messagesDB,
    ),
  );
}

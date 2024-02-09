import 'dart:async';

import 'package:bard_ai/data/models/chat/chat_model.dart';
import 'package:bard_ai/data/models/chat_view/chat_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class DBFace {
  Future<void> dispose();

  Future<List<ChatsViewModel>> getChats();

  Future<void> addToChats(ChatsViewModel chatsViewModel);
}

class DB implements DBFace {
  final String table;

  final Database _database;

  const DB._(
    this._database,
    this.table,
  );

  static Future<DB> create(String table) async {
    final documentPath = await getApplicationDocumentsDirectory();
    final database = await openDatabase(
      "${documentPath.path}/$table.db",
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE $table ('
          '"id"	TEXT NOT NULL UNIQUE,'
          '"topic"	TEXT NOT NULL DEFAULT \'New Chat\','
          '"created_at"	TEXT NOT NULL,'
          'PRIMARY KEY("id")'
          ')',
        );
      },
      version: 1,
    );
    return DB._(database, table);
  }

  @override
  Future<void> addToChats(ChatsViewModel chatsViewModel) async {
    await _database.insert(table, chatsViewModel.toJson());
  }

  @override
  Future<List<ChatsViewModel>> getChats() async {
    final data = await _database.query(table, orderBy: "created_at DESC");
    return data.map(ChatsViewModel.fromJson).toList();
  }

  @override
  Future<void> dispose() => _database.close();
}

abstract class IMessageDBFace {
  Future<List<ChatModel>> getMessage(String id);

  Future<void> addToMessage(ChatModel chatModel);
}

class MessageDB implements IMessageDBFace {
  final String table;
  final Database _database;

  const MessageDB._(
    this._database,
    this.table,
  );

  static Future<MessageDB> create(String table) async {
    final documentPath = await getApplicationDocumentsDirectory();
    final database = await openDatabase(
      "${documentPath.path}/message/$table.db",
      onCreate: (db, version) {
        db.execute("""CREATE TABLE $table (
              	"id"	TEXT NOT NULL UNIQUE,
	              "chat_id"	TEXT NOT NULL,
              	"role"	TEXT NOT NULL,
               	"text"	TEXT NOT NULL,
              	"send_time"	TEXT NOT NULL,
              	PRIMARY KEY("id")
          )""");
      },
      version: 1,
    );
    return MessageDB._(database, table);
  }

  @override
  Future<void> addToMessage(ChatModel chatModel) async {
    await _database.insert(table, chatModel.toJson());
  }

  @override
  Future<List<ChatModel>> getMessage(String id) async {
    final data = await _database.query(
      table,
      where: "chat_id = ?",
      whereArgs: [id],
      orderBy: "send_time ASC",
    );
    return data.map(ChatModel.fromJson).toList();
  }
}

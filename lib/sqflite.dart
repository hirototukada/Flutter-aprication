import 'package:flutter_todo/password.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? database;
  static const String tableName = 'password';

  static Future<void> _createTable(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, user_id TEXT , password TEXT)');
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'password.db');
    return await openDatabase(path, version: 1, onCreate: _createTable);
  }

  static Future<Database?> setDb() async {
    if (database == null) {
      database = await initDb();
      return database;
    } else {
      return database;
    }
  }

  static Future<void> insertData(Password password) async {
    await database?.insert(tableName, {
      'name': password.name.toString(),
      'user_id': password.userId.toString(),
      'password': password.password.toString(),
    });
  }

  static Future<List<Password>> getData() async {
    final List<Map<String, dynamic>> maps = await database!.query(tableName);
    if (maps.length == 0) {
      return [];
    } else {
      List<Password> passwordList = List.generate(
          maps.length,
          (index) => Password(
              name: maps[index]['name'],
              userId: maps[index]['user_id'],
              password: maps[index]['password']));
      return passwordList;
    }
  }
}

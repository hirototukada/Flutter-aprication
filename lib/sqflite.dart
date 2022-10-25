import 'package:flutter_todo/password.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? database;
  static final String tableName = 'password';

  static Future<void> _createTable(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, user_id TEXT , password TEXT)');
  }

  static Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'alarm_app.db');
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
    print(password);
    await database!.insert(tableName, {
      'name': password.name.toString(),
      'user_id': password.userId.toString(),
      'password': password.password.toString(),
    });
  }
}

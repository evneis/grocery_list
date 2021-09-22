import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final shopTABLE = 'Shopping';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();
  late Database _database;

  Database getDatabase() {
    if (_database != null) return _database;
    _database = createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, "ReactiveTodo.db");
    var database = openDatabase(path, version: 1, onCreate: initDB);
    return database;
  }

  void initDB(Database database, int version) {
    database.execute("CREATE TABLE $shopTABLE ("
        "id INTEGER PRIMARY KEY, "
        "item TEXT, "
        "aisle INTEGER, "
        "is_done INTEGER, "
        ")");
  }
}

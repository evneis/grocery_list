// ignore_for_file: file_names

import 'dart:io';
import 'package:grocery_list/Model/item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const shopTABLE = 'items';

class DatabaseProvider {
  Future<Database> createDatabase() async {
    String path = join(await getDatabasesPath(), "groceryItems.db");
    Database database =
        await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE items(id INTEGER PRIMARY KEY, item TEXT, aisle TEXT, is_done INTEGER)');
    });
    return database;
  }

  void initDB(Database database, int version) {
    database.execute("CREATE TABLE items("
        "id INTEGER PRIMARY KEY, "
        "item TEXT, "
        "aisle TEXT, "
        "is_done INTEGER, "
        ")");
  }

  Future<void> insertItem(RowItem item) async {
    final database = await createDatabase();
    await database.insert(
      'items',
      RowItem.toMap(item),
    );
  }

  Future<List<RowItem>> getAllItems() async {
    final database = await createDatabase();
    final List<Map<String, dynamic>> maps = await database.query('items');

    return List.generate(maps.length, (i) {
      return RowItem(
        itemName: maps[i]['itemName'],
        rowId: maps[i]['rowId'],
        isDone: maps[i]['isDone'],
      );
    });
  }

  Future<void> updateDog(RowItem item) async {
    final database = await createDatabase();
    await database.update(
      'items',
      RowItem.toMap(item),
    );
  }

  Future<void> deleteItem(String itemName) async {
    final database = await createDatabase();
    await database.delete(
      'items',
      where: 'itemName = ?',
      whereArgs: [itemName],
    );
  }

  Future<void> deleteAllItems() async {
    final database = await createDatabase();
    await database.delete(
      'items',
    );
  }
}

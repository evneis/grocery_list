// ignore_for_file: file_names

import 'dart:io';
import 'package:grocery_list/Model/item.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const shopTABLE = 'itemTable';

class DatabaseProvider {
  Future<Database> createDatabase() async {
    String path = join(await getDatabasesPath(), "groceryItems2.db");
    Database database =
        await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE itemTable(id INTEGER PRIMARY KEY, item TEXT, aisle TEXT, is_done INTEGER)');
    });
    return database;
  }

  // void initDB(Database database, int version) {
  //   database.execute("CREATE TABLE items("
  //       "id INTEGER PRIMARY KEY, "
  //       "item TEXT, "
  //       "aisle TEXT, "
  //       "is_done INTEGER, "
  //       ")");
  // }

  Future<void> insertItem(RowItem item) async {
    final database = await createDatabase();
    await database.insert(
      'itemTable',
      RowItem.toMap(item),
    );
  }

  Future<List<RowItem>> getAllItems() async {
    final database = await createDatabase();
    final List<Map<String, dynamic>> maps = await database.query('itemTable');
    return List.generate(maps.length, (i) {
      return RowItem(
        itemName: maps[i]['item'],
        rowId: maps[i]['aisle'],
        id: maps[i]['id'],
        isDone: maps[i]['is_done'],
      );
    });
  }

  Future<void> updateItem(RowItem item) async {
    final database = await createDatabase();
    await database.update('itemTable', RowItem.toMap(item),
        where: 'id = ?', whereArgs: [item.id]);
  }

  Future<void> deleteItem(int itemId) async {
    final database = await createDatabase();
    await database.delete(
      'itemTable',
      where: 'id = ?',
      whereArgs: [itemId],
    );
  }

  Future<void> deleteAllItems() async {
    final database = await createDatabase();
    await database.delete(
      'itemTable',
    );
  }
}

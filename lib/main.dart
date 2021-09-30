import 'package:flutter/material.dart';
import 'package:grocery_list/Database/database.dart';
import 'Model/item.dart';
import 'UI/home_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final DatabaseProvider db = DatabaseProvider();
  // List<RowItem> items = await db.getAllItems();
  List<RowItem> items = [];
  runApp(MyApp(items));
}

class MyApp extends StatelessWidget {
  MyApp(
    this.items, {
    Key? key,
  }) : super(key: key);
  List<RowItem> items;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        items,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grocery_list/Database/database.dart';
import 'Model/item.dart';
import 'UI/home_page.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:auto_route/auto_route.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

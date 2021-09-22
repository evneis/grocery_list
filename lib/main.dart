import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UI/home_page.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.prefs}) : super(key: key);
  final SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        prefs: prefs,
      ),
    );
  }
}

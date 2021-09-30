import 'package:auto_route/annotations.dart';
import 'package:grocery_list/UI/Widgets/home_widget.dart';
import 'package:grocery_list/UI/Widgets/item_description_page.dart';
import 'package:grocery_list/UI/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: MyHomePage, initial: true),
    AutoRoute(page: HomeWidget),
    AutoRoute(page: ItemDescriptionPage),
  ],
)
class $Router {}

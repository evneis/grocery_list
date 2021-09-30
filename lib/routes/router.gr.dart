// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../Model/item.dart' as _i6;
import '../UI/home_page.dart' as _i1;
import '../UI/Widgets/home_widget.dart' as _i2;
import '../UI/Widgets/item_description_page.dart' as _i3;

class Router extends _i4.RootStackRouter {
  Router([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      final args = routeData.argsAs<MyHomeRouteArgs>(
          orElse: () => const MyHomeRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.MyHomePage(key: args.key));
    },
    HomeWidget.name: (routeData) {
      final args = routeData.argsAs<HomeWidgetArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.HomeWidget(args.itemsList, key: args.key));
    },
    ItemDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<ItemDescriptionRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ItemDescriptionPage(args.item, key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(MyHomeRoute.name, path: '/'),
        _i4.RouteConfig(HomeWidget.name, path: '/home-widget'),
        _i4.RouteConfig(ItemDescriptionRoute.name,
            path: '/item-description-page')
      ];
}

/// generated route for [_i1.MyHomePage]
class MyHomeRoute extends _i4.PageRouteInfo<MyHomeRouteArgs> {
  MyHomeRoute({_i5.Key? key})
      : super(name, path: '/', args: MyHomeRouteArgs(key: key));

  static const String name = 'MyHomeRoute';
}

class MyHomeRouteArgs {
  const MyHomeRouteArgs({this.key});

  final _i5.Key? key;
}

/// generated route for [_i2.HomeWidget]
class HomeWidget extends _i4.PageRouteInfo<HomeWidgetArgs> {
  HomeWidget({required List<_i6.RowItem> itemsList, _i5.Key? key})
      : super(name,
            path: '/home-widget',
            args: HomeWidgetArgs(itemsList: itemsList, key: key));

  static const String name = 'HomeWidget';
}

class HomeWidgetArgs {
  const HomeWidgetArgs({required this.itemsList, this.key});

  final List<_i6.RowItem> itemsList;

  final _i5.Key? key;
}

/// generated route for [_i3.ItemDescriptionPage]
class ItemDescriptionRoute extends _i4.PageRouteInfo<ItemDescriptionRouteArgs> {
  ItemDescriptionRoute({required _i6.RowItem item, _i5.Key? key})
      : super(name,
            path: '/item-description-page',
            args: ItemDescriptionRouteArgs(item: item, key: key));

  static const String name = 'ItemDescriptionRoute';
}

class ItemDescriptionRouteArgs {
  const ItemDescriptionRouteArgs({required this.item, this.key});

  final _i6.RowItem item;

  final _i5.Key? key;
}

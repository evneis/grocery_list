import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/Bloc/cubit/grocery_list_cubit.dart';
import 'package:grocery_list/UI/Widgets/build_row_widget.dart';
import 'package:grocery_list/Model/hamburger_menu_features.dart';
import 'package:grocery_list/Model/item.dart';

import 'package:shared_preferences/shared_preferences.dart';

// replace return BuildRowWidget with return every item in rows.
class HomeWidget extends StatelessWidget {
  // final List<RowItem> items;
  final SharedPreferences prefs;
  HomeWidget(
    this.prefs, {
    Key? key,
  }) : super(key: key);
  final HamburgerMenuFeatures hmf = HamburgerMenuFeatures();
  var bool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
                height: 100.0,
                child: const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(''),
                )),
            ListTile(
              title: const Text('Delete All Rows'),
              onTap: () => hmf.removeAllItems(context),
            ),
          ],
        ),
      ),
      body: Center(
          child: FutureBuilder<List<RowItem>>(
              future: getPrefs(context, prefs),
              builder: (BuildContext context,
                  AsyncSnapshot<List<RowItem>> snapshot) {
                List<Widget> children;
                if (snapshot.data != null) {
                  List<RowItem>? items = snapshot.data;
                  children = <Widget>[
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: ListView.separated(
                          itemBuilder: (_, index) {
                            if (items != null) {
                              // final item = items[index];
                              final item = items[index];
                              // if (index.isOdd) return const Divider();
                              // return const BuildRowWidget([]);
                              return Dismissible(
                                  direction: DismissDirection.horizontal,
                                  key: Key(item.toString()),
                                  onDismissed: (direction) {
                                    removeItem(context, item);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                item.itemName + ' removed')));
                                  },
                                  child: ListTile(
                                    tileColor: Color.fromARGB(100, 0, 100, 0),
                                    title: BuildRowWidget(item),
                                  ));
                            } else {
                              return Text("data");
                            }
                          },
                          itemCount: items != null ? items.length : 0,
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        )),
                      ],
                    )),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                        child: CircularProgressIndicator(),
                        width: 60,
                        height: 60)
                  ];
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children,
                  ),
                );
              })),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () =>
            addItem(context), // Display widget tht adds to array in cubit
        child: const Icon(Icons.add),
      ),
    );
  }

  void addItem(BuildContext context) {
    final grocerylistcubit = context.read<
        GroceryListCubit>(); // After v6.1.0 both context.bloc(What I had) and context.repository are deprecated in favor of context.read and context.watch
    grocerylistcubit.addpage();
  }

  void removeItem(BuildContext context, row) {
    final grocerylistcubit = context.read<GroceryListCubit>();
    grocerylistcubit.removeItem(row);
  }

  Future<List<RowItem>> getPrefs(
      BuildContext context, SharedPreferences prefs) async {
    var items = prefs.getString('items');
    if (items == null) {
      return [];
    }
    String itemsString = items.toString();
    List<RowItem> rowItems = RowItem.decode(itemsString);
    return rowItems;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/Bloc/cubit/grocery_list_cubit.dart';
import 'package:grocery_list/Model/item.dart';

class ItemDescriptionPage extends StatelessWidget {
  ItemDescriptionPage(
    this.item, {
    Key? key,
  }) : super(key: key);
  RowItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Item Decription'),
        ),
        body: Center(
          child: ListView.separated(
            itemBuilder: (_, index) {
              Map itemMap = RowItem.toMapDisplay(item);
              final key = itemMap.keys.elementAt(index);
              return Container(
                  child: ListTile(
                tileColor: Color.fromARGB(100, 0, 100, 0),
                title: Text("$key"),
                subtitle: Text("${itemMap[key]}"),
              ));
            },
            itemCount: RowItem.toMapDisplay(item) != null
                ? RowItem.toMap(item).length
                : 0,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () =>
              addItem(context), // Display widget tht adds to array in cubit
          child: const Icon(Icons.add),
        ));
  }

  void addItem(BuildContext context) {
    final grocerylistcubit = context.read<
        GroceryListCubit>(); // After v6.1.0 both context.bloc(What I had) and context.repository are deprecated in favor of context.read and context.watch
    grocerylistcubit.returnToHome();
  }
}

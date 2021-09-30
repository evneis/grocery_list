import 'package:flutter/material.dart';
import 'package:grocery_list/Bloc/cubit/grocery_list_cubit.dart';

import 'package:grocery_list/Model/item.dart';
import 'package:provider/src/provider.dart';

//TODO Maybe Wrap widget in a container for a outline other then the divider when 2 or more items in list.
class BuildRowWidget extends StatelessWidget {
  bool isChecked = false;
  final RowItem row;
  BuildRowWidget(
    this.row, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(row.itemName),
        subtitle: Text("Aisle: " + row.rowId),
        leading: Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: row.isDone == 0 ? false : true,
          onChanged: (bool? value) {
            checkItem(context, row);
          },
        ),
      ),
      onTap: () {
        diplayItemDescription(context, row);
      },
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return Colors.blue;
  }

  void checkItem(BuildContext context, RowItem row) {
    final grocerylistcubit = context.read<GroceryListCubit>();
    grocerylistcubit.checkItem(row);
  }

  void diplayItemDescription(BuildContext context, RowItem item) {
    final grocerylistcubit = context.read<
        GroceryListCubit>(); // After v6.1.0 both context.bloc(What I had) and context.repository are deprecated in favor of context.read and context.watch
    grocerylistcubit.showItemDescription(item);
  }
}

import 'package:flutter/material.dart';

import 'package:grocery_list/Model/item.dart';

//TODO Maybe Wrap widget in a container for a outline other then the divider when 2 or more items in list.
class BuildRowWidget extends StatefulWidget {
  bool isChecked = false;
  final RowItem row;
  BuildRowWidget(
    this.row, {
    Key? key,
  }) : super(key: key);

  @override
  _BuildRowWidget createState() => _BuildRowWidget();
}

class _BuildRowWidget extends State<BuildRowWidget> {
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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.row.itemName),
      subtitle: Text("Aisle: " + widget.row.rowId),
      leading: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: widget.isChecked,
        onChanged: (bool? value) {
          setState(() {
            widget.isChecked = value!;
          });
        },
      ),
    );
  }
}

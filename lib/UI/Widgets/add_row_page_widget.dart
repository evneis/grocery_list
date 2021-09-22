import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/Bloc/cubit/grocery_list_cubit.dart';

class AddRowPageWidget extends StatelessWidget {
  AddRowPageWidget({
    Key? key,
  }) : super(key: key);

  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  "Name of Item and Aisle Number",
                  textAlign: TextAlign.left,
                )),
            TextField(
              controller: myController,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                addItem(context, value);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Apple ,1'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Item',
        onPressed: () => addItem(context,
            myController.text), // Display widget tht adds to array in cubit
        child: Icon(Icons.add),
      ),
    );
  }

  void addItem(BuildContext context, String input) {
    //TODO display error message instand of simply returning to home added doesnt work
    final grocerylistcubit = context.read<GroceryListCubit>();
    if (input.contains(',')) {
      var inputSplit = input.split(',');
      if (inputSplit[0].isNotEmpty && inputSplit[1].isNotEmpty) {
        grocerylistcubit.addrow(inputSplit);
      } else {
        grocerylistcubit.returnToHome();
      }
    } else {
      grocerylistcubit.returnToHome();
    }
  }
}

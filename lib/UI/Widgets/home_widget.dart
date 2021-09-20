import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/Bloc/cubit/grocery_list_cubit.dart';
import 'package:grocery_list/UI/Widgets/build_row_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (_, index) {
                      if (index.isOdd) return const Divider();
                      return const BuildRowWidget();
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () =>
            addRow(context), // Display widget tht adds to array in cubit
        child: Icon(Icons.add),
      ),
    );
  }

  void addRow(BuildContext context) {
    final grocerylistcubit = context.read<
        GroceryListCubit>(); // After v6.1.0 both context.bloc(What I had) and context.repository are deprecated in favor of context.read and context.watch
    grocerylistcubit.addpage();
  }
}

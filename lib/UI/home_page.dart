import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/Bloc/cubit/grocery_list_cubit.dart';

import 'Widgets/home_widget.dart';
import 'Widgets/error_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
      ),
      body: Center(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<GroceryListCubit> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => GroceryListCubit(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Expanded(
              child: BlocBuilder<GroceryListCubit, GroceryListState>(
                builder: (context, state) {
                  if (state is GroceryListStateInitial) {
                    return const LoadingWidget();
                  }
                  {
                    return const ErrorWidgetMine();
                  }
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}

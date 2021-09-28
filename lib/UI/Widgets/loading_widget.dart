import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_list/Bloc/cubit/grocery_list_cubit.dart';
import 'package:provider/src/provider.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  void start() {
    returnToHome(BuildContext context) {
      final grc = context.read<GroceryListCubit>();
      grc.returnToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    start();
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

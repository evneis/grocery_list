import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_list/Bloc/cubit/grocery_list_cubit.dart';
import 'package:grocery_list/UI/Widgets/build_row_widget.dart';

class HamburgerMenuFeatures {
  void removeAllItems(BuildContext context) {
    final grocerylistcubit = context.read<GroceryListCubit>();
    grocerylistcubit.removeAllItems();
  }
}

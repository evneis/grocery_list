part of 'grocery_list_cubit.dart';

@immutable
abstract class GroceryListState {
  const GroceryListState();
}

class GroceryListStateInitial extends GroceryListState {}

class GroceryListStateAdded extends GroceryListState {
  final List<String> input;
  const GroceryListStateAdded(this.input);

  @override //?
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GroceryListStateAdded && o.input == input;
  }

  @override
  int get hashCode => input.hashCode;
}

class GroceryListStateAddRowPage extends GroceryListState {}

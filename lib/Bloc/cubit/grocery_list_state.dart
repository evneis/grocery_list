part of 'grocery_list_cubit.dart';

@immutable
abstract class GroceryListState {
  const GroceryListState();
}

class GroceryListStateInitial extends GroceryListState {
  final List<RowItem> emptyItemsList;
  final SharedPreferences prefs;
  const GroceryListStateInitial(this.emptyItemsList, this.prefs);
}

class GroceryListStateAdded extends GroceryListState {
  final List<RowItem> items;
  final SharedPreferences prefs;
  const GroceryListStateAdded(this.items, this.prefs);

  @override //?
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GroceryListStateAdded && o.items == items;
  }

  @override
  int get hashCode => items.hashCode;
}

class GroceryListStateAddRowPage extends GroceryListState {}

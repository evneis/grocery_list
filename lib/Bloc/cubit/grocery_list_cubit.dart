import 'package:bloc/bloc.dart';
import 'package:grocery_list/Model/item.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'grocery_list_state.dart';

class GroceryListCubit extends Cubit<GroceryListState> {
  GroceryListCubit(List<RowItem> empty, this._preferences)
      : super(
          GroceryListStateInitial(empty, _preferences),
        );
  List<RowItem> items = [];
  final SharedPreferences _preferences;
  void addpage() {
    emit(GroceryListStateAddRowPage());
  }

  void addrow(List<String> inputRow) async {
    RowItem item = RowItem(itemName: inputRow[0], rowId: inputRow[1]);
    items.add(item);
    final String encodeItems = RowItem.encode(items);
    await _preferences.setString('items', encodeItems);
    emit(GroceryListStateAdded(items, _preferences));
  }

  void removeItem(item) async {
    items.remove(item);
    final String encodeItems = RowItem.encode(items);
    await _preferences.setString('items', encodeItems);
  }

  void returnToHome() {
    emit(GroceryListStateAdded(items, _preferences));
  }

  void removeAllItems() async {
    items = [];
    emit(GroceryListStateAdded(items, _preferences));
    final String encodeItems = RowItem.encode(items);
    await _preferences.setString('items', encodeItems);
  }
}

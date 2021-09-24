import 'package:bloc/bloc.dart';
import 'package:grocery_list/Database/Database.dart';
import 'package:grocery_list/Model/item.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'grocery_list_state.dart';

class GroceryListCubit extends Cubit<GroceryListState> {
  final DatabaseProvider db = DatabaseProvider();
  GroceryListCubit(List<RowItem> empty)
      : super(
          GroceryListStateInitial(empty),
        );
  void addpage() {
    emit(GroceryListStateAddRowPage());
  }

  void addrow(List<String> inputRow) async {
    RowItem item =
        RowItem(itemName: inputRow[0], rowId: inputRow[1], isDone: 0);
    db.insertItem(item);
    List<RowItem> items = await db.getAllItems();
    emit(GroceryListStateAdded(items));
  }

  void removeItem(RowItem item) async {
    db.deleteItem(item.itemName);
    List<RowItem> items = await db.getAllItems();
    emit(GroceryListStateAdded(items));
  }

  void returnToHome() async {
    List<RowItem> items = await db.getAllItems();
    emit(GroceryListStateAdded(items));
  }

  void removeAllItems() async {
    db.deleteAllItems();
    List<RowItem> items = await db.getAllItems();
    emit(GroceryListStateAdded(items));
  }
}

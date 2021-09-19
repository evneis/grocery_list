import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'grocery_list_state.dart';

class GroceryListCubit extends Cubit<GroceryListState> {
  GroceryListCubit() : super(GroceryListStateInitial());
}

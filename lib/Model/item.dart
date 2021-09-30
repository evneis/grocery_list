import 'dart:convert';

class RowItem {
  final String itemName, rowId;
  final int isDone, id;

  RowItem({
    required this.itemName,
    required this.rowId,
    required this.id, // 0 when created, but gets updated value by database INTEGER PRIMARY KEY when added to database
    required this.isDone, // 0 for unchecked, 1 for Checked
  });

  factory RowItem.fromJson(Map<String, dynamic> jsonData) {
    return RowItem(
      itemName: jsonData['item'],
      rowId: jsonData['aisle'],
      id: jsonData['id'],
      isDone: jsonData['is_done'],
    );
  }

  static Map<String, dynamic> toMap(RowItem rowItem) => {
        // There is no id in toMap as we do not give id to database, the database gives us an id.
        'item': rowItem.itemName,
        'aisle': rowItem.rowId,
        'is_done': rowItem.isDone,
      };

  static String encode(List<RowItem> rowItems) => json.encode(
        rowItems
            .map<Map<String, dynamic>>((rowItem) => RowItem.toMap(rowItem))
            .toList(),
      );

  static List<RowItem> decode(String rowItems) {
    List<dynamic> itemsJson = json.decode(rowItems) as List<dynamic>;
    List<RowItem> items = [];
    for (int i = 0; i < itemsJson.length; i++) {
      items.add(RowItem(
          itemName: itemsJson[i]["item"],
          rowId: itemsJson[i]["aisle"],
          id: itemsJson[i]["id"],
          isDone: itemsJson[i]["is_done"]));
    }

    return items;
  }
}

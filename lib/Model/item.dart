import 'dart:convert';

class RowItem {
  final String itemName, rowId;

  RowItem({
    required this.itemName,
    required this.rowId,
  });

  factory RowItem.fromJson(Map<String, dynamic> jsonData) {
    return RowItem(
      itemName: jsonData['itemName'],
      rowId: jsonData['rowId'],
    );
  }

  static Map<String, dynamic> toMap(RowItem rowItem) => {
        'itemName': rowItem.itemName,
        'rowID': rowItem.rowId,
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
          itemName: itemsJson[i]["itemName"], rowId: itemsJson[i]["rowID"]));
    }

    return items;
  }
}

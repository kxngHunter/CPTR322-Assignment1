import 'package:flutter/material.dart';
import 'item.dart';
import 'dart:collection';

class ItemData extends ChangeNotifier {
  List<Item> _items = [
    Item(name: 'Milk'),
    Item(name: 'Eggs'),
    Item(name: 'Bread'),
  ];
  UnmodifiableListView<Item> get items {
    return UnmodifiableListView(_items);
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String title) {
    _items.add(Item(name: title));
    notifyListeners();
  }

  void updateItem(Item item) {
    item.toggleDone();
    notifyListeners();
  }

  void delete(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

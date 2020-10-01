import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/constants.dart';
import 'package:shopping_list/models/item_data.dart';
import 'package:shopping_list/screens/developer.dart';
import 'package:shopping_list/widgets/dialog.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(builder: (context, itemData, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('My Supermarket Shopping List'),
          backgroundColor: kPrimaryColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Developer()));
              },
            )
          ],
        ),
        body: ListView.separated(
          itemCount: itemData.itemCount,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, index) {
            final item = itemData.items[index];
            return CheckboxListTile(
              title: Text(
                item.name,
                style: TextStyle(
                  decoration: item.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
              value: item.isDone,
              onChanged: (bool checkboxState) {
                itemData.updateItem(item);
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: kPrimaryColor,
          onPressed: () {
            dialog(context);
          },
        ),
      );
    });
  }
}

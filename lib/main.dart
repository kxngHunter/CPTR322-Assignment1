import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/constants.dart';
import 'package:shopping_list/developer.dart';
import 'package:shopping_list/models/item_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ShoppingList(),
      ),
    );
  }
}

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

void dialog(BuildContext context) {
  String newItemTitle;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: Container(
        width: 300.0,
        height: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff000080),
                fontSize: 30,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newItemTitle = newValue;
              },
            ),
            InkWell(
              borderRadius: kBorder,
              onTap: () {
                Provider.of<ItemData>(context, listen: false)
                    .addItem(newItemTitle);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                decoration: const BoxDecoration(
                  color: Color(0xff000080),
                  borderRadius: kBorder,
                ),
                child: Text(
                  'Add',
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

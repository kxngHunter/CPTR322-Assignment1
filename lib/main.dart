import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/constants.dart';
import 'file:///C:/Users/Hunter/AndroidStudioProjects/shopping_list/lib/screens/developer.dart';
import 'package:shopping_list/models/item_data.dart';
import 'package:shopping_list/screens/shopping_list.dart';

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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/item_data.dart';

import '../constants.dart';

void dialog(BuildContext context) {
  String newItemTitle;
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      contentPadding: const EdgeInsets.only(top: 10.0),
      content: Container(
        width: screenWidth * 0.4,
        height: screenHeight * 0.25,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 30.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newValue) {
                  newItemTitle = newValue;
                },
              ),
            ),
            InkWell(
              borderRadius: kBorder,
              onTap: () {
                if (newItemTitle != null) {
                  Provider.of<ItemData>(context, listen: false)
                      .addItem(newItemTitle);
                  Navigator.pop(context);
                }
              },
              child: Container(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: kBorder,
                ),
                child: Text(
                  'Add',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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

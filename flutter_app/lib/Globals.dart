import 'dart:core';

class GroceryItem {
  String name;
  var items = <GroceryItem>[];

  GroceryItem(this.name);
}

class GroceryList {
  String listName;

  GroceryList(this.listName);
}

var GroceryLists = <GroceryList>[];
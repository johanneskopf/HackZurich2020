import 'dart:core';

import 'package:flutter/cupertino.dart';

int i = 0;

class GroceryItem {
  String name;
  bool done = false;
  var key = Key("default");
  int idx = i;

  GroceryItem(this.name) {
    this.idx = i;
    i++;
    Refresh();
  }

  void SetDone(bool isDone){
    done = isDone;
    Refresh();
  }

  void Refresh() {
    key = Key("${idx}_$done");
  }
}

class GroceryList {
  String listName;
  var items = <GroceryItem>[];

  GroceryList(this.listName){
    items = [];
  }
  
  void clone(GroceryList other){
    listName = other.listName;
    other.items.forEach((element) {
      var newItem = GroceryItem(element.name);
      newItem.SetDone(element.done);
      items.add(newItem);});
  }
}

var GroceryLists = <GroceryList>[];
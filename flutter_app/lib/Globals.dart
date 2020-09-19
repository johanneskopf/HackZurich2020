import 'dart:core';
import 'package:flutter_app/models/index.dart';

import 'models/recipe.dart';

class GroceryItem {
  String name;
  bool done = false;
  bool bought = false;
  Product product = null;

  GroceryItem(this.name) {
  }

  void SetDone(bool isDone){
    done = isDone;
  }

  void BoughtProduct(Product p){
    bought = true;
    product = p;
    name = product.name; // update title of list item
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
      items.clear();
      var newItem = GroceryItem(element.name);
      newItem.SetDone(element.done);
      items.add(newItem);});
  }

}

var GroceryLists = <GroceryList>[];

var FavoriteRecipes = <Recipe>[];
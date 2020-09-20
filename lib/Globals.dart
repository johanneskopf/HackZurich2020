import 'dart:core';
import 'package:flutter_app/models/index.dart';

import 'models/recipe.dart';

class GroceryItem {
  String name;
  bool done = false;
  bool bought = false;
  Product product = null;
  bool clickable = false;

  GroceryItem(this.name) {
  }

  void SetDone(bool isDone){
    done = isDone;
  }

  void SetClickable(bool state) {
    clickable = state;
  }

  void BoughtProduct(Product p){
    bought = true;
    product = p;
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
    items.clear();
    other.items.forEach((element) {
      var newItem = GroceryItem(element.name);
      newItem.SetDone(element.done);
      newItem.SetClickable(element.clickable);
      if(element.bought)
        newItem.BoughtProduct(element.product);
      items.add(newItem);});
  }

}

var GroceryLists = <GroceryList>[];

var FavoriteRecipes = <Recipe>[];

var ScannedProducts = <Product>[];
import 'dart:core';
import 'models/recipe.dart';

class GroceryItem {
  String name;
  bool done = false;

  GroceryItem(this.name) {
  }

  void SetDone(bool isDone){
    done = isDone;
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
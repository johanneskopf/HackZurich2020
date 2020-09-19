import 'package:flutter/material.dart';
import 'Globals.dart';

class GroceryListPage extends StatefulWidget {
  final int groceryListId;
  final bool isNew;

  GroceryListPage(this.groceryListId, this.isNew);

  @override
  _GroceryListWidgetState createState() => _GroceryListWidgetState(groceryListId, isNew);
}

class _GroceryListWidgetState extends State<GroceryListPage> {
  final int groceryListId;
  final bool isNew;
  final nameController = TextEditingController();

  _GroceryListWidgetState(this.groceryListId, this.isNew);

  @override
  void initState(){
    super.initState();

    if(!isNew){
      nameController.text = GroceryLists[groceryListId].listName;
    }
  }

  _listListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body:
            ListView(
              children: <Widget>[
            TextFormField(
            decoration: InputDecoration(
                labelText: 'List Name'
            ),
              controller: nameController,

    ),
                RaisedButton(
                    onPressed: () async {
                      if(isNew && groceryListId == GroceryLists.length) {
                        GroceryLists.add(new GroceryList("My new List"));
                      }

                      if(nameController.text.isEmpty){
                        GroceryLists[groceryListId].listName = "New List";
                      }
                      else {
                        GroceryLists[groceryListId].listName = nameController.text;
                      }

                      Navigator.pop(context);
                    },

                    child: Text("Save Testing ${groceryListId}")),
                RaisedButton(
                    onPressed: () async {
                      GroceryLists.removeAt(groceryListId);
                      Navigator.pop(context);

                    },

                    child: Text("Dont Save Testing ${groceryListId}"))
              ],

            )
    );
  }
}

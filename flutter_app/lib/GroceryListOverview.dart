import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/GroceryList.dart';
import 'Globals.dart';

class GroceryListOverviewPage extends StatefulWidget {
  @override
  _GroveryListOverview createState() => _GroveryListOverview();
}

class _GroveryListOverview extends State<GroceryListOverviewPage> {
  var list = <GroceryList>[];

  @override
  void initState() {
    super.initState();
    list.addAll(GroceryLists);
  }

  _listListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Lists'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            itemCount: list.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (BuildContext context, int index) {
              return GroceryListButton(
                groceryListID: index,
                parent: this,
              );
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
          onPressed: () async {
            bool result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GroceryListPage(GroceryLists.length, true)),
            );

            setState(() {
              list.clear();
              list.addAll(GroceryLists);
            });
          },
          child: Icon(Icons.add)),
    );
  }
}

class GroceryListButton extends StatelessWidget {
  final int groceryListID;
  final _GroveryListOverview parent;

  const GroceryListButton({this.groceryListID, this.parent});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.horizontal,
        // We also need to provide a function that tells our app what to do
        // after an item has been swiped away.
        onDismissed: (DismissDirection dir) async {
          if (dir == DismissDirection.startToEnd) {
            GroceryLists.removeAt(groceryListID);
          } else {
            bool result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroceryListPage(groceryListID, false)),
            );
          }
          parent.setState(() {
            parent.list.clear();
            parent.list.addAll(GroceryLists);
          });
        },
        // Show a red background as the item is swiped away
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete),
          alignment: Alignment.centerLeft,
        ),
        // Background when swipping from right to left
        secondaryBackground: Container(
          color: Colors.green,
          child: Icon(Icons.edit),
          alignment: Alignment.centerRight,
        ),
        child:
        ButtonTheme(
          minWidth: MediaQuery.of(context).size.width,
          height: 75.0,
          child:
        RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroceryListPage(groceryListID, false)),
            );
            parent.setState(() {
              parent.list.clear();
              parent.list.addAll(GroceryLists);
            });
          },
          child:
          Row(
            children: <Widget>[
          Icon(Icons.shopping_cart, color: Colors.white, size: 40,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child:
              Text(GroceryLists[groceryListID].listName,

                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),)),
            ],
          )
        )));
  }
}

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
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return GroceryListButton(
                groceryListID: index,
                parent: this,
              );
            },
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            print("button action clicked");
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
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: RaisedButton(
          onPressed: () async {
            bool result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GroceryListPage(groceryListID, false)),
            );
            parent.setState(() {
              parent.list.clear();
              parent.list.addAll(GroceryLists);
            });
          },
          child: Text(GroceryLists[groceryListID].listName),
        ));
  }
}

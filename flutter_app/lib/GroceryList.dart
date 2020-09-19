import 'package:flutter/material.dart';
import 'Globals.dart';

class GroceryListPage extends StatefulWidget {
  final int groceryListId;
  final bool isNew;

  GroceryListPage(this.groceryListId, this.isNew);

  @override
  _GroceryListWidgetState createState() =>
      _GroceryListWidgetState(groceryListId, isNew);
}

class _GroceryListWidgetState extends State<GroceryListPage> {
  final int groceryListId;
  final bool isNew;
  final nameController = TextEditingController();
  final itemController = TextEditingController();

  GroceryList workingList = GroceryList("");

  final _items = List<String>.generate(20, (i) => "Item ${i + 1}");

  _GroceryListWidgetState(this.groceryListId, this.isNew);

  @override
  void initState() {
    super.initState();

    if (!isNew) {
      nameController.text = GroceryLists[groceryListId].listName;
      workingList.clone(GroceryLists[groceryListId]);
    }
  }

  _listListener() {
    setState(() {});
  }

  void Save() {
    if (isNew && groceryListId == GroceryLists.length) {
      GroceryLists.add(new GroceryList("My new List"));
    }

    if (nameController.text.isEmpty) {
      workingList.listName = "New List";
    } else {
      workingList.listName = nameController.text;
    }
    GroceryLists[groceryListId].clone(workingList);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My List'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            heroTag: null,
            onPressed: Save,
            child: Icon(Icons.save, color: Colors.white)),
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
                decoration: InputDecoration(
                    labelText: 'List Name',
                    focusColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 14)),
                controller: nameController,
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.08,
                padding:
                    EdgeInsets.only(left: 25, top: 5, bottom: 5, right: 20),
                child: Row(children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'New Item',
                          labelStyle: TextStyle(fontSize: 14)),
                      controller: itemController,
                    ),
                  ),
                  Expanded(
                      child: ButtonTheme(
                    minWidth: 40.0,
                    height: 40.0,
                    child: FloatingActionButton(
                        onPressed: () {
                          if (itemController.text.isEmpty) return;
                          setState(() {
                            workingList.items
                                .add(GroceryItem(itemController.text));
                          });
                          itemController.text = "";
                        },
                        child: Center(child: Icon(Icons.add, color: Colors.white))),
                  )),
                ])),
            Container(
                height: MediaQuery.of(context).size.height * 0.66,
                child: ListView.builder(
                  itemCount: workingList.items.length,
                  itemBuilder: (context, index) {
                    workingList.items.sort(
                        (a, b) => (a.done != b.done ? (a.done ? 1 : -1) : 0));

                    final String item = workingList.items[index].name;
                    return Dismissible(
                      key: UniqueKey(),
                      direction: workingList.items[index].done
                          ? DismissDirection.startToEnd
                          : DismissDirection.horizontal,
                      // We also need to provide a function that tells our app what to do
                      // after an item has been swiped away.
                      onDismissed: (DismissDirection dir) {
                        if (dir == DismissDirection.startToEnd) {
                          setState(() => {
                                if (this.workingList.items[index].done)
                                  this.workingList.items[index].SetDone(false)
                                else
                                  this.workingList.items.removeAt(index)
                              });
                        } else {
                          setState(() =>
                              {this.workingList.items[index].SetDone(true)});
                        }
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(dir == DismissDirection.startToEnd
                                ? '$item deleted'
                                : (!this.workingList.items[index].done
                                    ? '$item bought'
                                    : '')),
                          ),
                        );
                      },
                      // Show a red background as the item is swiped away
                      background: Container(
                        color: workingList.items[index].done
                            ? Theme.of(context).accentColor
                            : Colors.red,
                        child: Icon(workingList.items[index].done
                            ? Icons.undo
                            : Icons.delete),
                        alignment: Alignment.centerLeft,
                      ),
                      // Background when swipping from right to left
                      secondaryBackground: Container(
                        color: Colors.green,
                        child: Icon(Icons.done),
                        alignment: Alignment.centerRight,
                      ),
                      child: GroceryItemWidget(this.workingList.items[index], index, this),
                    );
                  },
                )),
          ],
        ));
  }
}

class GroceryItemWidget extends StatelessWidget {
  final GroceryItem info;
  final int idx;
  final _GroceryListWidgetState parent;

  const GroceryItemWidget(this.info, this.idx, this.parent);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: FlatButton(
            onPressed: () {
              print("clicked item");
            },
            child: Row(children: <Widget>[
              Expanded(
                  child:
                  FlatButton(
                      onPressed: () {
                        parent.setState(() {
                          parent.workingList.items[idx].SetDone(info.done? false : true);
                        });
                        print("item checked");
                      },
                      child: Icon(info.done? Icons.check_box_outlined : Icons.check_box_outline_blank,
                      color: info.done? Colors.black26 : Colors.black))
              ),
              Expanded(
                flex: 5,
                  child: Text(
                info.name,
                style: info.done
                    ? TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough)
                    : null,
              )),

            ])));
  }
}

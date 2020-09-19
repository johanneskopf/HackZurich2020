import 'package:flutter/material.dart';

class GroceryListOverviewPage extends StatefulWidget {
  @override
  _GroveryListOverview createState() => _GroveryListOverview();
}

class _GroveryListOverview extends State<GroceryListOverviewPage> {

  _listListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grocery Lists'),
        ),
        body: Text("Testing")
    );
  }
}

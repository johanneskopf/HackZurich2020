import 'package:flutter/material.dart';

class RecipeBrowserPage extends StatefulWidget {
  @override
  _RecipeBrowserWidgetState createState() => _RecipeBrowserWidgetState();
}

class _RecipeBrowserWidgetState extends State<RecipeBrowserPage> {
  _listListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recipe Browser'),
        ),
        body: Text("Testing")
    );
  }
}

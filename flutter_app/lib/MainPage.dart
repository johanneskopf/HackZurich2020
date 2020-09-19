import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/Favorites.dart';
import 'package:flutter_app/GroceryListOverview.dart';
import 'package:flutter_app/RecipeBrowser.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPage> {
  Alignment _alignment = Alignment.center;
  double _animatedHeight = 600.0;
  Color _animatedColor = Colors.green;
  bool _isAnimated = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      onAnimate();
    });
  }

  void onAnimate() {
    setState(() {
      _isAnimated = !_isAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isAnimated) {
      _animatedHeight = MediaQuery.of(context).size.height;
      _animatedColor = Colors.white;
    } else {
      _animatedHeight = MediaQuery.of(context).size.height * 0.2;
      _animatedColor = Theme.of(context).primaryColor;
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     child: Center(
      //       child: Text(
      //         'Animated Container Widget',
      //       ),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                width: MediaQuery.of(context).size.width,
                height: _animatedHeight,
                color: _animatedColor,
                curve: Curves.fastOutSlowIn,
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  alignment: _alignment,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    height: _animatedHeight * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image(image: AssetImage('images/logo.png')),
                  ),
                ),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: features.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MainButtonItem(info: features[index]);
                  },
                ))
          ]),
        ),
      ),
      //   drawer: Drawer(
      //       child: ListView(
      //         padding: EdgeInsets.zero,
      //         children: <Widget>[
      //           UserAccountsDrawerHeader(
      //             accountName: Text("Sandra Bre"),
      //             accountEmail: Text("sandra-bre@gmail.com"),
      //           ),
      //           ListTile(
      //             title: Text("My Account"),
      //             onTap: () {
      //               Navigator.pop(context);
      //             },
      //           )
      //         ],
      //       ))
    );
  }
}

class MainButtonItem extends StatelessWidget {
  final Feature info;

  const MainButtonItem({this.info});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                switch (info.routeID) {
                  case 0:
                    return GroceryListOverviewPage();
                  case 1:
                    return RecipeBrowserPage();
                  case 2:
                    return FavoritesPage();
                  default:
                    return GroceryListOverviewPage();
                }
              }));
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(10.0),
            ),
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(10),
            child: Row(children: <Widget>[
              Icon(
                info.icon,
                color: Theme.of(context).accentColor,
                size: 60.0,
              ),
              Column(
                children: <Widget>[
                  Container(
                      width: 190.0,
                      height: 40.0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(info.title,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            )),
                      )),
                  Container(
                    height: 30.0,
                    width: 190.0,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          info.description,
                          softWrap: true,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        )),
                  )
                ],
              )
            ])));
  }
}

class Feature {
  final String title;
  final IconData icon;
  final String description;
  final int routeID;

  Feature({this.title, this.description, this.icon, this.routeID});
}

final features = <Feature>[
  Feature(
      title: "Grocery Lists",
      icon: Icons.local_grocery_store,
      description: "View existing and create new grocery lists.",
      routeID: 0),
  Feature(
      title: "Recipe Browser",
      icon: Icons.food_bank,
      description: "View existing and create new grocery lists.",
      routeID: 1),
  Feature(
      title: "Favorites",
      icon: Icons.favorite,
      description: "View existing and create new grocery lists.",
      routeID: 2),
  Feature(
      title: "Next Store",
      icon: Icons.location_on,
      description: "View existing and create new grocery lists.",
      routeID: 3),
  Feature(
      title: "History",
      icon: Icons.access_time,
      description: "View existing and create new grocery lists.",
      routeID: 4),
];

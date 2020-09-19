import 'dart:async';

import 'package:flutter/material.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart' as wheel;
import 'package:flutter_app/GroceryListOverview.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  Alignment _alignment = Alignment.center;
  double _animatedHeight = 800.0;
  double _animatedWidth = 400.0;
  double _iconHeight = 180.0;
  double _iconWidth = 180.0;
  Color _animatedColor = Colors.red;
  bool _isAnimated = true;
  bool _isInit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isInit = false;

    print("initstate");
    Future.delayed(const Duration(seconds: 2), () async {
      print("delayed");
      onAnimate();
    });
  }

  void onAnimate() {
    setState(() {
      /// Condition to toggle the _isAnimated bool variable
      _isAnimated ? _isAnimated = false : _isAnimated = true;

      /// Condition to change the alignment of Flutter logo
      _isAnimated
          ? _alignment = Alignment.topCenter
          : _alignment = Alignment.center;

      /// Condition to change the width of the background container
      _animatedWidth = 400;
      // _isAnimated ? _animatedWidth = 400.0 : _animatedWidth = 400.0;

      /// Condition to change the height of background container
      /// MediaQuery.of(context).size.height - 200 is done to keep
      /// height always above the FAB
      _isAnimated
          ? _animatedHeight =
              // MediaQuery.of(context).size.height
              500
          : _animatedHeight = 200.0;

      /// Condition to change the background color
      _isAnimated
          ? _animatedColor = Colors.lightBlue
          : _animatedColor = Colors.red;

      /// Condition to change the width of FlutterLogo
      _isAnimated ? _iconWidth = 100.0 : _iconWidth = 180.0;

      /// Condition to change height of FlutterLogo
      _isAnimated ? _iconHeight = 100.0 : _iconHeight = 180.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Container(
      //     child: Center(
      //       child: Text(
      //         'Animated Container Widget',
      //       ),
      //     ),
      //     margin: EdgeInsets.only(right: 48),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 24),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Center(
              ///Animated Container to change the background color with
              ///an animation
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                width: _animatedWidth,
                height: _animatedHeight,
                color: _animatedColor,
                curve: Curves.fastOutSlowIn,

                ///Animated container that changes the alignment of
                ///FlutterLogo with an animation
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  alignment: _alignment,

                  ///Animated Container to change the dimentions of the
                  ///FlutterLogo with an animation
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    height: _iconHeight,
                    width: _iconWidth,
                    child: Text("sandra"),
                  ),
                ),
              ),
            ),
            Text("Sandras Testing")
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: () => onAnimate(),
        icon: Icon(
          Icons.movie_filter,
          color: Colors.white,
        ),
        label: Text(
          "Animate",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _CircularMainPageList createState() => _CircularMainPageList();
}

class _CircularMainPageList extends State<MainPage> {
  wheel.FixedExtentScrollController _controller;

  _listListener() {
    setState(() {});
  }

  @override
  void initState() {
    _controller = wheel.FixedExtentScrollController();
    _controller.addListener(_listListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listListener);
    _controller.dispose();
    super.dispose();
  }

  onBtnPressed() {
    print('centrebutton');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => GroceryListOverviewPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Working Title'),
        ),
        body: GestureDetector(
          child: wheel.CircleListScrollView.useDelegate(
            childDelegate: wheel.CircleListChildBuilderDelegate(
              builder: (context, index) {
                int currentIndex = 0;
                try {
                  currentIndex = _controller.selectedItem;
                } catch (_) {}

                final resizeFactor = (1 -
                    (((currentIndex - index).abs() * 0.3).clamp(0.0, 1.0)));

                return GestureDetector(
                    onLongPress: () {
                      print("onTab");
                      onBtnPressed();
                    },
                    child: FlatButton(
                        key: features[index].key,
                        onPressed: () {
                          //call to your callback  here
                          onBtnPressed();
                        },
                        child: Text("asdf")));

                return CircleListItem(
                  resizeFactor: resizeFactor,
                  info: features[index],
                );
              },
              childCount: features.length,
            ),
            physics: wheel.CircleFixedExtentScrollPhysics(),
            controller: _controller,
            axis: Axis.vertical,
            itemExtent: 120,
            radius: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sandra Bre"),
              accountEmail: Text("sandra-bre@gmail.com"),
            ),
            ListTile(
              title: Text("My Account"),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        )));
  }
}

class CircleListItem extends StatelessWidget {
  final double resizeFactor;
  final Feature info;

  const CircleListItem({Key key, this.resizeFactor, this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
                onPressed: () {
                  print('centrebutton');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              GroceryListOverviewPage()));
                },
                child: Container(
                    width: 280.0 * resizeFactor,
                    height: 100.0 * resizeFactor,
                    padding: const EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10))),
                    child: Row(children: <Widget>[
                      Icon(
                        info.icon,
                        color: Theme.of(context).accentColor,
                        size: 60.0 * resizeFactor,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                              width: 190.0 * resizeFactor,
                              height: 40.0 * resizeFactor,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(info.title,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22 * resizeFactor,
                                    )),
                              )),
                          Container(
                            height: 30.0 * resizeFactor,
                            width: 190.0 * resizeFactor,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  info.description,
                                  softWrap: true,
                                  textAlign: TextAlign.left,
                                  maxLines: 3,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10 * resizeFactor,
                                  ),
                                )),
                          )
                        ],
                      )
                    ])))),
      ],
      // )
    );
  }
}

class Feature {
  final Key key;
  final String title;
  final IconData icon;
  final String description;
  final MaterialPageRoute route;

  Feature({this.key, this.title, this.description, this.icon, this.route});
}

final features = <Feature>[
  Feature(
      key: Key('GroceryList'),
      title: "Grocery Lists",
      icon: Icons.local_grocery_store,
      description: "View existing and create new grocery lists.",
      route: new MaterialPageRoute(
          builder: (context) => GroceryListOverviewPage())),
  Feature(
      key: Key('RecipeBrowser'),
      title: "Recipe Browser",
      icon: Icons.food_bank,
      description: "View existing and create new grocery lists.",
      route: null),
  Feature(
      key: Key('Favorites'),
      title: "Favorites",
      icon: Icons.favorite,
      description: "View existing and create new grocery lists.",
      route: null),
  Feature(
      key: Key('NextStore'),
      title: "Next Store",
      icon: Icons.location_on,
      description: "View existing and create new grocery lists.",
      route: null),
  Feature(
      key: Key('History'),
      title: "History",
      icon: Icons.access_time,
      description: "View existing and create new grocery lists.",
      route: null),
];

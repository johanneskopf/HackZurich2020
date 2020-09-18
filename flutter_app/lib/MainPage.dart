import 'package:flutter/material.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart' as wheel;

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

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/background.png"), fit: BoxFit.cover)),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Working Title'),
            ),
            body: wheel.CircleListScrollView.useDelegate(
              childDelegate: wheel.CircleListChildBuilderDelegate(
                builder: (context, index) {
                  int currentIndex = 0;
                  try {
                    currentIndex = _controller.selectedItem;
                  } catch (_) {}

                  final resizeFactor = (1 -
                      (((currentIndex - index).abs() * 0.3).clamp(0.0, 1.0)));

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
            ))));
  }
}

class CircleListItem extends StatelessWidget {
  final double resizeFactor;
  final Feature info;

  const CircleListItem({Key key, this.resizeFactor, this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Center(
        //   child:
        Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
                onPressed: () {
                  /*...*/
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
  final String title;
  final IconData icon;
  final String description;

  Feature({
    this.title,
    this.description,
    this.icon,
  });
}

final features = <Feature>[
  Feature(
      title: "Grocery Lists",
      icon: Icons.local_grocery_store,
      description: "View existing and create new grocery lists."),
  Feature(
      title: "Recipe Browser",
      icon: Icons.food_bank,
      description: "View existing and create new grocery lists."),
  Feature(
      title: "Favorites",
      icon: Icons.favorite,
      description: "View existing and create new grocery lists."),
  Feature(
      title: "Next Store",
      icon: Icons.location_on,
      description: "View existing and create new grocery lists."),
  Feature(
      title: "History",
      icon: Icons.access_time,
      description: "View existing and create new grocery lists."),
];

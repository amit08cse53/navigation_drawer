import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(
      new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentPage;
  bool flag = true;

//  String currentPageString;

  @override
  void initState() {
    super.initState();

    if (currentPage == null || _recentPages.length == 0) {
      currentPage = new PageOne();
      print(
          "_recentPages :: ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      // To process back pressed event
      onWillPop: onWillPop,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Home'),
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new DrawerHeader(
                child: new UserAccountsDrawerHeader(
                  accountName: new Text('Vinoth Kumar'),
                  accountEmail: new Text('vinoth1094@gmail.com'),
                  currentAccountPicture: new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          'https://scontent.fmaa1-1.fna.fbcdn.net/v/t1.0-9/16196015_10154888128487744_6901111466535510271_n.png?_nc_cat=0&oh=b987a0608ad9dad1beff57c489e53221&oe=5BB865E9')),
                ),
                padding: const EdgeInsets.all(0.0),
                margin: const EdgeInsets.all(0.0),
              ),
            ]..addAll(_buildNavigationItems()),
          ),
        ),
        body: currentPage,
      ),
    );
  }

  List<Widget> _buildNavigationItems() {
    List<Widget> navList = [];
    for (int i = 0; i < _navigationItems.length; i++) {
      navList.add(new ListTile(
        title: new Text(_navigationItems[i].name),
        trailing: new Icon(_navigationItems[i].icon),
        onTap: () {
          onNavigationIconClicked(i);
        },
      ));
    }
    return navList;
  }

  onNavigationIconClicked(int i) {
    flag = true;

    switch (_navigationItems[i].name) {
      case 'Page 1':
        if (!(currentPage is PageOne)) {
          Navigator.of(context).pop();

          for (int i = 0; i < _recentPages.length; i++) {
            if (_recentPages[i] is PageOne) {
              _recentPages.removeAt(i);
              setState(() {
                _recentPages
                    .add(currentPage); // Add current page to _recentPages
                currentPage = new PageOne(); // Show new page
                print(
                    "_recentPages  ::in ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
              });

              flag = false;

              break;
            }
          }

          if (flag) {
            setState(() {
              _recentPages.add(currentPage); // Add current page to _recentPages
              currentPage = new PageOne(); // Show new page
            });
            print(
                "_recentPages :: ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
            break;
          }
        }
        break;
      case 'Page 2':
        if (!(currentPage is PageTwo)) {
          Navigator.of(context).pop();
          for (int i = 0; i < _recentPages.length; i++) {
            if (_recentPages[i] is PageTwo) {
              _recentPages.removeAt(i);
              setState(() {
                _recentPages
                    .add(currentPage); // Add current page to _recentPages
                currentPage = new PageTwo(); // Show new page
                print(
                    "_recentPages ::in ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
              });

              flag = false;
              break;
            }
          }

          if (flag) {
            setState(() {
              _recentPages.add(currentPage); // Add current page to _recentPages
              currentPage = new PageTwo(); // Show new page
            });
            print(
                "_recentPages :: ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
            break;
          }
        }
        break;
      case 'Page 3':
        if (!(currentPage is PageThree)) {
          Navigator.of(context).pop();
          for (int i = 0; i < _recentPages.length; i++) {
            if (_recentPages[i] is PageThree) {
              _recentPages.removeAt(i);
              setState(() {
                _recentPages
                    .add(currentPage); // Add current page to _recentPages
                currentPage = new PageThree(); // Show new page
                print(
                    "_recentPages ::in ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
              });

              flag = false;

              break;
            }
          }

          if (flag) {
            setState(() {
              _recentPages.add(currentPage); // Add current page to _recentPages
              currentPage = new PageThree(); // Show new page
            });
            print(
                "_recentPages :: ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
            break;
          }
        }
        break;
      case 'Page 4':
        if (!(currentPage is PageFour)) {
          Navigator.of(context).pop();
          for (int i = 0; i < _recentPages.length; i++) {
            if (_recentPages[i] is PageFour) {
              _recentPages.removeAt(i);
              setState(() {
                _recentPages
                    .add(currentPage); // Add current page to _recentPages
                currentPage = new PageFour(); // Show new page
                print(
                    "_recentPages ::in ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
              });

              flag = false;

              break;
            }
          }

          if (flag) {
            setState(() {
              _recentPages.add(currentPage); // Add current page to _recentPages
              currentPage = new PageFour(); // Show new page
            });
            print(
                "_recentPages :: ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
            break;
          }
        }
        break;
    }
  }

  Future<bool> onWillPop() async {
    if (_recentPages.length == 0) {
      print(
          "_recentPages :: ${_recentPages.length} :: ${_recentPages.asMap().toString()}");

      return true;
    } else {
      setState(() {
        print(
            "_recentPages :: ${_recentPages.length} :: ${_recentPages.asMap().toString()}");

        currentPage = _recentPages[_recentPages.length - 1];
        _recentPages.removeLast();
        print(
            "_recentPages :: ${_recentPages.length} :: ${_recentPages.asMap().toString()}");
      });
      return false;
    }
  }
}

List<Widget> _recentPages = [];

List<NavigationItem> _navigationItems = [
  new NavigationItem('Page 1', Icons.keyboard_arrow_right),
  new NavigationItem('Page 2', Icons.keyboard_arrow_right),
  new NavigationItem('Page 3', Icons.keyboard_arrow_right),
  new NavigationItem('Page 4', Icons.keyboard_arrow_right),
];

class NavigationItem {
  final String name;
  final IconData icon;

  NavigationItem(this.name, this.icon);
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Page One'),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Page Two'),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Page Three'),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('Page Four'),
    );
  }
}

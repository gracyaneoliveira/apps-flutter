import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_bar/bloc/bottom-navbar-bloc.dart';

main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  BottomNavBarBloc _bottomNavBarBloc;

  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  void dispose() {
    _bottomNavBarBloc.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    print("BUILD ...");
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom NavBar Navigation"),
      ),
      body: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            Widget navbar;
            switch (snapshot.data) {
              case NavBarItem.HOME:
                navbar = _homeArea();
                break;
              case NavBarItem.MESSAGES:
                navbar= _alertArea();
                break;
              case NavBarItem.SETTINGS:
                navbar = _settingsArea();
                break;
            }
            return navbar;
          },
      ),
      bottomNavigationBar: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            return BottomNavigationBar(
                fixedColor: Colors.blueAccent,
                currentIndex: snapshot.data.index,
                onTap: _bottomNavBarBloc.selectItem,
                items: [
                  BottomNavigationBarItem(
                    title: Text('Home'),
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    title: Text('Notifications'),
                    icon: Icon(Icons.notifications),
                  ),
                  BottomNavigationBarItem(
                    title: Text('Settings'),
                    icon: Icon(Icons.settings),
                  ),
                ],
            );
          }
      ),
    );
  }

  Widget _homeArea() {
    return Center(
      child: Text(
        'Home Screen',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.green,
          fontSize: 25.0,
        ),
      ),
    );
  }

  Widget _alertArea() {
    return Center(
      child: Text(
        'Notifications Screen',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.red,
          fontSize: 25.0,
        ),
      ),
    );
  }

  Widget _settingsArea() {
    return Center(
      child: Text(
        'Settings Screen',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.blue,
          fontSize: 25.0,
        ),
      ),
    );
  }
}


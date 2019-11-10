import 'dart:async';

enum NavBarItem { HOME, MESSAGES, SETTINGS }

class BottomNavBarBloc {

  final StreamController<NavBarItem> _navBarController =
      StreamController<NavBarItem>.broadcast();

  NavBarItem defaultItem = NavBarItem.HOME;

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void selectItem(int index){
    switch(index){
      case 0:
        _navBarController.sink.add(NavBarItem.HOME);
        break;
      case 1:
        _navBarController.sink.add(NavBarItem.MESSAGES);
        break;
      case 2:
        _navBarController.sink.add(NavBarItem.SETTINGS);
        break;
    }
  }

  close(){
    _navBarController?.close();
  }
}

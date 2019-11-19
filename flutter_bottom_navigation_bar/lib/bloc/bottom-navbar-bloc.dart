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


/// https://github.com/mbsambangi/flutter_navbar_bloc_streams_demo/blob/master/lib/main.dart
/// https://medium.com/@madhu.sambangi/flutter-bottom-navigation-bar-navigation-using-dart-streams-bloc-pattern-61ac0e916804
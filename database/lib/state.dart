import 'package:database/screens/logout_page.dart';
import 'package:database/screens/tabs_screen/favourite_tab.dart';
import 'package:database/screens/tabs_screen/home_tab.dart';
import 'package:database/screens/tabs_screen/search_tab.dart';
import 'package:database/widgets/customActionBar.dart';
import 'package:flutter/material.dart';

class NavigationState with ChangeNotifier {
  bool _toggle = true;

  bool get toggle => _toggle;

  void changeState() {
    _toggle = !toggle;
    notifyListeners();
  }

  /////////////////////////////////////
  int _index;
  int get index=>_index;
  int _currentIndex;
  int get currentIndex=>_currentIndex;
  void setIndex(int i){
    _currentIndex=i;
    _index =i;
    notifyListeners();
  }
}

class FormProvider with ChangeNotifier {
  String _email = '';
  String _password = '';

  String get email => _email;

  String get password => _password;

  void setEmail(String email) {
    _email = email.trim();
  }

  void setPassword(String password) {
    _password = password.trim();
  }
}

class TabProvider with ChangeNotifier {
  Widget _bottomBarWidget = HomeTab();
  Widget _appBarWidget = CustomActionBar(
    title: 'Action Bar',
    hasBackArrow: false,
  );
  int _index = 0;

  int get index => _index;

  Widget get getWidget => _bottomBarWidget;

  Widget get getAppbar => _appBarWidget;

  void page(int index) {
    _index = index;
    switch (index) {
      case 0:
        {
          _bottomBarWidget = HomeTab();
          _appBarWidget = CustomActionBar(
            title: 'Action Bar',
            hasBackArrow: false,
          );
        }
        break;
      case 1:
        {
          _bottomBarWidget = SearchTab();
          _appBarWidget = CustomActionBar(
            title: 'Search An Item',
            hasBackArrow: false,
          );
        }
        break;
      case 2:
        {
          _bottomBarWidget = FavouriteTab();
          _appBarWidget = CustomActionBar(
            title: 'Saved Products',
            hasBackArrow: false,
          );
        }
        break;
      case 3:
        {
          _bottomBarWidget = LogoutPage();
          _appBarWidget = CustomActionBar(
            title: 'logOut',
            hasBackArrow: false,
          );
        }
        break;
    }
    notifyListeners();
  }
}

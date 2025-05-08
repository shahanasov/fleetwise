part of 'bottom_navigation_bloc.dart';

enum NavigationTab { home, vehicles, drivers, account }

class BottomNavigationState {
    final NavigationTab selectedTab;

  BottomNavigationState(this.selectedTab);
}



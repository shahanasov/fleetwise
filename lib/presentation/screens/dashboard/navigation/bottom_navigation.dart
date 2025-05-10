import 'package:fleetwise/presentation/bloc/navigation/bloc/bottom_navigation_bloc.dart';
import 'package:fleetwise/presentation/screens/dashboard/home/home_screen.dart';
import 'package:fleetwise/presentation/screens/dashboard/home/home_sliver.dart';
import 'package:fleetwise/presentation/widgets/vehicle_assign.dart';
import 'package:fleetwise/presentation/screens/dashboard/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final List<Widget> screens = [
    HomePage(),
    VehiclesScreen(),
    DriversScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: screens[state.selectedTab.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.selectedTab.index,
            onTap: (index) {
              final bloc = context.read<BottomNavigationBloc>();
              switch (index) {
                case 0:
                  bloc.add(NavigateToHome());
                  break;
                case 1:
                  bloc.add(NavigateToVehicles());
                  break;
                case 2:
                  bloc.add(NavigateToDrivers());
                  break;
                case 3:
                  bloc.add(NavigateToAccount());
                  break;
              }
            },
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_shipping),
                label: 'Vehicles',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Drivers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }
}



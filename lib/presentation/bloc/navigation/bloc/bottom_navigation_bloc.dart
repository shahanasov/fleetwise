import 'package:bloc/bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState(NavigationTab.home)) {
       on<NavigateToHome>((event, emit) => emit(BottomNavigationState(NavigationTab.home)));
    on<NavigateToVehicles>((event, emit) => emit(BottomNavigationState(NavigationTab.vehicles)));
    on<NavigateToDrivers>((event, emit) => emit(BottomNavigationState(NavigationTab.drivers)));
    on<NavigateToAccount>((event, emit) => emit(BottomNavigationState(NavigationTab.account)));
  }
}

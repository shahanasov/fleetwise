import 'package:fleetwise/presentation/bloc/navigation/bloc/bottom_navigation_bloc.dart';
import 'package:fleetwise/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavigationBloc(),
      child: MaterialApp(
        theme: ThemeData(colorSchemeSeed: Colors.white),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(), 
      ),
    );
  }
}

import 'package:fleetwise/services/authrepository.dart';
import 'package:fleetwise/presentation/bloc/auth/bloc/auth_bloc.dart';
import 'package:fleetwise/presentation/bloc/home/bloc/time_filter_bloc.dart';
import 'package:fleetwise/presentation/bloc/navigation/bloc/bottom_navigation_bloc.dart';
import 'package:fleetwise/presentation/screens/auth/login_screen.dart';
import 'package:fleetwise/presentation/screens/dashboard/navigation/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async { 
   WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://pvshxmxgqwybhoxgsqyb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB2c2h4bXhncXd5YmhveGdzcXliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY3MDQ4NjQsImV4cCI6MjA2MjI4MDg2NH0.0r-KK8FCwNPcg9yEDd3n65ewBFgsf2V9xpD-ZU6SFGs',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
          create: (_) => BottomNavigationBloc(),
        ),
        BlocProvider<TimeFilterBloc>(create: (_) => TimeFilterBloc()),
        BlocProvider(
          create: (context) {
            final bloc = AuthBloc(AuthRepository());
            bloc.add(CheckAuthStatusEvent()); //  triggers login check
            return bloc;
          },
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(colorSchemeSeed: Colors.white),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthBloc, AppAuthState>(
          builder: (context, state) {
            if (state is AuthLoading || state is AuthInitial) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is Authenticated) {
              return MainPage(); // or BottomNavigation()
            } else if (state is Unauthenticated) {
              return  LoginScreen();
            } else if (state is AuthError) {
              return Scaffold(
                body: Center(child: Text('Error: ${state.message}')),
              );
            }
            return const Scaffold(body: Center(child: Text('Unknown state')));
          },
        ),
      ),
    );
  }
}

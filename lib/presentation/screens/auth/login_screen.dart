import 'package:fleetwise/presentation/bloc/auth/bloc/auth_bloc.dart';
import 'package:fleetwise/presentation/screens/auth/otp_screen.dart';
import 'package:fleetwise/presentation/screens/dashboard/navigation/bottom_navigation.dart';
import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:fleetwise/presentation/widgets/appbar.dart';
import 'package:fleetwise/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  String completePhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 10,
              child: Image.asset('asset/images/Vector.png', width: 500),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: BlocConsumer<AuthBloc, AppAuthState>(
                listener: (context, state) {
                  if (state is AuthOtpSent) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => OtpVerificationScreen(
                          phoneNumber: completePhoneNumber,
                        ),
                      ),
                    );
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  } else if (state is Authenticated) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => MainPage()),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return LoginForm();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}
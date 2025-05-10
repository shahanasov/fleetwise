import 'package:fleetwise/presentation/bloc/auth/bloc/auth_bloc.dart';
import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:fleetwise/presentation/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController phoneController = TextEditingController();
  String completePhoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 120),
        logo(),
        const SizedBox(height: 30),
        Text(
          'Login or register',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.steelBlue,
          ),
        ),
        const SizedBox(height: 10),

        loginWidget(
          phoneController: phoneController,
          onPhoneChanged: (value) {
            setState(() => completePhoneNumber = value);
          },
        ),

        const SizedBox(height: 50),
        const Center(child: Text('By continuing, you agree to our')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Terms of Use',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xFF596D7E),
              ),
            ),
            Text(' and '),
            Text(
              'Privacy Policy',
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color(0xFF596D7E),
              ),
            ),
          ],
        ),
        const Spacer(),
        buildOtpButton(context),
      ],
    );
  }
   Widget buildOtpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (completePhoneNumber.isEmpty || completePhoneNumber.length < 10) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please enter a valid phone number")),
              );
              return;
            }

            context.read<AuthBloc>().add(SendOtpEvent(completePhoneNumber));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.grayblue,
            foregroundColor: AppColors.steelBlue,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text(
            'GET OTP',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}




import 'package:fleetwise/presentation/widgets/otp_header.dart';
import 'package:fleetwise/presentation/widgets/otp_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fleetwise/presentation/bloc/auth/bloc/auth_bloc.dart';
import 'package:fleetwise/presentation/screens/auth/name_input_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AppAuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => NameInputPage()),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('OTP verification failed: ${state.message}'),
            ),
          );
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                OtpHeader(phoneNumber: phoneNumber),
                const SizedBox(height: 32),
                OtpInputField(phoneNumber: phoneNumber),
                const SizedBox(height: 32),

                
                // // Resend section
                // Column(
                //   children: [
                //     // Text(
                //     //   _timeLeft > 0
                //     //       ? 'Didn\'t receive code? Resend in ${_formatTime(_timeLeft)}'
                //     //       : 'Didn\'t receive code?',
                //     //   style: const TextStyle(
                //     //     color: Colors.black54,
                //     //     fontSize: 15,
                //     //   ),
                //     // ),
                //     const SizedBox(height: 8),
                //     TextButton.icon(
                //       onPressed: _timeLeft > 0 || _isResending ? null : _resendOtp,
                //       icon: _isResending
                //           ? SizedBox(
                //               width: 16,
                //               height: 16,
                //               child: CircularProgressIndicator(
                //                 strokeWidth: 2,
                //                 valueColor: AlwaysStoppedAnimation<Color>(
                //                   _timeLeft > 0 ? Colors.grey : Colors.blue,
                //                 ),
                //               ),
                //             )
                //           : Icon(
                //               Icons.refresh,
                //               size: 16,
                //               color: _timeLeft > 0 ? Colors.grey : Colors.blue,
                //             ),
                //       label: Text(
                //         'Resend Code',
                //         style: TextStyle(
                //           color: _timeLeft > 0 ? Colors.grey : Colors.blue,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 24),
                const ChangeNumberButton(),
                const Spacer(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

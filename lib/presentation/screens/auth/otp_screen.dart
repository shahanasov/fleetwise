import 'package:fleetwise/presentation/screens/auth/name_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              // Subtitle with phone number
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Verify number',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                          children: [
                            TextSpan(),
                            TextSpan(text: 'OTP sent to '),
                            TextSpan(
                              text: ' +91 93622 53463',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Image.asset('asset/images/verification.png', width: 50),
                ],
              ),

              const SizedBox(height: 32),

              // OTP Input Field
              OTPTextField(
                // controller: _otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 12,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.white,
                  borderColor: Colors.grey.shade300,
                  focusBorderColor: Colors.blue,
                  enabledBorderColor: Colors.grey.shade300,
                ),
                onChanged: (pin) {
                  // Handle OTP changes
                },
                // onCompleted: (pin) {
                //   setState(() {
                //     _isOtpCompleted = true;
                //   });
                // },
              ),

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

              // Change number link
              TextButton.icon(
                onPressed: () {
                  // Handle change number action
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NameInputPage()));
                },
                icon: const Icon(Icons.phone, size: 16),
                label: const Text('Change your mobile number'),
              ),

              const Spacer(),

              // Verify Button
              // SizedBox(
              //   width: double.infinity,
              //   height: 48,
              //   child: ElevatedButton(
              //     onPressed:
              //     // _isOtpCompleted
              //     //     ?
              //     () {
              //       // Handle verification
              //     },
              //     // : null,
              //     style: ElevatedButton.styleFrom(
              //       // backgroundColor: _isOtpCompleted ? Colors.blue : Colors.grey.shade300,
              //       // foregroundColor: _isOtpCompleted ? Colors.white : Colors.grey,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //     child: const Text(
              //       'Verify',
              //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              //     ),
              //   ),
              // ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

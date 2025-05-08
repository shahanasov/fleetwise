import 'package:fleetwise/presentation/screens/auth/otp_screen.dart';
import 'package:fleetwise/presentation/widgets/animated_logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: SafeArea(
        child: Stack(
          children: [
            // Background road design
            Positioned(
              top: 0,
              right: 0,
              left: 10,
              child: Image.asset('asset/images/Vector.png', width: 500),
            ),

            // Main content
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120), // Space at the top
                  // Logo and text
                  Row(
                    children: [
                      AnimatedLogo(color: Colors.black,),
                      const SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Fleet",
                              style: GoogleFonts.inter(
                                color: Color(
                                  0xFF122E46,
                                ), // Deep navy blue color
                                fontSize: 48,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                                height: 1.0,
                                letterSpacing: 0,
                              ),
                            ),
                            TextSpan(
                              text: "Wise",
                              style: GoogleFonts.inter(
                                color: Color(
                                  0xFF122E46,
                                ), // Deep navy blue color
                                fontSize: 48,
                                fontWeight: FontWeight.w700, // Bold (700)
                                height: 1.0,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30), // Space before login text

                  Text(
                    'Login or register',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF596D7E), //medium slate blue-gray color
                    ),
                  ),

                  // Rest of your login form would go here
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ), // White border = invisible
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ), // White border when focused too
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Text('by continuing, you agree to our'),
                  Row(
                    children: [
                      Text(
                        'Terms of Use',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          // Optional: customize the underline
                          decorationColor: Color(0xFF596D7E), // underline color
                          decorationThickness: 2.0, // underline thickness
                          decorationStyle: TextDecorationStyle.solid,
                          height: 1, // dashed/dotted/solid/wavy
                        ),
                      ),
                      Text(' and '),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          // Optional: customize the underline
                          decorationColor: Color(0xFF596D7E), // underline color
                          decorationThickness: 2.0, // underline thickness
                          height: 1,
                          textBaseline: TextBaseline.alphabetic,
                          decorationStyle:
                              TextDecorationStyle
                                  .solid, // dashed/dotted/solid/wavy
                        ),
                      ),
                    ],
                  ),
                    const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OtpVerificationScreen(),
                            ),
                          );
                          // Handle submit action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFDAE6F1),
                          foregroundColor: const Color(0xFF486A8F),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'GET OTP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

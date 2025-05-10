
import 'package:fleetwise/presentation/screens/auth/otp_screen.dart';
import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:fleetwise/presentation/widgets/animated_logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

Widget appBar() {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
    child: Center(
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Fleet',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(
              text: 'Wise',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget profile() {
  return // User profile section
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
    child: Row(
      children: [
        AnimatedLogo(color: Colors.white),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Namaste 🙏',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            // Text(
            //   'Raman Ji',
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
      //        FutureBuilder<String?>(
      // future: AuthRepository().fetchUserName(),
      // builder: (context, snapshot) {
      //   if (snapshot.connectionState == ConnectionState.waiting) {
      //     return const CircularProgressIndicator();
      //   } else if (snapshot.hasError) {
      //     return const Text('Error loading name');
      //   } else {
      //     final name = snapshot.data ?? 'Guest';
      //     return Text(name,
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold,
      //         ), );
      //   }
      // },
      //        )
          ],
        ),
      ],
    ),
  );
}

Widget submitButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 24.0),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          //  context.read<AuthBloc>().add(
          //           SendOtpEvent(phoneController.text),
          //         );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpVerificationScreen(phoneNumber: ''),
            ),
          );
          // Handle submit action
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

Widget loginWidget(
 {required TextEditingController phoneController,
required Function(String) onPhoneChanged,}
) {
  return IntlPhoneField(
    showCountryFlag: false,
    initialCountryCode: 'IN',
    controller: phoneController,
    disableLengthCheck: true,
    onChanged: (phone) {
      onPhoneChanged(phone.completeNumber); // Send to parent
      // print(phone.completeNumber);
    },
    decoration: InputDecoration(
      // prefix: Text('|'),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white), // White border = invisible
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ), // White border when focused too
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

Widget logo() {
  return Row(
    children: [
      AnimatedLogo(color: Colors.black),
      const SizedBox(width: 10),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Fleet",
              style: GoogleFonts.inter(
                color: Color(0xFF122E46), // Deep navy blue color
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
                color: Color(0xFF122E46), // Deep navy blue color
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
  );
}

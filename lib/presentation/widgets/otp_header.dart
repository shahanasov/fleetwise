import 'package:flutter/material.dart';

class OtpHeader extends StatelessWidget {
  final String phoneNumber;
  const OtpHeader({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
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
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                children: [
                  const TextSpan(text: 'OTP sent to '),
                  TextSpan(
                    text: phoneNumber,
                    style: const TextStyle(
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
    );
  }
}

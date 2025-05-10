import 'package:fleetwise/presentation/screens/auth/name_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fleetwise/presentation/bloc/auth/bloc/auth_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpInputField extends StatelessWidget {
  final String phoneNumber;
  const OtpInputField({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 50,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      outlineBorderRadius: 12,
      otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        borderColor: Colors.grey.shade300,
        focusBorderColor: Colors.blue,
        enabledBorderColor: Colors.grey.shade300,
      ),
      onCompleted: (pin) {
        BlocProvider.of<AuthBloc>(context).add(
          VerifyOtpEvent(pin, phoneNumber, ''),
        );
      },
    );
  }
}



class ChangeNumberButton extends StatelessWidget {
  const ChangeNumberButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => NameInputPage()),
        );
      },
      icon: const Icon(Icons.phone, size: 16),
      label: const Text('Change your mobile number'),
    );
  }
}


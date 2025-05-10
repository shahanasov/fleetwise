import 'package:flutter/material.dart';

Widget documentUpload() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Aadhaar Card Front*',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
      const SizedBox(height: 8),
      Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(children: [const Expanded(child: SizedBox()), button()]),
      ),
    ],
  );
}

Widget button() {
  return OutlinedButton(
    onPressed: () {},
    style: TextButton.styleFrom(foregroundColor: const Color(0xFF0A2540)),
    child: const Text(
      'Upload',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),
  );
}

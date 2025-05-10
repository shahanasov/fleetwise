import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget iconbutton({required String text}) {
  return ElevatedButton.icon(
    onPressed: () {},
    label: Text(
      'Add first $text',
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
    icon: Icon(Icons.add),

    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.backgroundLight,
      foregroundColor: AppColors.backgroundDark,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      minimumSize: const Size(100, 56),
    ),
  );
}
import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfitTrackingWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final List<Color> colors;
  const ProfitTrackingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 240,
        height: 200,
        decoration: BoxDecoration(
          gradient:  LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.purewhite, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chart and PROFIT text row
              Image.asset(image, width: 50),
              const SizedBox(height: 16),

              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF1A3651),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              // Description text
              Text(
                subtitle,
                style: TextStyle(color: Color(0xFF4A6584), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

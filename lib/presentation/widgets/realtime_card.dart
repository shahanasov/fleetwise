import 'package:fleetwise/presentation/screens/dashboard/pages/tracking_screen.dart';
import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => TrackingScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.blueGrey.shade900, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // "Track Your Profit & Loss" header
              const Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  'Track Your Profit & Loss in',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Real-Time!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Phone mockup image
              Image.asset('asset/images/phone.png',),

              // Bottom tagline
              const Padding(
                padding: EdgeInsets.only(bottom: 30.0),
                child: Text(
                  'See your profit and loss grow\nas your vehicle runs!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:fleetwise/presentation/widgets/add_first.dart';
import 'package:fleetwise/presentation/widgets/appbar.dart';
import 'package:fleetwise/presentation/widgets/grid.dart';
import 'package:fleetwise/presentation/widgets/realtime_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> trackingWidgets = [
      ProfitTrackingWidget(
        image: 'asset/images/profit.png',
        title: 'Track Your Earnings:',
        subtitle: 'Know how much your vehicle are making.',
        colors: [Color(0xFFDCFFD6), Color(0xFFD6E8FF)],
      ),
      ProfitTrackingWidget(
        image: 'asset/images/vehicle.png',
        title: 'Monitor Vehicle Health:',
        subtitle: 'Get alerts for maintenance & challans',
        colors: [AppColors.card1color1, AppColors.card1color2],
      ),
      ProfitTrackingWidget(
        image: 'asset/images/badge.png',
        title: 'Manage Drivers Easily:',
        subtitle: 'Assign & track drivers in one place.',
        colors: [AppColors.card2color1, AppColors.card2color2],
      ),
      ProfitTrackingWidget(
        image: 'asset/images/page.png',
        title: 'Stay on Top of Expenses',
        subtitle: 'See fuel, toll, and other costs clearly',
        colors: [AppColors.card3color1, AppColors.card3color2],
      ),
      //  tracking widgets
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar
          SliverToBoxAdapter(
            // pinned: false,
            // expandedHeight: MediaQuery.of(context).size.height * 0.85,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.blue, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.0, 0.40], // 🔥 this makes black start from 25%
                ),
              ),
              // ✅ Give height if this is in a flexible space
              height: MediaQuery.of(context).size.height * 0.85,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    child: Image.asset(
                      'asset/images/Display.png',
                      width: double.infinity,
                      fit:
                          BoxFit.cover, 
                      color:
                          const Color.fromARGB(
                            255,
                            0,
                            0,
                            0,
                          ).withValues(), // apply tint
                      colorBlendMode: BlendMode.srcATop,
                    ),
                  ),
                  SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // App header with logo and name
                        appBar(),

                        //  user Profile section
                        profile(),

                        // Main content card
                        MainCard(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            iconbutton(text: 'Vehicle'),
                            iconbutton(text: 'Driver'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // SliverList
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: AppColors.backgroundLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'What you get on FleetWise:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700, // Bold weight
                          color: AppColors.button,
                          letterSpacing:
                              -0.5, // Slightly tighter letter spacing
                          height: 1.2, // Line height
                        ),
                      ),
                    ),
                    GridView(
                      padding: EdgeInsets.all(8),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      physics:
                          NeverScrollableScrollPhysics(), 
                      shrinkWrap: true, 
                      children: trackingWidgets,
                    ),
                  ],
                ),
              ),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

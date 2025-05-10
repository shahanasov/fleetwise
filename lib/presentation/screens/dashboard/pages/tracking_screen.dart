import 'package:fleetwise/presentation/bloc/home/bloc/time_filter_bloc.dart';
import 'package:fleetwise/presentation/widgets/appbar.dart';
import 'package:fleetwise/presentation/widgets/background.dart';
import 'package:fleetwise/presentation/widgets/filter_screen.dart';
import 'package:fleetwise/presentation/widgets/vehicle_assign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<TimeFilterBloc, TimeFilterState>(
              builder: (context, state) {
                // Determine the background gradient based on the selected filter
                final gradient = getBackgroundGradient(state.selectedFilter);
                return Container(
                  width: double.infinity,height: MediaQuery.of(context).size.height * 0.85,
                  decoration: BoxDecoration(gradient: gradient),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          'asset/images/Display.png',
                          width: double.infinity,
                          fit: BoxFit.cover, // ✅ Helps in fitting the image properly
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
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //  user Profile section
                              profile(),
            
                              const SizedBox(height: 24),
            
                              // Time period selector
                              TimeFilterSelector(),
            
                              const SizedBox(height: 24),
                              FilteredScreen(),
                              
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => Expanded(child: VehicleOverviewScreen())))
        ],
      ),

    
    );
  }
}




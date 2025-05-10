// import 'package:fleetwise/presentation/screens/dashboard/pages/tracking_screen.dart';
// import 'package:fleetwise/presentation/theme/app_colors.dart';
// import 'package:fleetwise/presentation/widgets/appbar.dart';
// import 'package:fleetwise/presentation/widgets/grid.dart';
// import 'package:flutter/material.dart';
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> trackingWidgets = [
//       const ProfitTrackingWidget(),
//       const ProfitTrackingWidget(),
//       const ProfitTrackingWidget(),
//       const ProfitTrackingWidget(),
//       // You can add more widgets here or create different types of tracking widgets
//     ];
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 33, 56, 121),

//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [AppColors.blue, Colors.black],
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   stops: [0.0, 0.40], // 🔥 this makes black start from 25%
//                 ),
//               ),
//               // ✅ Give height if this is in a flexible space
//               height: MediaQuery.of(context).size.height * 0.85,
//               width: double.infinity,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 0,
//                     right: 0,
//                     left: 0,
//                     child: Image.asset(
//                       'asset/images/Display.png',
//                       width: double.infinity,
//                       fit:
//                           BoxFit.cover, // ✅ Helps in fitting the image properly
//                       color:
//                           const Color.fromARGB(
//                             255,
//                             0,
//                             0,
//                             0,
//                           ).withValues(), // apply tint
//                       colorBlendMode: BlendMode.srcATop,
//                     ),
//                   ),
//                   SafeArea(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         // App header with logo and name
//                         appBar(),

//                         //  user Profile section
//                         profile(),

//                         // Main content card
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => TrackingScreen(),
//                               ),
//                             );
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 12.0,
//                               vertical: 10.0,
//                             ),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.black87,
//                                 borderRadius: BorderRadius.circular(20),
//                                 border: Border.all(
//                                   color: Colors.blueGrey.shade900,
//                                   width: 1,
//                                 ),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   // "Track Your Profit & Loss" header
//                                   const Padding(
//                                     padding: EdgeInsets.only(top: 16.0),
//                                     child: Text(
//                                       'Track Your Profit & Loss in',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ),
//                                   const Padding(
//                                     padding: EdgeInsets.only(bottom: 20.0),
//                                     child: Text(
//                                       'Real-Time!',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 26,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),

//                                   // Phone mockup image
//                                   Image.asset('asset/images/phone.png'),

//                                   // Bottom tagline
//                                   const Padding(
//                                     padding: EdgeInsets.only(bottom: 30.0),
//                                     child: Text(
//                                       'See your profit and loss grow\nas your vehicle runs!',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             iconbutton(text: 'Vehicle'),
//                             iconbutton(text: 'Driver'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             Container(
//               color: AppColors.backgroundLight,
//               child: GridView(
//                 padding: EdgeInsets.all(8),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 1,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 physics:
//                     NeverScrollableScrollPhysics(), // disables grid's own scroll
//                 shrinkWrap: true, // makes it take only needed height
//                 children: trackingWidgets,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// Widget grid() {
//   return GridTile(
//     header: Text('...'),
//     footer: Text('What you get on FleetWise:'),
//     child: Image.asset('asset/images/profit.png', height: 20, width: 10),
//   );
// }

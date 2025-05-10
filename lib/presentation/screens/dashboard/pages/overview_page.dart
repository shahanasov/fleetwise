import 'package:flutter/material.dart';


// Vehicle Model Class
class VehicleModel {
  final String vehicleNumber;
  final String status;
  final Color statusColor;
  final String driverName;
  final String profit;
  final String cost;
  final String earnings;
  final double progressValue;
  final Color progressColor;
  final String notificationTime;
  final bool hasAlert;

  VehicleModel({
    required this.vehicleNumber,
    required this.status,
    required this.statusColor,
    required this.driverName,
    required this.profit,
    required this.cost,
    required this.earnings,
    required this.progressValue,
    required this.progressColor,
    required this.notificationTime,
    required this.hasAlert,
  });
}


class VehiclesOverviewPage extends StatelessWidget {
  // Sample vehicle data
  final List<VehicleModel> vehicles = [
    VehicleModel(
      vehicleNumber: "UP 12 AK 3532",
      status: "IDLE",
      statusColor: Colors.blue,
      driverName: "Akash Sharma",
      profit: "₹74,304",
      cost: "₹3,83,380",
      earnings: "₹4,57,684",
      progressValue: 0.7,
      progressColor: Colors.teal,
      notificationTime: "12:53 AM",
      hasAlert: true,
    ),
    VehicleModel(
      vehicleNumber: "UP 12 AK 3248",
      status: "RUNNING",
      statusColor: Colors.green,
      driverName: "Akash Sharma",
      profit: "₹74,304",
      cost: "₹3,83,380",
      earnings: "₹4,57,684",
      progressValue: 0.3,
      progressColor: Colors.red,
      notificationTime: "",
      hasAlert: false,
    ),
  ];

  VehiclesOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter tabs
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterTab("All (20)", true),
                _buildFilterTab("Running (02)", false),
                _buildFilterTab("Idle (01)", false),
                _buildFilterTab("Inactive (05)", false),
              ],
            ),
          ),
          
          // Vehicle Cards
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: 1,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildVehicleCard(vehicles[index]);
              },
            ),
          ),
        ],
      )
    ;
  }

  Widget _buildFilterTab(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black54,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildVehicleCard(VehicleModel vehicle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      vehicle.vehicleNumber,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: vehicle.statusColor.withValues(),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        vehicle.status,
                        style: TextStyle(
                          color: vehicle.statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8F5F1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    vehicle.profit,
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Driver
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(Icons.person_outline, color: Colors.grey, size: 18),
                SizedBox(width: 8),
                Text(
                  vehicle.driverName,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          
          // Divider
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Divider(height: 1, color: Colors.grey.withValues()),
          ),
          
          // Financial data
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cost section
                Text(
                  "Cost",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  vehicle.cost,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                
                SizedBox(height: 16), // Space between cost and earnings
                
                // Earnings section
                Text(
                  "Earnings",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: vehicle.progressValue,
                    backgroundColor: Colors.grey.withValues(),
                    valueColor: AlwaysStoppedAnimation<Color>(vehicle.progressColor),
                    minHeight: 8,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  vehicle.earnings,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          
          // Alert
          if (vehicle.hasAlert)
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.red.withValues(),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning_amber_rounded, color: Colors.red, size: 20),
                      SizedBox(width: 8),
                      Text(
                        "SOS call made at ${vehicle.notificationTime} by driver",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward, color: Colors.grey, size: 18),
                ],
              ),
            ),
          
          SizedBox(height: vehicle.hasAlert ? 0 : 16),
        ],
      ),
    );
  }
}
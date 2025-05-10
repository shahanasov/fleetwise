import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';

class VehicleOverviewScreen extends StatelessWidget {
  const VehicleOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with vehicles overview
          Row(
            children: [
              Icon(
                Icons.local_shipping,
                size: 24,
                color: const Color(0xFF1A3350),
              ),
              const SizedBox(width: 8),
              Text(
                'Vehicles Overview',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1A3350),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Tabs for filtering
          Row(
            spacing: 4,
            children: [
              _buildFilterTab('All (26)', true),

              _buildFilterTab('Running (02)', false),

              _buildFilterTab('Idle (01)', false),

              _buildFilterTab('Inactive (05)', false),
            ],
          ),
          const SizedBox(height: 20),

          // Vehicle card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                // Top section with vehicle number and profit
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'UP 12 AK 3532',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A3350),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE8F0FF),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'IDLE',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF3466E8),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6F7F1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '₹74,304',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF00A67E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Driver section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.person, color: Colors.grey, size: 20),
                      const SizedBox(width: 8),
                      const Text(
                        'Akash Sharma',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const Spacer(),
                      const Text(
                        'Profit / Loss',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 24),

                // Cost row
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Text(
                        'Cost',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(width: 72),

                      /// Flexible bar container
                     SizedBox(width: 100,
                        child: Container(
                          height: 12,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 0.98, // Example: show 60% filled bar
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.backgroundDark,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            '₹3,83,380',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A3350),
                            ),
                          ),
                          Text(
                            '₹1,200',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Earnings row
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      const Text(
                        'Earnings',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(width: 48),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              height: 10,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            Container(
                              height: 10,
                              width: 230,
                              decoration: BoxDecoration(
                                color: const Color(0xFF00A67E),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            '₹4,57,684',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1A3350),
                            ),
                          ),
                          Text(
                            '₹1,200',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const Divider(height: 16),

                // SOS section
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    children: [
                      Image.asset('asset/images/Siren Icon.png'),
                      const SizedBox(width: 8),
                      Text(
                        'SOS call made at 12:53 AM by driver',
                        style: TextStyle(fontSize: 14, color: Colors.red[400]),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1A3350) : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          color: isActive ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}

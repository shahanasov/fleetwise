import 'package:fleetwise/core/enums/time_filter.dart';
import 'package:fleetwise/presentation/bloc/home/bloc/time_filter_bloc.dart';
import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeFilterSelector extends StatelessWidget {
  const TimeFilterSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeFilterBloc, TimeFilterState>(
      builder: (context, state) {
        final selected = state.selectedFilter;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(context, 'Yesterday', TimeFilter.yesterday, selected),
            const SizedBox(width: 8),
            buildButton(context, 'Today', TimeFilter.today, selected),
            const SizedBox(width: 8),
            buildButton(context, 'Monthly', TimeFilter.monthly, selected),
          ],
        );
      },
    );
  }

  Widget buildButton(
    BuildContext context,
    String label,
    TimeFilter filter,
    TimeFilter selected,
  ) {
    final isSelected = filter == selected;

    return GestureDetector(
      onTap:
          () => context.read<TimeFilterBloc>().add(TimeFilterSelected(filter)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.backgroundLight : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color:
                isSelected
                    ? AppColors.backgroundDark
                    : AppColors.backgroundLight,
          ),
        ),
      ),
    );
  }
}

class FilteredScreen extends StatelessWidget {
  const FilteredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeFilterBloc, TimeFilterState>(
      builder: (context, state) {
        switch (state.selectedFilter) {
          case TimeFilter.yesterday:
            return profitshows();

          case TimeFilter.today:
            return profitshows();
          case TimeFilter.monthly:
            return profitshows();
        }
      },
    );
  }
}

Widget profitshows() {
  return Column(
    children: [
      // Profit/Loss section
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Profit/Loss',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.backgroundLight,
                ),
              ),
              Text(
                'Fri, 7 Mar',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.backgroundLight,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                '₹1,274',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00B894), // Green color
                ),
              ),
              Text(
                'predicted: ₹1,523',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),

      const SizedBox(height: 16),
      cards(),
      cards(),
      cards(),
      cards(), cards(),
    ],
  );
}

Widget cards() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF00B894),
        child: const Icon(Icons.currency_rupee, color: Colors.white, size: 20),
      ),
      title: Text(
        'Earnings',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        'Total revenue generated',
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Text(
            '₹1,523',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'predicted: ₹1,200',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    ),
  );
}

import 'package:fleetwise/core/enums/time_filter.dart';
import 'package:fleetwise/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';


LinearGradient getBackgroundGradient(TimeFilter selectedFilter) {
  switch (selectedFilter) {
    case TimeFilter.yesterday:
      return LinearGradient(
        colors: [AppColors.teal, AppColors.backgroundDark],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.40],
      );
    case TimeFilter.today:
      return LinearGradient(
        colors: [AppColors.blue, AppColors.backgroundDark],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.40],
      );
    case TimeFilter.monthly:
      return LinearGradient(
        colors: [AppColors.taupe, AppColors.backgroundDark],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.40],
      );
  }
}

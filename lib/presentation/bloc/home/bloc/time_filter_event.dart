part of 'time_filter_bloc.dart';

class TimeFilterEvent {}

class TimeFilterSelected extends TimeFilterEvent {
  final TimeFilter filter;

  TimeFilterSelected(this.filter);
}

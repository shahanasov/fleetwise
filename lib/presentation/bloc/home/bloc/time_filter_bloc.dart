import 'package:bloc/bloc.dart';
import 'package:fleetwise/core/enums/time_filter.dart';


part 'time_filter_event.dart';
part 'time_filter_state.dart';

class TimeFilterBloc extends Bloc<TimeFilterEvent, TimeFilterState> {
  TimeFilterBloc() : super(TimeFilterState(selectedFilter: TimeFilter.today)) {
    on<TimeFilterSelected>((event, emit) {
      emit(TimeFilterState(selectedFilter: event.filter));
    });
  }
}

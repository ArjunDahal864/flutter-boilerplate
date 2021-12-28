import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_option_one_event.dart';
part 'dashboard_option_one_state.dart';

class DashboardOptionOneBloc extends Bloc<DashboardOptionOneEvent, DashboardOptionOneState> {
  DashboardOptionOneBloc() : super(DashboardOptionOneInitial()) {
    on<DashboardOptionOneEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

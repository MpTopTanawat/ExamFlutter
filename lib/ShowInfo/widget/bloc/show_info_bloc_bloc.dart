// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'show_info_bloc_event.dart';
part 'show_info_bloc_state.dart';

class ShowInfoBlocBloc
    extends Bloc<DropdownProvinceEvent, DropdownProvinceState> {
  ShowInfoBlocBloc() : super(const DropdownProvinceState()) {
    // on<ShowInfoBlocEvent>((event, emit) {});
    on<DropdownProvinceEvent>(_updateProvinceName);
  }

  void _updateProvinceName(
      DropdownProvinceEvent event, Emitter<DropdownProvinceState> emit) {
    emit(state.emitState(province: event.province));
  }
}

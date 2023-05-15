// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'feed_bloc_event.dart';
part 'feed_bloc_state.dart';

class FeedBlocBloc extends Bloc<FeedProvinceEvent, FeedProvinceState> {
  FeedBlocBloc() : super(const FeedProvinceState()) {
    on<FeedProvinceEvent>(_updateFeed);
  }

  void _updateFeed(FeedProvinceEvent event, Emitter<FeedProvinceState> emit) {
    emit(state.emitState(nameDataList: event.nameDataList, index: event.index));
  }
}

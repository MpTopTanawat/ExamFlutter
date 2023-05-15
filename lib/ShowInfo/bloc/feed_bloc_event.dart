// ignore_for_file: override_on_non_overriding_member

part of 'feed_bloc_bloc.dart';

@immutable
abstract class FeedBlocEvent {}

class FeedProvinceEvent extends FeedBlocEvent {
  final List? nameDataList;
  final int? index;

  FeedProvinceEvent({this.nameDataList, this.index = 0});

  @override
  List<Object> get props => [nameDataList ?? [], index ?? 0];
}

part of 'feed_bloc_bloc.dart';

@immutable
abstract class FeedBlocState {}

class FeedBlocInitial extends FeedBlocState {}

class FeedProvinceState extends Equatable {
  final List? nameDataList;
  final int? index;

  const FeedProvinceState({this.nameDataList, this.index});

  FeedProvinceState emitState({List? nameDataList, int? index}) {
    return FeedProvinceState(
        nameDataList: nameDataList ?? this.nameDataList,
        index: index ?? this.index);
  }

  @override
  List<Object> get props => [nameDataList ?? [], index ?? 0];
}

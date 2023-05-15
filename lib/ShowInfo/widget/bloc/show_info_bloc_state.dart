part of 'show_info_bloc_bloc.dart';

abstract class ShowInfoBlocState {}

class ShowInfoBlocInitial extends ShowInfoBlocState {}

class DropdownProvinceState extends Equatable {
  final String? province;

  const DropdownProvinceState({this.province = ''});

  DropdownProvinceState emitState({String? province, List? nameDataList}) {
    return DropdownProvinceState(province: province ?? this.province);
  }

  @override
  List<Object> get props => [province ?? 'กรุงเทพมหานคร'];
}

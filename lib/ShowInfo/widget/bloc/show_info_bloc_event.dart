// ignore_for_file: override_on_non_overriding_member

part of 'show_info_bloc_bloc.dart';

@immutable
abstract class ShowInfoBlocEvent {}

class DropdownProvinceEvent extends ShowInfoBlocEvent {
  final String? province;

  DropdownProvinceEvent({this.province});

  @override
  List<Object> get props => [province ?? 'กรุงเทพมหานคร'];
}

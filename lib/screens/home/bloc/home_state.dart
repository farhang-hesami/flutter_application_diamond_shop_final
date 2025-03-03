part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}

//////////////////////////////////////////////
class HomeSuccess extends HomeState {
  final HomeModel homeModel;
  HomeSuccess(this.homeModel);
}

class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}

class HomeLoading extends HomeState {}

part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomePageChanged extends HomeEvent {
  final int index;
  HomePageChanged(this.index);
}

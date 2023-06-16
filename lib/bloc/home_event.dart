part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}


class Login extends HomeEvent {
  final String username;

  Login(this.username);
}
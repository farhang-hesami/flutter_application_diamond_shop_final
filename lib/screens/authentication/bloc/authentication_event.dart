part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginButtonClicked extends AuthenticationEvent {
  final Authentication authentication;
  LoginButtonClicked(this.authentication);
}

class RegisterButtonClicked extends AuthenticationEvent {
  final Authentication authentication;
  RegisterButtonClicked(this.authentication);
}

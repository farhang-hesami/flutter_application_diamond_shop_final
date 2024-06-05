part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

//////// LOGIN
class LoginLoading extends AuthenticationState {}

class LoginError extends AuthenticationState {
  final String error;
  LoginError(this.error);
}

class LoginSuccess extends AuthenticationState {
  final String accesToken;
  LoginSuccess(this.accesToken);
}

/////////// REGISTER
class RegisterLoading extends AuthenticationState {}

class RegisterError extends AuthenticationState {
  final String error;
  RegisterError(this.error);
}

class RegisterSuccess extends AuthenticationState {}

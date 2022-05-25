part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticating extends AuthState {}

class LogInAuthenticated extends AuthState {
  final Map data;

  LogInAuthenticated(this.data);
}

class SignUpSuccess extends AuthState {}

class AuthenticationError extends AuthState {
  final String message;

  AuthenticationError(this.message);
}

class EmailSent extends AuthState {}

class OtpVerified extends AuthState {}

class PasswordReset extends AuthState {
  final Map data;

  PasswordReset(this.data);
}

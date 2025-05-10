part of 'auth_bloc.dart';

abstract class AppAuthState {}

final class AuthInitial extends AppAuthState {}

class AuthLoading extends AppAuthState {}

class AuthOtpSent extends AppAuthState {}

class Authenticated extends AppAuthState {}

class Unauthenticated extends AppAuthState {}

class AuthError extends AppAuthState {
  final String message;
  AuthError(this.message);
}

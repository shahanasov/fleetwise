part of 'auth_bloc.dart';

abstract class AuthEvent {}

class CheckAuthStatusEvent extends AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final String phoneNumber;

  SendOtpEvent(this.phoneNumber);
}

class VerifyOtpEvent extends AuthEvent {
  final String phoneNumber;
  final String otp;
  final String requestId;

  VerifyOtpEvent(this.phoneNumber, this.otp, this.requestId);
}

class LogoutEvent extends AuthEvent {}

import 'package:bloc/bloc.dart';
import 'package:fleetwise/services/authrepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AppAuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    
    // ✅ Check token on app start
    on<CheckAuthStatusEvent>((event, emit) async {
      emit(AuthLoading());
      final token = await authRepository.getJWT();
      if (token != null && await authRepository.isTokenValid(token)) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    });

    // ✅ Send OTP
    on<SendOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.sendOTP(phoneNumber: event.phoneNumber);
        emit(AuthOtpSent()); // State when OTP is sent successfully
      } catch (e) {
        emit(AuthError("Failed to send OTP: ${e.toString()}"));
      }
    });

    // ✅ Verify OTP and store JWT
    on<VerifyOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await authRepository.verifyOTP(
          phoneNumber: event.phoneNumber,
          otp: event.otp,
        );
        if (token != null) {
          emit(Authenticated());
        } else {
          emit(AuthError("Login failed. Token is null."));
        }
      } catch (e) {
        emit(AuthError("Failed to verify OTP: ${e.toString()}"));
      }
    });

    // ✅ Logout
    on<LogoutEvent>((event, emit) async {
      await authRepository.logout();
      emit(Unauthenticated());
    });
  }
}

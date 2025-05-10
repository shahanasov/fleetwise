import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepository {
  final supabase = Supabase.instance.client;
  final storage = FlutterSecureStorage();

  // ✅ Check if the token is valid or expired
  Future<bool> isTokenValid(String token) async {
    try {
      bool isExpired = JwtDecoder.isExpired(token);
      return !isExpired;
    } catch (e) {
      log("Error checking token expiration: $e");
      return false;
    }
  }

  // ✅ Send OTP
  Future<void> sendOTP({required String phoneNumber}) async {
    print(" in AUTH $phoneNumber");
    try {
      await Supabase.instance.client.auth.signInWithOtp(
        phone: phoneNumber,
        data: {"name": 'User'},
      );
      // OTP sent successfully
    } on AuthException catch (error) {
      log("AuthException: ${error.message}");
      throw Exception("Failed to send OTP: ${error.message}");
    } catch (error) {
      log('Unexpected error: $error');
      throw Exception('Unexpected error: $error');
    }
  }

  // ✅ Verify OTP and return JWT token
  Future<String?> verifyOTP({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      final response = await Supabase.instance.client.auth.verifyOTP(
        phone: phoneNumber,
        token: otp,
        type: OtpType.sms,
      );

      final session = response.session;
      final user = response.user;

      if (session != null) {
        final jwt = session.accessToken;
        await storage.write(key: 'jwt_token', value: jwt); // Save token securely
        log('User ID: ${user?.id}');
        return jwt;
      }

      return null; // Return null if session is not valid
    } on AuthException catch (error) {
      log("AuthException: ${error.message}");
      throw Exception("Failed to verify OTP: ${error.message}");
    } catch (error) {
      log('Unexpected error: $error');
      throw Exception('Unexpected error: $error');
    }
  }

  // ✅ Retrieve stored JWT token
  Future<String?> getJWT() async {
    return await storage.read(key: 'jwt_token');
  }

  // ✅ Logout and clear the token
  Future<void> logout() async {
    await supabase.auth.signOut();
    await storage.delete(key: 'jwt_token');
  }

  // ✅ Update the user's name
  Future<void> updateUserName(String name) async {
    final user = supabase.auth.currentUser;
    if (user == null) throw Exception('No user is currently logged in');

    final response = await supabase.auth.updateUser(
      UserAttributes(data: {'name': name}),
    );

    if (response.user == null) {
      throw Exception('Failed to update user name');
    }
  }

  // ✅ Fetch the user's name
  Future<String?> fetchUserName() async {
    final user = supabase.auth.currentUser;
    return user?.userMetadata?['name'];
  }
}

import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:resume_crafter/app/appwrite_api_service.dart';
import 'package:resume_crafter/data/auth/service/auth_service.dart';
import 'package:resume_crafter/data/auth/service/supported_oauth_services.dart';

@Injectable(as: AuthService)
class AppwriteAuthService implements AuthService {
  AppwriteAuthService({required this.apiService});

  final AppwriteApiService apiService;

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await apiService.account.createEmailSession(
        email: email,
        password: password,
      );
    } catch (e, stack) {
      log('Error while sign in', error: e, stackTrace: stack);
    }
  }

  @override
  Future<void> signInOAuth({
    required SupportedOAuthServices oAuthService,
  }) async {
    try {
      final result = await apiService.account.createOAuth2Session(
        provider: oAuthService.name,
        success: !kIsWeb ? null : 'http://localhost:8000/auth.html',
      );
      log(result.toString());
    } catch (e, stack) {
      log(
        'Error while sign in with $oAuthService',
        error: e,
        stackTrace: stack,
      );
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await apiService.account.deleteSession(sessionId: 'current');
    } catch (e, stack) {
      log('Error while sign out', error: e, stackTrace: stack);
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    await apiService.account.create(
      userId: ID.unique(),
      email: email,
      password: password,
    );
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      return await apiService.account.get();
    } catch (e, stack) {
      log('getCurrentUser error', error: e, stackTrace: stack);
      return null;
    }
  }
}

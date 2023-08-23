import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
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
    await apiService.account.createEmailSession(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signInOAuth({
    required SupportedOAuthServices oAuthService,
  }) async {
    final result = await apiService.account
        .createOAuth2Session(provider: oAuthService.name);
    log(result.toString());
  }

  @override
  Future<void> signOut() async {
    await apiService.account.deleteSession(sessionId: 'current');
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
  Future<User> getCurrentUser() async {
    return apiService.account.get();
  }
}

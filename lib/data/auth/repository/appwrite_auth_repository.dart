import 'dart:developer';

import 'package:appwrite/models.dart';
import 'package:injectable/injectable.dart';
import 'package:resume_crafter/data/auth/repository/auth_repository.dart';
import 'package:resume_crafter/data/auth/service/auth_service.dart';
import 'package:resume_crafter/data/auth/service/supported_oauth_services.dart';

@Injectable(as: AuthRepository)
class AppwriteAuthRepository implements AuthRepository {
  AppwriteAuthRepository({required this.authService});

  final AuthService authService;
  //TODO: Add app model for user and not use appwrite model in repository
  User? _cachedUser;

  @override
  Future<void> signIn({required String email, required String password}) {
    return authService.signIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signInOAuth({
    required SupportedOAuthServices oAuthService,
  }) async {
    await authService.signInOAuth(oAuthService: oAuthService);
    final account = await getCurrentUser();
    log(account.toString());
  }

  @override
  Future<void> signOut() {
    return authService.signOut();
  }

  @override
  Future<void> signUp({required String email, required String password}) {
    return authService.signUp(
      email: email,
      password: password,
    );
  }

  @override
  Future<User?> getCurrentUser() async {
    _cachedUser ??= await authService.getCurrentUser();
    return _cachedUser;
  }
}

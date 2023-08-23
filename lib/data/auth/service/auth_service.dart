import 'package:appwrite/models.dart';
import 'package:resume_crafter/data/auth/service/supported_oauth_services.dart';

abstract class AuthService {
  Future<void> signInOAuth({required SupportedOAuthServices oAuthService});
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({required String email, required String password});
  Future<void> signOut();
  Future<User> getCurrentUser();
}

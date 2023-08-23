import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:resume_crafter/data/auth/repository/auth_repository.dart';
import 'package:resume_crafter/data/auth/service/supported_oauth_services.dart';
import 'package:resume_crafter/pages/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthState());

  final AuthRepository authRepository;

  Future<void> signInWithGoogle() async {
    try {
      await authRepository.signInOAuth(
        oAuthService: SupportedOAuthServices.google,
      );
    } catch (e, stack) {
      log(
        'Cannot sign in with google',
        error: e,
        stackTrace: stack,
      );
    }
  }
}

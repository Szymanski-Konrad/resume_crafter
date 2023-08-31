import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:resume_crafter/data/auth/repository/auth_repository.dart';
import 'package:resume_crafter/data/auth/service/supported_oauth_services.dart';
import 'package:resume_crafter/pages/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthState());

  final AuthRepository authRepository;

  Future<void> signInWithGoogle(VoidCallback onSuccess) async {
    try {
      await authRepository.signInOAuth(
        oAuthService: SupportedOAuthServices.google,
      );
      onSuccess.call();
    } catch (e, stack) {
      log(
        'Cannot sign in with google',
        error: e,
        stackTrace: stack,
      );
    }
  }

  Future<void> getCurrentUser() async {
    final user = await authRepository.getCurrentUser();
    emit(state.copyWith(authUser: user));
  }
}

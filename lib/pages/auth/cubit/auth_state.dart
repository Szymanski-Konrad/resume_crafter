import 'package:appwrite/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

enum AuthStatus { authenticated, unauthenticated, unknown }

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    User? authUser,
    @Default(AuthStatus.unknown) AuthStatus authStatus,
  }) = _AuthState;
}

import 'package:bloc/bloc.dart';
import 'package:resume_crafter/pages/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
}

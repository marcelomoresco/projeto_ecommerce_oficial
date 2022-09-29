import 'package:bloc/bloc.dart';
import 'package:e_commerce_project_new/infra/repositories/auth/auth_repository_imp.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(
      email: value,
      loginStatus: LoginStatus.initial,
    ));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(
      password: value,
      loginStatus: LoginStatus.initial,
    ));
  }

  Future<void> loginWithEmailAndPassword() async {
    if (state.loginStatus == LoginStatus.submitted) {
      emit(state.copyWith(loginStatus: LoginStatus.submitted));
      try {
        await _authRepository.logInWithEmailAndPassword(
          email: state.email,
          password: state.password,
        );
        emit(state.copyWith(loginStatus: LoginStatus.sucess));
      } catch (e) {
        emit(state.copyWith(loginStatus: LoginStatus.error));
      }
    }
  }

  Future<void> loginWithGoogle() async {
    if (state.loginStatus == LoginStatus.submitted) {
      emit(state.copyWith(loginStatus: LoginStatus.submitted));
      try {
        await _authRepository.loginWithGoogle();
        emit(state.copyWith(loginStatus: LoginStatus.sucess));
      } catch (e) {
        emit(state.copyWith(loginStatus: LoginStatus.error));
      }
    }
  }
}

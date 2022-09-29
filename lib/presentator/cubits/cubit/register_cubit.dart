import 'package:bloc/bloc.dart';
import 'package:e_commerce_project_new/infra/repositories/auth/auth_repository_imp.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../domain/entities/user_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;
  RegisterCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(RegisterState.initial());

  void userChanged(User user) {
    emit(
      state.copyWith(
        user: user,
        registerStatus: RegisterStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
        password: value,
        registerStatus: RegisterStatus.initial,
      ),
    );
  }

  Future<void> registerUser() async {
    if (!state.isFormValid || state.registerStatus == RegisterStatus.submitted)
      return;
    emit(state.copyWith(registerStatus: RegisterStatus.submitted));
    try {
      var authUser = await _authRepository.signUp(
          password: state.password, user: state.user!);

      emit(state.copyWith(registerStatus: RegisterStatus.sucess));
    } catch (e) {
      emit(state.copyWith(registerStatus: RegisterStatus.error));
    }
  }
}

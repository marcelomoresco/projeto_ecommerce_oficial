part of 'register_cubit.dart';

enum RegisterStatus { initial, submitted, sucess, error }

class RegisterState extends Equatable {
  final String password;
  final RegisterStatus registerStatus;
  final auth.User? authUser;
  final User? user;

  bool get isFormValid => user!.email.isNotEmpty && password.isNotEmpty;

  const RegisterState({
    required this.password,
    required this.registerStatus,
    this.authUser,
    this.user,
  });

  factory RegisterState.initial() {
    return const RegisterState(
      password: '',
      registerStatus: RegisterStatus.initial,
      authUser: null,
      user: User(),
    );
  }

  RegisterState copyWith({
    String? password,
    RegisterStatus? registerStatus,
    auth.User? authUser,
    User? user,
  }) {
    return RegisterState(
      password: password ?? this.password,
      registerStatus: registerStatus ?? this.registerStatus,
      authUser: authUser ?? this.authUser,
      user: user ?? this.user,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [password, registerStatus, authUser, user];
}

part of 'login_cubit.dart';

enum LoginStatus { initial, submitted, sucess, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus loginStatus;
  final User? user;

  bool get isFormValid => email.isNotEmpty && password.isNotEmpty;

  const LoginState({
    required this.email,
    required this.password,
    required this.loginStatus,
    required this.user,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      loginStatus: LoginStatus.initial,
      user: null,
    );
  }

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? loginStatus,
    User? user,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      loginStatus: loginStatus ?? this.loginStatus,
      user: user ?? this.user,
    );
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        email,
        password,
        loginStatus,
        user,
      ];
}

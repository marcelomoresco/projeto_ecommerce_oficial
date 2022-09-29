part of 'auth_bloc.dart';

enum AuthStatus { desconhecido, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus authStatus;
  final User? authUser;
  final User? user;

  const AuthState._({
    this.authStatus = AuthStatus.desconhecido,
    this.authUser,
    this.user,
  });

  const AuthState.desconhecido() : this._();

  const AuthState.authenticated({
    required User authUser,
    required User user,
  }) : this._(
          authStatus: AuthStatus.authenticated,
          authUser: authUser,
          user: user,
        );

  const AuthState.unauthenticated()
      : this._(
          authStatus: AuthStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [authStatus, authUser, user];
}

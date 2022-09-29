import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infra/repositories/auth/auth_repository_imp.dart';
import '../../../infra/repositories/user/user_repository_imp.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authFirebaseRepository;
  final UserRepository _userRepository;
  StreamSubscription<User?>? _authUserSubscription;
  StreamSubscription<User?>? _userSubscription;

  AuthBloc({
    required AuthRepository authFirebaseRepository,
    required UserRepository userRepository,
  })  : _authFirebaseRepository = authFirebaseRepository,
        _userRepository = userRepository,
        super(const AuthState.desconhecido()) {
    on<AuthUserChanged>(_onAuthUserChanged);

    _authUserSubscription = _authFirebaseRepository.user.listen((authUser) {
      print("Auth user: $authUser");
      if (authUser != null) {
        _userRepository.getUser(authUser.uid).listen((user) {
          add(AuthUserChanged(authUser: authUser));
        });
      } else {
        add(AuthUserChanged(authUser: authUser));
      }
    });
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    event.authUser != null
        ? emit(AuthState.authenticated(
            authUser: event.authUser!, user: event.user!))
        : emit(const AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }
}

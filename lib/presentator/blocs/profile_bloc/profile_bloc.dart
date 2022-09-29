import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_project_new/infra/repositories/user/user_repository_imp.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../../domain/entities/user_model.dart';
import '../auth_bloc/auth_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final UserRepository _userRepository;
  StreamSubscription? _authSubscription;

  ProfileBloc({
    required AuthBloc authBloc,
    required UserRepository userRepository,
  })  : _authBloc = authBloc,
        _userRepository = userRepository,
        super(ProfileLoadingState()) {
    on<LoadProfileEvent>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.user != null) {
        add(LoadProfileEvent(state.authUser));
      }
    });
  }

  void _onLoadProfile(
    LoadProfileEvent event,
    Emitter<ProfileState> emit,
  ) {
    if (event.authUser != null) {
      _userRepository.getUser(event.authUser!.uid).listen((user) {
        add(UpdateProfile(user));
      });
    } else {
      emit(ProfileUnState());
    }
  }

  void _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) {
    emit(ProfileLoadedState(user: event.user));
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}

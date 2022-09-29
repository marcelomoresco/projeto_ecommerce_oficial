part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final User user;

  ProfileLoadedState({required this.user});

  @override
  List<Object> get props => [user];
}

class ProfileUnState extends ProfileState {}

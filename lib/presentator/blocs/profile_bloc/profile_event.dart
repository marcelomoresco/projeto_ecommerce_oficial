part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadProfileEvent extends ProfileEvent {
  final auth.User? authUser;

  const LoadProfileEvent(this.authUser);

  @override
  List<Object?> get props => [authUser];
}

class UpdateProfile extends ProfileEvent {
  final User user;
  const UpdateProfile(this.user);

  @override
  List<Object?> get props => [user];
}

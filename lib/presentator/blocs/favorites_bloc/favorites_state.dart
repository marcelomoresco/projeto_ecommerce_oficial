part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitialState extends FavoritesState {}

class FavoritesLoadingState extends FavoritesState {}

class FavoritesLoadedState extends FavoritesState {
  final Favorite favorite;

  FavoritesLoadedState({this.favorite = const Favorite()});

  @override
  List<Object> get props => [favorite];
}

class FavoritesErrorState extends FavoritesState {
  final String errorMessage;

  const FavoritesErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

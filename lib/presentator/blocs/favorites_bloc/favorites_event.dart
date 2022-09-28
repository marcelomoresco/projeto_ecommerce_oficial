part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class StartFavoriteEvent extends FavoritesEvent {}

class AddFavoriteProductEvent extends FavoritesEvent {
  final Product product;

  const AddFavoriteProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFavoriteProductEvent extends FavoritesEvent {
  final Product product;

  const RemoveFavoriteProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

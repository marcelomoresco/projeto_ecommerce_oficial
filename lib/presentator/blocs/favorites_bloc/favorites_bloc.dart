import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/favorites_model.dart';
import '../../../domain/entities/product_model.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesLoadingState()) {
    on<StartFavoriteEvent>(_onLoadFavorites);
    on<AddFavoriteProductEvent>(_onAddFavorite);
    on<RemoveFavoriteProductEvent>(_onRemoveFavorite);
  }

  void _onLoadFavorites(event, Emitter<FavoritesState> emit) async {
    emit(FavoritesLoadingState());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(FavoritesLoadedState());
    } catch (_) {
      emit(const FavoritesErrorState(
          errorMessage: "Erro ao Carregar Favoritos"));
    }
  }

  void _onAddFavorite(event, Emitter<FavoritesState> emit) async {
    final state = this.state;
    if (state is FavoritesLoadedState) {
      try {
        emit(
          FavoritesLoadedState(
            favorite: Favorite(
              products: List.from(state.favorite.products)..add(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(
          const FavoritesErrorState(errorMessage: "Erro ao Adicionar Favorito"),
        );
      }
    }
  }

  void _onRemoveFavorite(event, Emitter<FavoritesState> emit) async {
    final state = this.state;
    if (state is FavoritesLoadedState) {
      try {
        emit(
          FavoritesLoadedState(
            favorite: Favorite(
              products: List.from(state.favorite.products)
                ..remove(event.product),
            ),
          ),
        );
      } catch (e) {
        emit(
          const FavoritesErrorState(errorMessage: "Erro ao Remover Favorito"),
        );
      }
    }
  }
}

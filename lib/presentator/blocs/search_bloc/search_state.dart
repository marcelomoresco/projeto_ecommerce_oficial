part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<Product> products;

  const SearchLoadedState({this.products = const <Product>[]});

  @override
  List<Object> get props => [products];
}

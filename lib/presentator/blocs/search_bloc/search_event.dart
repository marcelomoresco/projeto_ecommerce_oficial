// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class LoadSearchEvent extends SearchEvent {}

class SearchProductEvent extends SearchEvent {
  final String productName;
  final Category? category;

  const SearchProductEvent({required this.productName, this.category});

  @override
  List<Object?> get props => [productName, category];
}

class UpdateSearchResultEvent extends SearchEvent {
  final List<Product> products;

  const UpdateSearchResultEvent(this.products);

  @override
  List<Object?> get props => [products];
}

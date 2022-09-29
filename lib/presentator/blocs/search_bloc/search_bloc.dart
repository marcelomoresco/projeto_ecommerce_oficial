import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_project_new/domain/entities/category_model.dart';
import 'package:e_commerce_project_new/presentator/blocs/product_bloc/product_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final ProductBloc _productBloc;
  StreamSubscription? _productSubscription;
  SearchBloc({required ProductBloc productBloc})
      : _productBloc = productBloc,
        super(SearchLoadingState()) {
    on<LoadSearchEvent>(_onLoadSearch);
    on<SearchProductEvent>(_onSearchProduct);
    on<UpdateSearchResultEvent>(_onUpdateProducts);
  }

  void _onLoadSearch(LoadSearchEvent event, Emitter<SearchState> emit) {
    emit(SearchLoadedState());
  }

  void _onSearchProduct(SearchProductEvent event, Emitter<SearchState> emit) {
    List<Product> products =
        (_productBloc.state as ProductLoadedState).products;

    if (event.category != null) {
      products = Product.products
          .where((product) => product.category == event.category!.name)
          .toList();
    }

    if (event.productName.isNotEmpty) {
      List<Product> searchResults = Product.products
          .where(
            (product) => product.name.toLowerCase().startsWith(
                  event.productName.toLowerCase(),
                ),
          )
          .toList();
      print(searchResults);

      emit(SearchLoadedState(products: searchResults));
    } else {
      emit(const SearchLoadedState());
    }
  }

  void _onUpdateProducts(
      UpdateSearchResultEvent event, Emitter<SearchState> emit) {}

  @override
  Future<void> close() {
    _productSubscription?.cancel();
    return super.close();
  }
}

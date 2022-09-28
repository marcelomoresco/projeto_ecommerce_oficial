import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/entities/category_model.dart';
import '../../../infra/repositories/category/category_repository_imp.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
    on<UpdateCategoriesEvent>(_onUpdateCategories);
  }

  void _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (products) => add(
            UpdateCategoriesEvent(products),
          ),
        );
  }

  void _onUpdateCategories(
    UpdateCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) {
    emit(
      CategoryLoaded(categories: event.categories),
    );
  }
}

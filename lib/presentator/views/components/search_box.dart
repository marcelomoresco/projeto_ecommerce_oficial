import 'package:e_commerce_project_new/presentator/views/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/category_model.dart';
import '../../../domain/entities/product_model.dart';
import '../../blocs/search_bloc/search_bloc.dart';

class SearchBox extends StatelessWidget {
  final Category? category;
  const SearchBox({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchLoadedState) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Pesquise seu produto",
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.deepPurple,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (value) {
                          context.read<SearchBloc>().add(
                                SearchProductEvent(
                                    productName: value, category: category),
                              );
                        },
                      ),
                    ),
                  ],
                ),
                state.products.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ProductCard(
                              product: state.products[index],
                              widthSelect: 1.1,
                            ),
                          );
                        })
                    : const SizedBox()
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("Algo deu muito errado!"),
          );
        }
      },
    );
  }
}

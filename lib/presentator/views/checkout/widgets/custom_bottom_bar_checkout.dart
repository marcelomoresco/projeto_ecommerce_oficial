import 'dart:io';

import 'package:e_commerce_project_new/presentator/blocs/checkout_bloc/checkout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderNowNavBar extends StatelessWidget {
  const OrderNowNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (state is CheckoutLoaded) {
              return ElevatedButton(
                onPressed: () {
                  context
                      .read<CheckoutBloc>()
                      .add(ConfirmCheckout(checkout: state.checkout));
                  const snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text(
                      "Pedido feito com Sucesso",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'COMPRAR AGORA',
                  style: Theme.of(context).textTheme.headline3,
                ),
              );
            } else {
              return const Text('Algo deu errado!');
            }
          },
        )
      ],
    );
  }
}

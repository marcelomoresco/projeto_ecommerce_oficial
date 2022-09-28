import 'dart:io';

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
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/payment-selection');
          },
          style: ElevatedButton.styleFrom(primary: Colors.white),
          child: Text(
            'SELECIONE SEU PAGAMENTO',
            style: Theme.of(context).textTheme.headline3,
          ),
        )
      ],
    );
  }
}

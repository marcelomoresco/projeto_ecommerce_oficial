import 'package:flutter/material.dart';

class BottomOrderConfirmedBar extends StatelessWidget {
  const BottomOrderConfirmedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: BottomAppBar(
        color: Colors.deepPurple,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {},
                child: Text(
                  'VOLTAR PARA LOJA ',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.black,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

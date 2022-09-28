import 'package:e_commerce_project_new/presentator/views/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/product_model.dart';
import '../components/order_resume.dart';
import '../components/order_resume_card.dart';
import 'components/custom_bottom_confirmation_bar.dart';

class OrderConfirmation extends StatelessWidget {
  const OrderConfirmation({super.key});

  static const String routeName = '/order-confirmation';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const OrderConfirmation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Pedido Confirmado",
      ),
      bottomNavigationBar: const BottomOrderConfirmedBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.deepPurple,
                width: double.infinity,
                height: 300,
              ),
              /*Positioned(
                top: 125,
                left: (MediaQuery.of(context).size.width - 100) / 2,
                child: Lottie.asset("assets/ordercompleted.json"),
              ),*/
              Positioned(
                top: 250,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Seu Pedido foi Confirmado",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Código do Pedido: #1231989012",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Muito obrigado por comprar conosco!",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Muito obrigado por comprar conosco!",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const OrderResume(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Detalhes do Pedido",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    OrderResumeCard(
                      product: Product.products[0],
                      quantity: 2,
                    ),
                    OrderResumeCard(
                      product: Product.products[1],
                      quantity: 1,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}

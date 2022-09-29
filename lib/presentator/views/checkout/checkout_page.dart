import 'package:e_commerce_project_new/presentator/views/checkout/widgets/custom_nav_bar_checkout.dart';
import 'package:e_commerce_project_new/presentator/views/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/checkout_bloc/checkout_bloc.dart';
import '../components/order_resume.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CheckoutPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      //bottomNavigationBar: const OrderNowNavBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Informações do Cliente",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              _buildTextFormField((value) {
                context.read<CheckoutBloc>().add(UpdateCheckout(email: value));
              }, context, 'E-mail'),
              _buildTextFormField((value) {
                context.read<CheckoutBloc>().add(UpdateCheckout(name: value));
              }, context, 'Nome'),
              SizedBox(
                height: 10,
              ),
              const Text("Informações de Entrega",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              _buildTextFormField((value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(address: value));
              }, context, 'Endereço'),
              _buildTextFormField((value) {
                context.read<CheckoutBloc>().add(UpdateCheckout(city: value));
              }, context, 'Cidade'),
              _buildTextFormField((value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(country: value));
              }, context, 'País'),
              _buildTextFormField((value) {
                context
                    .read<CheckoutBloc>()
                    .add(UpdateCheckout(zipCode: value));
              }, context, 'CEP'),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Center(
                    child: Text(
                      "Selecione o Metódo de Pagamento",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/payment-selection");
                    },
                  )
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Resumo do Pedido",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const OrderResume(),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  onPressed: () {},
                  child: const Text("Finalizar Pedido",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Padding _buildTextFormField(
  Function(String)? onChanged,
  BuildContext context,
  String hintText,
) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            hintText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          ),
        )
      ],
    ),
  );
}

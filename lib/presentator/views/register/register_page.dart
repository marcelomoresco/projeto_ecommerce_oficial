import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RegisterPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildUserTextField(
              onChanged: (value) {},
              labelText: "E-mail",
            ),
            const SizedBox(
              height: 10,
            ),
            _buildUserTextField(
              onChanged: (value) {},
              labelText: "Nome Completo",
            ),
            const SizedBox(
              height: 10,
            ),
            _buildUserTextField(
              onChanged: (value) {},
              labelText: "País",
            ),
            const SizedBox(
              height: 10,
            ),
            _buildUserTextField(
              onChanged: (value) {},
              labelText: "Cidade",
            ),
            const SizedBox(
              height: 10,
            ),
            _buildUserTextField(
              onChanged: (value) {},
              labelText: "Endereço",
            ),
            const SizedBox(
              height: 10,
            ),
            _buildUserTextField(
              onChanged: (value) {},
              labelText: "CEP",
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.deepPurple,
                fixedSize: const Size(200, 40),
              ),
              child: const Text("Registrar"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _buildUserTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final String labelText;

  const _buildUserTextField({
    super.key,
    this.onChanged,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(hintText: labelText),
    );
  }
}

class _buildPasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: InputDecoration(hintText: "Senha"),
      obscureText: true,
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginPage(),
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
            _buildEmailTextField(),
            SizedBox(
              height: 15,
            ),
            _buildPasswordTextField(),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(),
                backgroundColor: Colors.deepPurple,
                fixedSize: Size(200, 40),
              ),
              child: Text("Login"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _buildEmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: const InputDecoration(hintText: "E-mail"),
    );
  }
}

class _buildPasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {},
      decoration: const InputDecoration(hintText: "Senha"),
      obscureText: true,
    );
  }
}

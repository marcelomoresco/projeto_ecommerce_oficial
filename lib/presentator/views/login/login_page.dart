import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/login_cubit/login_cubit.dart';

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
            const SizedBox(
              height: 15,
            ),
            _buildPasswordTextField(),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.deepPurple,
                fixedSize: const Size(200, 40),
              ),
              child: const Text("Login"),
              onPressed: () {
                context.read<LoginCubit>().loginWithEmailAndPassword();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const GoogleLoginButton(),
          ],
        ),
      ),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  const GoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: const RoundedRectangleBorder(),
        fixedSize: const Size(200, 40),
      ),
      onPressed: () {
        context.read<LoginCubit>().loginWithGoogle();
      },
      child: Text("Registrar com Google"),
    );
  }
}

class _buildEmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<LoginCubit>().emailChanged(value);
          },
          decoration: const InputDecoration(hintText: "E-mail"),
        );
      },
    );
  }
}

class _buildPasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<LoginCubit>().passwordChanged(value);
          },
          decoration: const InputDecoration(hintText: "Senha"),
          obscureText: true,
        );
      },
    );
  }
}

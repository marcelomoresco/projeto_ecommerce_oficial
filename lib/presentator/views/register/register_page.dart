import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit/register_cubit.dart';

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
        child: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildUserTextField(
                  onChanged: (value) {
                    context
                        .read<RegisterCubit>()
                        .userChanged(state.user!.copyWith(email: value));
                  },
                  labelText: "E-mail",
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildUserTextField(
                  onChanged: (value) {
                    context
                        .read<RegisterCubit>()
                        .userChanged(state.user!.copyWith(name: value));
                  },
                  labelText: "Nome Completo",
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildUserTextField(
                  onChanged: (value) {
                    context
                        .read<RegisterCubit>()
                        .userChanged(state.user!.copyWith(country: value));
                  },
                  labelText: "País",
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildUserTextField(
                  onChanged: (value) {
                    context
                        .read<RegisterCubit>()
                        .userChanged(state.user!.copyWith(city: value));
                  },
                  labelText: "Cidade",
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildUserTextField(
                  onChanged: (value) {
                    context
                        .read<RegisterCubit>()
                        .userChanged(state.user!.copyWith(address: value));
                  },
                  labelText: "Endereço",
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildUserTextField(
                  onChanged: (value) {
                    context
                        .read<RegisterCubit>()
                        .userChanged(state.user!.copyWith(zipCode: value));
                  },
                  labelText: "CEP",
                ),
                _buildPasswordTextField(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: Colors.deepPurple,
                    fixedSize: const Size(200, 40),
                  ),
                  child: const Text("Registrar"),
                  onPressed: () {
                    context.read<RegisterCubit>().registerUser();
                  },
                ),
              ],
            );
          },
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
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextField(
          onChanged: onChanged,
          decoration: InputDecoration(hintText: labelText),
        );
      },
    );
  }
}

class _buildPasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return TextField(
          onChanged: (value) {
            context.read<RegisterCubit>().passwordChanged(value);
          },
          decoration: const InputDecoration(hintText: "Senha"),
          obscureText: true,
        );
      },
    );
  }
}

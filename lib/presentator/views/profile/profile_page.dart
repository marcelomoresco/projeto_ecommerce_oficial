import 'package:e_commerce_project_new/infra/repositories/auth/auth_repository_imp.dart';
import 'package:e_commerce_project_new/infra/repositories/user/user_repository_imp.dart';
import 'package:e_commerce_project_new/presentator/views/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';
import '../../blocs/profile_bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Perfil"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            child: const Center(
              child: Text("Você não está logado"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text("Logout"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/register');
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(),
              backgroundColor: Colors.deepPurple,
            ),
            child: const Text("Registrar-se"),
          )
        ],
      ),
    );
  }
}

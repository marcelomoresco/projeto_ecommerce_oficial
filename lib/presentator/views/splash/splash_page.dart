import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth_bloc/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SplashPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 1), () => Navigator.of(context).pushNamed('/'));
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.authUser != current.authUser,
      listener: (context, state) {
        print("Auth page");
      },
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: const Text(
                  "Bem-Vindo",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

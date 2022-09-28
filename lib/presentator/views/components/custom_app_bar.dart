import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/favorites');
          },
          icon: Icon(Icons.favorite),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      title: Row(
        children: [
          Image.asset('assets/logo.png', height: 40),
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        IconButton(icon: const Icon(Icons.logout), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

import 'package:flutter/material.dart';
import 'package:orbitsproject/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:orbitsproject/utils/error_logger.dart'; // 👈 Add this line

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear(); // Clear stored login credentials

      // Navigate to login screen and remove all previous routes
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => LoginPage()),
        (route) => false,
      );
    } catch (e, stack) {
      await ErrorLogger.logError(
        "Logout failed",
        e.toString(),
        stack.toString(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong during logout")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0,
      title: Row(children: [Image.asset('assets/logo.png', height: 40)]),
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: [
        IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => _logout(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

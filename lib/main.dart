import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:orbitsproject/pages/login.dart';
import 'package:orbitsproject/pages/dashboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final String? username = prefs.getString('username');
  final String? password = prefs.getString('password');

  runApp(MyApp(isLoggedIn: isLoggedIn, username: username, password: password));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String? username;
  final String? password;

  const MyApp({
    super.key,
    required this.isLoggedIn,
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          isLoggedIn && username != null && password != null
              ? DashboardPage()
              : const LoginPage(),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:orbitsproject/pages/login.dart';
import 'package:orbitsproject/pages/dashboard.dart';
import 'package:orbitsproject/utils/error_logger.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized(); // ✅ moved inside

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details); // Show red screen in debug mode
        ErrorLogger.logError(
          'Flutter Error: ${details.exceptionAsString()}',
          details.stack?.toString(),
        );
      };

      try {
        final prefs = await SharedPreferences.getInstance();
        final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
        final String? username = prefs.getString('username');
        final String? password = prefs.getString('password');

        runApp(
          MyApp(isLoggedIn: isLoggedIn, username: username, password: password),
        );
      } catch (e, stack) {
        await ErrorLogger.logError('Main Init Error: $e', stack.toString());
        runApp(const MyApp(isLoggedIn: false, username: null, password: null));
      }
    },
    (error, stack) async {
      await ErrorLogger.logError('Zoned Error: $error', stack.toString());
    },
  );
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

import 'package:flutter/material.dart';

void showAddUserDialog(BuildContext context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String userType = 'Client'; // Default selection

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Add a New User"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Enter Email"),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: "Enter Password"),
                obscureText: true,
              ),
              DropdownButtonFormField<String>(
                value: userType,
                decoration: const InputDecoration(labelText: "Select Role"),
                items:
                    ['Admin', 'Client'].map((String role) {
                      return DropdownMenuItem<String>(
                        value: role,
                        child: Text(role),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    userType = newValue;
                  }
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              String email = emailController.text.trim();
              String password = passwordController.text.trim();

              if (email.isEmpty || password.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("All fields are required!")),
                );
                return;
              }

              Navigator.pop(context); // Close the Add User dialog

              // Show success confirmation dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Success"),
                    content: Text("User added successfully as $userType!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text("Add"),
          ),
        ],
      );
    },
  );
}

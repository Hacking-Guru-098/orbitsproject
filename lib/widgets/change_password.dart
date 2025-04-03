import 'package:flutter/material.dart';

void showChangePasswordDialog(BuildContext context) {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Change Password"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTextField(
              passwordController,
              "New Password",
              isPassword: true,
            ),
            _buildTextField(
              confirmPasswordController,
              "Confirm Password",
              isPassword: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              String newPassword = passwordController.text.trim();
              String confirmPassword = confirmPasswordController.text.trim();

              if (newPassword.isEmpty || confirmPassword.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Both fields are required!")),
                );
                return;
              }

              if (newPassword != confirmPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Passwords do not match!")),
                );
                return;
              }

              Navigator.pop(context); // Close the dialog

              // Show success confirmation
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Password Changed"),
                    content: const Text(
                      "Your password has been successfully updated.",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  );
                },
              );

              // TODO: Implement backend logic to update password
            },
            child: const Text("Change"),
          ),
        ],
      );
    },
  );
}

Widget _buildTextField(
  TextEditingController controller,
  String label, {
  bool isPassword = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(labelText: label),
    ),
  );
}

import 'package:flutter/material.dart';

void showRemoveClientDialog(BuildContext context) {
  TextEditingController emailController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Remove a Client"),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: "Enter Client Email"),
          keyboardType: TextInputType.emailAddress,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              String email = emailController.text.trim();

              if (email.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please enter a valid email!")),
                );
                return;
              }

              Navigator.pop(context); // Close the Remove Client dialog

              // Show success confirmation dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Client Removed"),
                    content: Text(
                      "Client with email $email has been removed successfully.",
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
            },
            child: const Text("Remove"),
          ),
        ],
      );
    },
  );
}

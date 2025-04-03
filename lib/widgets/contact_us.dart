import 'package:flutter/material.dart';

void showContactUsDialog(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String selectedQuery = 'General Inquiry'; // Default value

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Contact Us"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Enter your name"),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Enter your email",
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              DropdownButtonFormField<String>(
                value: selectedQuery,
                decoration: const InputDecoration(labelText: "Select query"),
                items:
                    [
                      'General Inquiry',
                      'Technical Support',
                      'Billing Issue',
                      'Feedback',
                    ].map((String query) {
                      return DropdownMenuItem<String>(
                        value: query,
                        child: Text(query),
                      );
                    }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedQuery = newValue;
                  }
                },
              ),
              TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: "Enter your message",
                ),
                maxLines: 4,
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
              String name = nameController.text.trim();
              String email = emailController.text.trim();
              String message = messageController.text.trim();

              if (name.isEmpty || email.isEmpty || message.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("All fields are required!")),
                );
                return;
              }

              Navigator.pop(context); // Close the Contact Us dialog

              // Show success confirmation dialog
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Success"),
                    content: const Text(
                      "Your response has been sent successfully!",
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
            child: const Text("Send"),
          ),
        ],
      );
    },
  );
}

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name = "John Doe";
  final String username = "johndoe123";
  final String email = "johndoe@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.green, // Green color for app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Icon with a green background
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.withOpacity(
                    0.1,
                  ), // Light green background
                ),
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.account_circle,
                  color: Colors.green, // Icon color set to green
                  size: 80, // Increased size
                ),
              ),
            ),
            SizedBox(height: 30),

            // Display Name with green color and bold text
            Text(
              "Name: $name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Green text color
              ),
            ),
            SizedBox(height: 15),

            // Display Username with a soft green color
            Text(
              "Username: $username",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green.shade700, // Soft green color
              ),
            ),
            SizedBox(height: 15),

            // Display Email with green color
            Text(
              "Email: $email",
              style: TextStyle(
                fontSize: 18,
                color: Colors.green.shade700, // Soft green color
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      backgroundColor: Colors.white, // White background for the whole page
    );
  }
}

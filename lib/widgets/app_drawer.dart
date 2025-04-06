import 'package:flutter/material.dart';
import 'package:orbitsproject/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'change_password.dart';
import 'add_device.dart';
import 'update_device.dart';
import 'delete_device.dart';
import 'add_user.dart';
import 'remove_client.dart';
import 'contact_us.dart';

class AppDrawer extends StatelessWidget {
  final String username;

  const AppDrawer({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 50), // Logo at the top
                const SizedBox(height: 10),
                Text(
                  username, // Display Username
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          _createDrawerItem(
            icon: Icons.lock,
            text: 'Change Password',
            onTap: () => showChangePasswordDialog(context),
          ),
          _createDrawerItem(
            icon: Icons.add,
            text: 'Add a Device',
            onTap: () => showAddDeviceDialog(context),
          ),
          _createDrawerItem(
            icon: Icons.edit,
            text: 'Update a Device',
            onTap: () => showUpdateDeviceDialog(context),
          ),
          _createDrawerItem(
            icon: Icons.delete,
            text: 'Delete a Device',
            onTap: () => showDeleteDeviceDialog(context),
          ),
          _createDrawerItem(
            icon: Icons.person_add,
            text: 'Add a New User',
            onTap: () => showAddUserDialog(context),
          ),
          _createDrawerItem(
            icon: Icons.person_remove,
            text: 'Remove a Client',
            onTap: () => showRemoveClientDialog(context),
          ),
          _createDrawerItem(
            icon: Icons.contact_mail,
            text: 'Contact Us',
            onTap: () => showContactUsDialog(context),
          ),
          _createDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onTap: () => _showLogoutDialog(context),
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(text, style: const TextStyle(fontSize: 18)),
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                // Clear login session
                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();

                // Navigate to login screen and remove all previous routes
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false, // Remove all previous routes
                );
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}

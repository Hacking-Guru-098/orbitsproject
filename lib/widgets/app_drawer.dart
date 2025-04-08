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
import 'package:orbitsproject/pages/ErrorLogViewer.dart'; // ✅ Same import style as others
import 'package:orbitsproject/utils/error_logger.dart';

class AppDrawer extends StatelessWidget {
  final String username;
  final String userRole; // admin or client

  const AppDrawer({Key? key, required this.username, required this.userRole})
    : super(key: key);

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
                Image.asset('assets/logo.png', height: 50),
                const SizedBox(height: 10),
                Text(
                  username,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          _createDrawerItem(
            icon: Icons.lock,
            text: 'Change Password',
            onTap: () {
              try {
                showChangePasswordDialog(context);
              } catch (e, stack) {
                ErrorLogger.logError(
                  "Failed to open Change Password dialog",
                  e.toString(),
                  stack.toString(),
                );
              }
            },
          ),
          if (userRole == "admin") ...[
            _createDrawerItem(
              icon: Icons.add,
              text: 'Add a Device',
              onTap: () {
                try {
                  showAddDeviceDialog(context);
                } catch (e, stack) {
                  ErrorLogger.logError(
                    "Failed to open Add Device dialog",
                    e.toString(),
                    stack.toString(),
                  );
                }
              },
            ),
            _createDrawerItem(
              icon: Icons.edit,
              text: 'Update a Device',
              onTap: () {
                try {
                  showUpdateDeviceDialog(context);
                } catch (e, stack) {
                  ErrorLogger.logError(
                    "Failed to open Update Device dialog",
                    e.toString(),
                    stack.toString(),
                  );
                }
              },
            ),
            _createDrawerItem(
              icon: Icons.delete,
              text: 'Delete a Device',
              onTap: () {
                try {
                  showDeleteDeviceDialog(context);
                } catch (e, stack) {
                  ErrorLogger.logError(
                    "Failed to open Delete Device dialog",
                    e.toString(),
                    stack.toString(),
                  );
                }
              },
            ),
            _createDrawerItem(
              icon: Icons.person_add,
              text: 'Add a New User',
              onTap: () {
                try {
                  showAddUserDialog(context);
                } catch (e, stack) {
                  ErrorLogger.logError(
                    "Failed to open Add User dialog",
                    e.toString(),
                    stack.toString(),
                  );
                }
              },
            ),
            _createDrawerItem(
              icon: Icons.person_remove,
              text: 'Remove a Client',
              onTap: () {
                try {
                  showRemoveClientDialog(context);
                } catch (e, stack) {
                  ErrorLogger.logError(
                    "Failed to open Remove Client dialog",
                    e.toString(),
                    stack.toString(),
                  );
                }
              },
            ),
          ],

          // ✅ Log Viewer for all users
          _createDrawerItem(
            icon: Icons.bug_report,
            text: 'View Logs',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ErrorLogViewer()),
              );
            },
          ),

          _createDrawerItem(
            icon: Icons.contact_mail,
            text: 'Contact Us',
            onTap: () {
              try {
                showContactUsDialog(context);
              } catch (e, stack) {
                ErrorLogger.logError(
                  "Failed to open Contact Us dialog",
                  e.toString(),
                  stack.toString(),
                );
              }
            },
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
                try {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.clear();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                } catch (e, stack) {
                  ErrorLogger.logError(
                    "Logout failed",
                    e.toString(),
                    stack.toString(),
                  );
                }
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }
}

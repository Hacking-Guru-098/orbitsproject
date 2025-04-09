import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditDeviceDialog extends StatefulWidget {
  const EditDeviceDialog({super.key});

  @override
  State<EditDeviceDialog> createState() => _EditDeviceDialogState();
}

class _EditDeviceDialogState extends State<EditDeviceDialog> {
  final TextEditingController macController = TextEditingController();
  final TextEditingController deviceController = TextEditingController();
  final TextEditingController wifiNameController = TextEditingController();
  final TextEditingController wifiPassController = TextEditingController();
  final TextEditingController clientController = TextEditingController();

  bool loading = false;
  bool showEditForm = false;

  Future<void> fetchDeviceData() async {
    setState(() => loading = true);
    final response = await http.post(
      Uri.parse(
        'https://mitzvah-software-for-smart-air-curtain.onrender.com/devicecheck',
      ),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"id": macController.text.trim()}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      deviceController.text = data['device-name'] ?? '';
      wifiNameController.text = data['wifi_name'] ?? '';
      wifiPassController.text = data['wifi_password'] ?? '';
      clientController.text = data['client_select'] ?? '';

      setState(() {
        showEditForm = true;
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Device not found')));
    }
    setState(() => loading = false);
  }

  Future<void> updateDeviceData() async {
    final response = await http.post(
      Uri.parse(
        'https://mitzvah-software-for-smart-air-curtain.onrender.com/add-data',
      ),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "macAddress": macController.text.trim(),
        "client": clientController.text.trim(),
        "device_name": deviceController.text.trim(),
        "wifi_name": wifiNameController.text.trim(),
        "wifi_pass": wifiPassController.text.trim(),
      }),
    );

    if (response.statusCode == 200) {
      Navigator.pop(context); // Close dialog on success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Device updated successfully')),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to update device')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Device'),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: macController,
              decoration: const InputDecoration(labelText: 'MAC Address'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: loading ? null : fetchDeviceData,
              child:
                  loading
                      ? const CircularProgressIndicator()
                      : const Text('Fetch Device'),
            ),
            if (showEditForm) ...[
              const SizedBox(height: 20),
              TextField(
                controller: deviceController,
                decoration: const InputDecoration(labelText: 'Device Name'),
              ),
              TextField(
                controller: wifiNameController,
                decoration: const InputDecoration(labelText: 'WiFi Name'),
              ),
              TextField(
                controller: wifiPassController,
                decoration: const InputDecoration(labelText: 'WiFi Password'),
              ),
              TextField(
                controller: clientController,
                decoration: const InputDecoration(labelText: 'Client'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: updateDeviceData,
                child: const Text('Save Changes'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ✅ Add this to show the dialog from anywhere
void showUpdateDeviceDialog(BuildContext context) {
  showDialog(context: context, builder: (context) => const EditDeviceDialog());
}

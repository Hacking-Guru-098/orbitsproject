import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void showAddDeviceDialog(BuildContext context) {
  TextEditingController macAddressController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Add a Device"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(macAddressController, "MAC Address"),
              _buildTextField(clientNameController, "Client Name"),
              _buildTextField(deviceNameController, "Device Name"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              final mac = macAddressController.text.trim();
              final client = clientNameController.text.trim();
              final device = deviceNameController.text.trim();

              if (mac.isEmpty || client.isEmpty || device.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("All fields are required!")),
                );
                return;
              }

              final url = Uri.parse(
                "https://mitzvah-software-for-smart-air-curtain.onrender.com/add-data",
              );

              final body = {
                "macAddress": mac,
                "client": client,
                "device_name": device,
              };

              try {
                final response = await http.post(
                  url,
                  headers: {"Content-Type": "application/json"},
                  body: jsonEncode(body),
                );

                if (response.statusCode == 200) {
                  Navigator.pop(context); // Close the dialog

                  // Show success
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Success"),
                          content: const Text("Device added successfully."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Failed to add device")),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Error: ${e.toString()}")),
                );
              }
            },
            child: const Text("Add"),
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
  TextInputType keyboardType = TextInputType.text,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      decoration: InputDecoration(labelText: label),
    ),
  );
}

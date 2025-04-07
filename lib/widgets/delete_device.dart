import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void showDeleteDeviceDialog(BuildContext context) {
  TextEditingController macController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Delete a Device"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: macController,
                  decoration: const InputDecoration(
                    labelText: "Enter MAC Address",
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    String macAddress = macController.text.trim();

                    if (macAddress.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a valid MAC Address!"),
                        ),
                      );
                      return;
                    }

                    final url = Uri.parse(
                      "https://mitzvah-software-for-smart-air-curtain.onrender.com/delete-device",
                    );

                    try {
                      final response = await http.post(
                        url,
                        headers: {"Content-Type": "application/json"},
                        body: jsonEncode({"id": macAddress}),
                      );

                      if (response.statusCode == 200 &&
                          response.body.toLowerCase().contains("ok")) {
                        Navigator.pop(context); // Close the first dialog

                        // Show success dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Device Deleted"),
                              content: Text(
                                "The device with MAC ID \"$macAddress\" has been successfully deleted.",
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
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Device not found or deletion failed.",
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Error: ${e.toString()}")),
                      );
                    }
                  },
                  child: const Text("Delete Device"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
            ],
          );
        },
      );
    },
  );
}

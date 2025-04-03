import 'package:flutter/material.dart';

void showDeleteDeviceDialog(BuildContext context) {
  TextEditingController macController = TextEditingController();
  bool isDeviceFound = false;

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
                  onPressed: () {
                    // Simulate searching for the MAC address
                    String macAddress = macController.text.trim();

                    if (macAddress.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a valid MAC Address!"),
                        ),
                      );
                      return;
                    }

                    // Simulating device search
                    bool found = _searchDevice(
                      macAddress,
                    ); // Replace with real API call

                    setState(() {
                      isDeviceFound = found;
                    });

                    if (!found) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Device not found!")),
                      );
                    }
                  },
                  child: const Text("Search"),
                ),
                if (isDeviceFound) ...[
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the search dialog

                      // Show confirmation dialog
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Device Deleted"),
                            content: Text(
                              "The device with MAC ${macController.text} has been deleted.",
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text("Delete"),
                  ),
                ],
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

// Dummy function to simulate searching for a device (Replace with actual backend call)
bool _searchDevice(String macAddress) {
  List<String> mockDevices = ["AA:BB:CC:DD:EE:FF", "11:22:33:44:55:66"];
  return mockDevices.contains(macAddress);
}

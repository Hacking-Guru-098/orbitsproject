import 'package:flutter/material.dart';

void showUpdateDeviceDialog(BuildContext context) {
  TextEditingController macAddressController = TextEditingController();
  TextEditingController newDeviceNameController = TextEditingController();
  TextEditingController newDeviceModelController = TextEditingController();
  bool isDeviceFound = false;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Update a Device"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: macAddressController,
                  decoration: const InputDecoration(
                    labelText: "Enter MAC Address",
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    String macAddress = macAddressController.text.trim();

                    if (macAddress.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a valid MAC Address!"),
                        ),
                      );
                      return;
                    }

                    // Simulating search
                    bool found = _searchDevice(
                      macAddress,
                    ); // Replace with actual backend call

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
                  TextField(
                    controller: newDeviceNameController,
                    decoration: const InputDecoration(
                      labelText: "New Device Name",
                    ),
                  ),
                  TextField(
                    controller: newDeviceModelController,
                    decoration: const InputDecoration(
                      labelText: "New Device Model",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the update dialog

                      // Show success confirmation
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Device Updated"),
                            content: Text(
                              "Device with MAC Address ${macAddressController.text} has been updated.",
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
                      backgroundColor: Colors.green,
                    ),
                    child: const Text("Update"),
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

// Dummy function to simulate device search (Replace with actual backend call)
bool _searchDevice(String macAddress) {
  List<String> mockDevices = ["00:1A:2B:3C:4D:5E", "AA:BB:CC:DD:EE:FF"];
  return mockDevices.contains(macAddress);
}

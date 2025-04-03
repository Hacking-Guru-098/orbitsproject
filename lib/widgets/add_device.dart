import 'package:flutter/material.dart';

void showAddDeviceDialog(BuildContext context) {
  TextEditingController clientNameController = TextEditingController();
  TextEditingController macAddressController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Add a Device"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(clientNameController, "Client Name"),
              _buildTextField(macAddressController, "MAC Address"),
              _buildTextField(deviceNameController, "Device Name"),
              _buildTextField(
                emailController,
                "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              _buildTextField(passwordController, "Password", isPassword: true),
              _buildTextField(districtController, "District"),
              _buildTextField(cityController, "City"),
              _buildTextField(locationController, "Location"),
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
              String clientName = clientNameController.text.trim();
              String macAddress = macAddressController.text.trim();
              String deviceName = deviceNameController.text.trim();
              String email = emailController.text.trim();
              String password = passwordController.text.trim();
              String district = districtController.text.trim();
              String city = cityController.text.trim();
              String location = locationController.text.trim();

              if (clientName.isEmpty ||
                  macAddress.isEmpty ||
                  deviceName.isEmpty ||
                  email.isEmpty ||
                  password.isEmpty ||
                  district.isEmpty ||
                  city.isEmpty ||
                  location.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("All fields are required!")),
                );
                return;
              }

              Navigator.pop(context); // Close the add device dialog

              // Show success confirmation
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Device Added"),
                    content: const Text(
                      "The device has been successfully added.",
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

              // TODO: Implement backend logic to save device details
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
      decoration: InputDecoration(labelText: label),
      obscureText: isPassword,
      keyboardType: keyboardType,
    ),
  );
}

import 'package:flutter/material.dart';

class DeviceDetailPage extends StatelessWidget {
  final String deviceId;

  const DeviceDetailPage({super.key, required this.deviceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade100,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Device ID : $deviceId",
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(height: 5),
              const Text(
                "\u{1F534} Offline",
                style: TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 10),

              // First row with three infoCircles
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 15,
                runSpacing: 15,
                children: [
                  infoCircle("NaN °C", "Indoor Temp", Icons.thermostat),
                  infoCircle("ON", "Status", Icons.power_settings_new),
                  infoCircle("NaN °C", "Outdoor Temp", Icons.settings),
                  infoCircle("0", "Head Count", Icons.door_front_door),
                  infoCircle("0", "RPM", Icons.speed),
                  infoCircle("0", "Power", Icons.electrical_services),
                ],
              ),

              const SizedBox(height: 20),

              // Buttons section (wrap ensures responsive layout)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  actionButton("Change Status", Colors.orange),
                  actionButton("Refresh", Colors.green),
                  actionButton("See Records", Colors.red),
                ],
              ),

              const SizedBox(height: 15),
              const Text(
                "Last Updated Data on : 2025-01-09 10:58:46",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCircle(String value, String label, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 24),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black)),
      ],
    );
  }

  Widget actionButton(String text, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}

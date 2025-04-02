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
                "Device ID : $deviceId", // Device ID passed here
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "\u{1F534} Offline",
                style: TextStyle(color: Colors.red),
              ), // Placeholder text for status
              const SizedBox(height: 10),

              // First row with three infoCircles
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  infoCircle(
                    "NaN °C",
                    "Indoor Temp",
                    Icons.thermostat,
                  ), // Placeholder value for indoor temp
                  const SizedBox(width: 15),
                  infoCircle(
                    "ON",
                    "Status",
                    Icons.power_settings_new,
                  ), // Placeholder for status
                  const SizedBox(width: 15),
                  infoCircle(
                    "NaN °C",
                    "Outdoor Temp",
                    Icons.settings,
                  ), // Placeholder value for outdoor temp
                ],
              ),

              const SizedBox(height: 15),

              // Second row with three infoCircles
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  infoCircle(
                    "0",
                    "Head Count",
                    Icons.door_front_door,
                  ), // Placeholder value for head count
                  const SizedBox(width: 15),
                  infoCircle(
                    "0",
                    "RPM",
                    Icons.speed,
                  ), // Placeholder value for RPM
                  const SizedBox(width: 15),
                  infoCircle(
                    "0",
                    "Power",
                    Icons.electrical_services,
                  ), // Placeholder value for power
                ],
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  actionButton("Change Status", Colors.orange),
                  const SizedBox(width: 10),
                  actionButton("Refresh", Colors.green),
                  const SizedBox(width: 10),
                  actionButton("See Records", Colors.red),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "Last Updated Data on : 2025-01-09 10:58:46", // Placeholder text for last update
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
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
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

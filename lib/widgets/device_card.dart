import 'package:flutter/material.dart';

enum DeviceStatus { inActive, active, danger }

class DeviceCard extends StatelessWidget {
  const DeviceCard({
    super.key,
    required this.name,
    required this.id,
    required this.client,
    required this.district,
    required this.city,
    required this.location,
    required this.status,
    required this.emergency,
  });

  final String name;
  final String id;
  final String client;
  final String district;
  final String city;
  final String location;
  final DeviceStatus status;
  final bool emergency;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF85F648), Color(0xFFCFE9C1)],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                name,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFB6B8B5), Color(0xFF373B35)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRow("Device Name:", name),
                  _buildRow("ID:", id),
                  _buildRow("Client:", client),
                  _buildRow("District:", district),
                  _buildRow("City:", city),
                  _buildRow("Location:", location),
                  _buildStatusRow("Status:", status),
                  _buildEmergencyRow("Emergency:", emergency),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, DeviceStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color:
                  status == DeviceStatus.inActive
                      ? Colors.red
                      : status == DeviceStatus.active
                      ? Colors.green
                      : Colors.orange,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              status == DeviceStatus.inActive
                  ? "Inactive"
                  : status == DeviceStatus.active
                  ? "Active"
                  : "Danger",
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmergencyRow(String label, bool emergency) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          Icon(
            emergency ? Icons.warning : Icons.check_circle,
            color: emergency ? Colors.red : Colors.green,
          ),
        ],
      ),
    );
  }
}

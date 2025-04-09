import 'package:flutter/material.dart';
import '../utils/error_logger.dart'; // ✅ Import the error logger

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
    required this.state,
    required this.pincode,
    required this.sector,
  });

  final String name;
  final String id;
  final String client;
  final String district;
  final String city;
  final String location;
  final String state;
  final String pincode;
  final String sector;
  final DeviceStatus status;
  final bool emergency;

  @override
  Widget build(BuildContext context) {
    try {
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
                    _safeBuild(() => _buildRow("Device Name:", name)),
                    _safeBuild(() => _buildRow("ID:", id)),
                    _safeBuild(() => _buildRow("Client:", client)),
                    _safeBuild(() => _buildRow("District:", district)),
                    _safeBuild(() => _buildRow("City:", city)),
                    _safeBuild(() => _buildRow("Location:", location)),
                    _safeBuild(() => _buildRow("Sector:", sector)),
                    _safeBuild(() => _buildRow("State:", state)),
                    _safeBuild(() => _buildRow("Pincode:", pincode)),
                    _safeBuild(() => _buildStatusRow("Status:", status)),
                    _safeBuild(
                      () => _buildEmergencyRow("Emergency:", emergency),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } catch (e, stackTrace) {
      ErrorLogger.logError(
        "Error building DeviceCard",
        e.toString(),
        stackTrace.toString(),
      );
      return const SizedBox(); // Return empty widget on error
    }
  }

  Widget _safeBuild(Widget Function() builder) {
    try {
      return builder();
    } catch (e, stackTrace) {
      ErrorLogger.logError(
        "Widget rendering failed",
        e.toString(),
        stackTrace.toString(),
      );
      return const SizedBox(); // Return a placeholder
    }
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
            child: Tooltip(
              message: value,
              child: Text(
                value,
                style: const TextStyle(color: Colors.white, fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusRow(String label, DeviceStatus status) {
    Color statusColor;
    String statusText;

    switch (status) {
      case DeviceStatus.inActive:
        statusColor = Colors.red;
        statusText = "Inactive";
        break;
      case DeviceStatus.active:
        statusColor = Colors.green;
        statusText = "Active";
        break;
      case DeviceStatus.danger:
        statusColor = Colors.orange;
        statusText = "Danger";
        break;
    }

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
              color: statusColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              statusText,
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

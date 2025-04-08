import 'package:flutter/material.dart';
import 'package:orbitsproject/pages/DeviceDetailPage.dart';
import 'package:orbitsproject/widgets/CustomAppBar.dart';
import 'package:orbitsproject/widgets/app_drawer.dart';
import 'package:orbitsproject/widgets/device_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:orbitsproject/utils/error_logger.dart'; // ✅ Error Logger

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String username = '';
  String password = '';
  String userRole = ''; // admin or client
  bool isLoading = true;

  List<Map<String, dynamic>> allDevices = [];
  List<Map<String, dynamic>> filteredDevices = [];

  @override
  void initState() {
    super.initState();
    _loadUserCredentials();
  }

  Future<void> _loadUserCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      password = prefs.getString('password') ?? '';
    });
    _fetchDevices();
  }

  Future<void> _fetchDevices() async {
    setState(() => isLoading = true);

    try {
      final getNameUrl = Uri.parse(
        'https://mitzvah-software-for-smart-air-curtain.onrender.com/get-name',
      );

      final getNameResponse = await http.post(
        getNameUrl,
        body: jsonEncode({"username": username, "password": password}),
        headers: {"Content-Type": "application/json"},
      );

      if (getNameResponse.statusCode == 200) {
        final getNameData = jsonDecode(getNameResponse.body);
        final flag = getNameData["flag"];
        userRole = flag;

        Map<String, String> requestBodyForDevices = {
          "cs": "",
          "ds": "",
          "cis": "",
          "ls": "",
          "dname": "",
          "refname": "",
        };

        if (flag == "client") {
          requestBodyForDevices["cs"] = getNameData["name"] ?? "";
        }

        final deviceUrl = Uri.parse(
          'https://mitzvah-software-for-smart-air-curtain.onrender.com/device-select',
        );

        final deviceResponse = await http.post(
          deviceUrl,
          body: jsonEncode(requestBodyForDevices),
          headers: {"Content-Type": "application/json"},
        );

        if (deviceResponse.statusCode == 200) {
          final List<dynamic> deviceList = jsonDecode(deviceResponse.body);

          final List<Map<String, dynamic>> mappedDevices =
              deviceList.map((device) {
                return {
                  "name": device["device-name"],
                  "id": device["uniqueId"],
                  "client": device["name"],
                  "district": device["district"],
                  "city": device["city"],
                  "location": device["location"],
                  "status": device["status"],
                  "emergency": device["emergency"],
                };
              }).toList();

          setState(() {
            allDevices = mappedDevices;
            filteredDevices = allDevices;
            isLoading = false;
          });
        } else {
          throw Exception("Device fetch failed");
        }
      } else {
        throw Exception("Initial authentication failed");
      }
    } catch (e, stack) {
      await ErrorLogger.logError(
        "DashboardPage _fetchDevices Error: $e",
        stack.toString(),
      );
      setState(() => isLoading = false);

      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }

  DeviceStatus _getStatusFromString(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return DeviceStatus.active;
      case 'danger':
        return DeviceStatus.danger;
      default:
        return DeviceStatus.inActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: AppDrawer(username: username, userRole: userRole),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child:
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 10),
                      _buildDeviceSummary(),
                      const SizedBox(height: 10),
                      _buildDeviceGrid(context),
                    ],
                  ),
                ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Text(
          "Dashboard",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.green),
          onPressed: _fetchDevices,
        ),
        _buildFilterButton(),
      ],
    );
  }

  Widget _buildFilterButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _showFilterDialog,
        borderRadius: BorderRadius.circular(8.0),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Icon(Icons.filter_list, color: Colors.white, size: 20),
                SizedBox(width: 8),
                Text(
                  "Filter",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showFilterDialog() {
    String? selectedDeviceName;
    String? selectedDeviceId;
    String? selectedClient;
    String? selectedDistrict;
    String? selectedCity;
    String? selectedLocation;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Filter Devices"),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildDropdown(
                      "Device Name",
                      selectedDeviceName,
                      allDevices.map((d) => d["name"].toString()).toSet(),
                      (value) =>
                          setDialogState(() => selectedDeviceName = value),
                    ),
                    _buildDropdown(
                      "Device ID",
                      selectedDeviceId,
                      allDevices.map((d) => d["id"].toString()).toSet(),
                      (value) => setDialogState(() => selectedDeviceId = value),
                    ),
                    _buildDropdown(
                      "Client",
                      selectedClient,
                      allDevices.map((d) => d["client"].toString()).toSet(),
                      (value) => setDialogState(() => selectedClient = value),
                    ),
                    _buildDropdown(
                      "District",
                      selectedDistrict,
                      allDevices.map((d) => d["district"].toString()).toSet(),
                      (value) => setDialogState(() => selectedDistrict = value),
                    ),
                    _buildDropdown(
                      "City",
                      selectedCity,
                      allDevices.map((d) => d["city"].toString()).toSet(),
                      (value) => setDialogState(() => selectedCity = value),
                    ),
                    _buildDropdown(
                      "Location",
                      selectedLocation,
                      allDevices.map((d) => d["location"].toString()).toSet(),
                      (value) => setDialogState(() => selectedLocation = value),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _applyFilters(
                          deviceName: selectedDeviceName,
                          deviceId: selectedDeviceId,
                          client: selectedClient,
                          district: selectedDistrict,
                          city: selectedCity,
                          location: selectedLocation,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("Apply Filters"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDropdown(
    String label,
    String? value,
    Set<String> options,
    void Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(labelText: label),
        value: value,
        items:
            options
                .map(
                  (option) =>
                      DropdownMenuItem(value: option, child: Text(option)),
                )
                .toList(),
        onChanged: onChanged,
      ),
    );
  }

  void _applyFilters({
    String? deviceName,
    String? deviceId,
    String? client,
    String? district,
    String? city,
    String? location,
  }) {
    setState(() {
      filteredDevices =
          allDevices.where((device) {
            return (deviceName == null || device["name"] == deviceName) &&
                (deviceId == null || device["id"] == deviceId) &&
                (client == null || device["client"] == client) &&
                (district == null || device["district"] == district) &&
                (city == null || device["city"] == city) &&
                (location == null || device["location"] == location);
          }).toList();
    });
  }

  Widget _buildDeviceSummary() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF043549),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            "Devices: ${filteredDevices.length}",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildDeviceGrid(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 1,
      children: [
        for (var device in filteredDevices)
          StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => DeviceDetailPage(deviceId: device["id"]),
                  ),
                );
              },
              child: DeviceCard(
                name: device['name'] ?? '',
                id: device['id'] ?? '',
                client: device['client'] ?? '',
                district: device['district'] ?? '',
                city: device['city'] ?? '',
                location: device['location'] ?? '',
                status: _getStatusFromString(device['status']),
                emergency: device['emergency'] ?? false,
              ),
            ),
          ),
      ],
    );
  }
}

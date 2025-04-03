import 'package:flutter/material.dart';
import 'package:orbitsproject/pages/DeviceDetailPage.dart';
import 'package:orbitsproject/widgets/CustomAppBar.dart';
import 'package:orbitsproject/widgets/app_drawer.dart';
import 'package:orbitsproject/widgets/device_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<Map<String, dynamic>> allDevices = [
    {
      "name": "Device 1",
      "id": "12345",
      "client": "Client A",
      "district": "District 1",
      "location": "Location 1",
      "status": DeviceStatus.active,
      "changeStatus": true,
      "emergency": false,
      "city": "City A",
    },
    {
      "name": "Device 2",
      "id": "67890",
      "client": "Client B",
      "district": "District 2",
      "location": "Location 2",
      "status": DeviceStatus.inActive,
      "changeStatus": true,
      "emergency": true,
      "city": "City B",
    },
    {
      "name": "Device 3",
      "id": "54321",
      "client": "Client C",
      "district": "District 3",
      "location": "Location 3",
      "status": DeviceStatus.danger,
      "changeStatus": true,
      "emergency": false,
      "city": "City C",
    },
    {
      "name": "Device 4",
      "id": "98765",
      "client": "Client D",
      "district": "District 4",
      "location": "Location 4",
      "status": DeviceStatus.active,
      "changeStatus": false,
      "emergency": true,
      "city": "City D",
    },
    {
      "name": "Device 5",
      "id": "11223",
      "client": "Client E",
      "district": "District 5",
      "location": "Location 5",
      "status": DeviceStatus.inActive,
      "changeStatus": true,
      "emergency": false,
      "city": "City E",
    },
    {
      "name": "Device 6",
      "id": "44556",
      "client": "Client F",
      "district": "District 6",
      "location": "Location 6",
      "status": DeviceStatus.danger,
      "changeStatus": false,
      "emergency": true,
      "city": "City F",
    },
    {
      "name": "Device 7",
      "id": "77889",
      "client": "Client G",
      "district": "District 7",
      "location": "Location 7",
      "status": DeviceStatus.active,
      "changeStatus": true,
      "emergency": false,
      "city": "City G",
    },
    {
      "name": "Device 8",
      "id": "99000",
      "client": "Client H",
      "district": "District 8",
      "location": "Location 8",
      "status": DeviceStatus.inActive,
      "changeStatus": false,
      "emergency": true,
      "city": "City H",
    },
    {
      "name": "Device 1",
      "id": "12345",
      "client": "Client A",
      "district": "District 1",
      "location": "Location 1",
      "status": DeviceStatus.active,
      "changeStatus": true,
      "emergency": false,
      "city": "City A",
    },
    {
      "name": "Device 2",
      "id": "67890",
      "client": "Client B",
      "district": "District 2",
      "location": "Location 2",
      "status": DeviceStatus.inActive,
      "changeStatus": false,
      "emergency": true,
      "city": "City B",
    },
    {
      "name": "Device 3",
      "id": "54321",
      "client": "Client C",
      "district": "District 3",
      "location": "Location 3",
      "status": DeviceStatus.danger,
      "changeStatus": true,
      "emergency": false,
      "city": "City C",
    },
    {
      "name": "Device 4",
      "id": "98765",
      "client": "Client D",
      "district": "District 4",
      "location": "Location 4",
      "status": DeviceStatus.active,
      "changeStatus": false,
      "emergency": true,
      "city": "City D",
    },
    {
      "name": "Device 5",
      "id": "11223",
      "client": "Client E",
      "district": "District 5",
      "location": "Location 5",
      "status": DeviceStatus.inActive,
      "changeStatus": true,
      "emergency": false,
      "city": "City E",
    },
    {
      "name": "Device 6",
      "id": "44556",
      "client": "Client F",
      "district": "District 6",
      "location": "Location 6",
      "status": DeviceStatus.danger,
      "changeStatus": false,
      "emergency": true,
      "city": "City F",
    },
    {
      "name": "Device 7",
      "id": "77889",
      "client": "Client G",
      "district": "District 7",
      "location": "Location 7",
      "status": DeviceStatus.active,
      "changeStatus": true,
      "emergency": false,
      "city": "City G",
    },
    {
      "name": "Device 8",
      "id": "99000",
      "client": "Client H",
      "district": "District 8",
      "location": "Location 8",
      "status": DeviceStatus.inActive,
      "changeStatus": false,
      "emergency": true,
      "city": "City H",
    },
    {
      "name": "Device 1",
      "id": "12345",
      "client": "Client A",
      "district": "District 1",
      "location": "Location 1",
      "status": DeviceStatus.active,
      "changeStatus": true,
      "emergency": false,
      "city": "City A",
    },
    {
      "name": "Device 2",
      "id": "67890",
      "client": "Client B",
      "district": "District 2",
      "location": "Location 2",
      "status": DeviceStatus.inActive,
      "changeStatus": false,
      "emergency": true,
      "city": "City B",
    },
    {
      "name": "Device 3",
      "id": "54321",
      "client": "Client C",
      "district": "District 3",
      "location": "Location 3",
      "status": DeviceStatus.danger,
      "changeStatus": true,
      "emergency": false,
      "city": "City C",
    },
    {
      "name": "Device 4",
      "id": "98765",
      "client": "Client D",
      "district": "District 4",
      "location": "Location 4",
      "status": DeviceStatus.active,
      "changeStatus": false,
      "emergency": true,
      "city": "City D",
    },
    {
      "name": "Device 5",
      "id": "11223",
      "client": "Client E",
      "district": "District 5",
      "location": "Location 5",
      "status": DeviceStatus.inActive,
      "changeStatus": true,
      "emergency": false,
      "city": "City E",
    },
    {
      "name": "Device 6",
      "id": "44556",
      "client": "Client F",
      "district": "District 6",
      "location": "Location 6",
      "status": DeviceStatus.danger,
      "changeStatus": false,
      "emergency": true,
      "city": "City F",
    },
    {
      "name": "Device 7",
      "id": "77889",
      "client": "Client G",
      "district": "District 7",
      "location": "Location 7",
      "status": DeviceStatus.active,
      "changeStatus": true,
      "emergency": false,
      "city": "City G",
    },
    {
      "name": "Device 8",
      "id": "99000",
      "client": "Client H",
      "district": "District 8",
      "location": "Location 8",
      "status": DeviceStatus.inActive,
      "changeStatus": false,
      "emergency": true,
      "city": "City H",
    },
  ];

  List<Map<String, dynamic>> filteredDevices = [];
  String selectedStatus = "All"; // State variable to track the selected value

  @override
  void initState() {
    super.initState();
    // Initially, show all devices
    filteredDevices = allDevices;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: AppDrawer(username: "John Doe"),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: SingleChildScrollView(
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

  // Header Widget
  Widget _buildHeader() {
    return Row(
      children: [
        const Text(
          "Dashboard",
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        const Spacer(),
        _buildFilterButton(),
      ],
    );
  }

  Widget _buildFilterButton() {
    return Material(
      color:
          Colors.transparent, // Transparent background for the Material widget
      child: InkWell(
        onTap:
            () =>
                _showFilterDialog(), // Extracted dialog logic into a separate method
        borderRadius: BorderRadius.circular(
          8.0,
        ), // Rounded corners for ripple effect
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.green, // Green background
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: const [
                Icon(
                  Icons.filter_list,
                  color: Colors.white,
                  size: 20,
                ), // Filter icon
                SizedBox(width: 8), // Space between icon and text
                Text(
                  "Filter",
                  style: TextStyle(
                    color: Colors.white, // White text color
                    fontSize: 16,
                  ),
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
                    // Device Name Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: "Device Name",
                      ),
                      value: selectedDeviceName,
                      items:
                          allDevices
                              .map((device) => device["name"].toString())
                              .toSet()
                              .map(
                                (name) => DropdownMenuItem(
                                  value: name,
                                  child: Text(name),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setDialogState(() => selectedDeviceName = value);
                      },
                    ),

                    const SizedBox(height: 10),

                    // Device ID Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "Device ID"),
                      value: selectedDeviceId,
                      items:
                          allDevices
                              .map((device) => device["id"].toString())
                              .toSet()
                              .map(
                                (id) => DropdownMenuItem(
                                  value: id,
                                  child: Text(id),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setDialogState(() => selectedDeviceId = value);
                      },
                    ),

                    const SizedBox(height: 10),

                    // Client Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "Client"),
                      value: selectedClient,
                      items:
                          allDevices
                              .map((device) => device["client"].toString())
                              .toSet()
                              .map(
                                (client) => DropdownMenuItem(
                                  value: client,
                                  child: Text(client),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setDialogState(() => selectedClient = value);
                      },
                    ),

                    const SizedBox(height: 10),

                    // District Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "District"),
                      value: selectedDistrict,
                      items:
                          allDevices
                              .map((device) => device["district"].toString())
                              .toSet()
                              .map(
                                (district) => DropdownMenuItem(
                                  value: district,
                                  child: Text(district),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setDialogState(() => selectedDistrict = value);
                      },
                    ),

                    const SizedBox(height: 10),

                    // City Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "City"),
                      value: selectedCity,
                      items:
                          allDevices
                              .map((device) => device["city"].toString())
                              .toSet()
                              .map(
                                (city) => DropdownMenuItem(
                                  value: city,
                                  child: Text(city),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setDialogState(() => selectedCity = value);
                      },
                    ),

                    const SizedBox(height: 10),

                    // Location Dropdown
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "Location"),
                      value: selectedLocation,
                      items:
                          allDevices
                              .map((device) => device["location"].toString())
                              .toSet()
                              .map(
                                (location) => DropdownMenuItem(
                                  value: location,
                                  child: Text(location),
                                ),
                              )
                              .toList(),
                      onChanged: (value) {
                        setDialogState(() => selectedLocation = value);
                      },
                    ),

                    const SizedBox(height: 20),

                    // Apply Button
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
            bool matchesDeviceName =
                deviceName == null || device["name"] == deviceName;
            bool matchesDeviceId = deviceId == null || device["id"] == deviceId;
            bool matchesClient = client == null || device["client"] == client;
            bool matchesDistrict =
                district == null || device["district"] == district;
            bool matchesCity = city == null || device["city"] == city;
            bool matchesLocation =
                location == null || device["location"] == location;

            return matchesDeviceName &&
                matchesDeviceId &&
                matchesClient &&
                matchesDistrict &&
                matchesCity &&
                matchesLocation;
          }).toList();
    });
  }

  // Device Summary Widget
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

  // Device Grid Widget
  Widget _buildDeviceGrid(BuildContext context) {
    return StaggeredGrid.count(
      crossAxisCount: 1,
      children: [
        for (var device in filteredDevices)
          StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: GestureDetector(
              onTap: () {
                // Navigate to DeviceDetailPage and pass the device ID
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => DeviceDetailPage(deviceId: device["id"]),
                  ),
                );
              },
              child: DeviceCard(
                name: device["name"],
                id: device["id"],
                client: device["client"],
                district: device["district"],
                location: device["location"],
                status: device["status"],
                changeStatus: device["changeStatus"],
                emergency: device["emergency"],
                city: device["city"],
              ),
            ),
          ),
      ],
    );
  }
}

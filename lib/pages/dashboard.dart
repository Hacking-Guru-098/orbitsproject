import 'package:flutter/material.dart';
import 'package:orbitsproject/pages/DeviceDetailPage.dart';
import 'package:orbitsproject/pages/Profile.dart';
import 'package:orbitsproject/widgets/CustomAppBar.dart';
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
  String selectedFilter = 'All';

  // Create a Dictionary to map status strings to There Color
  static const Map<String, Color> statusColors = {
    'All': Colors.blue,
    'Active': Colors.green,
    'Inactive': Colors.orange,
    'Danger': Colors.red,
  };

  @override
  void initState() {
    super.initState();
    // Initially, show all devices
    filteredDevices = allDevices;
  }

  void _fetchFilteredData(String filter) {
    setState(() {
      selectedFilter = filter; // Update the selected filter
      if (filter == 'All') {
        filteredDevices = allDevices;
      } else if (filter == 'Active') {
        filteredDevices =
            allDevices
                .where((device) => device['status'] == DeviceStatus.active)
                .toList();
      } else if (filter == 'Inactive') {
        filteredDevices =
            allDevices
                .where((device) => device['status'] == DeviceStatus.inActive)
                .toList();
      } else if (filter == 'Danger') {
        filteredDevices =
            allDevices
                .where((device) => device['status'] == DeviceStatus.danger)
                .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: _buildDrawer(context),
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

  // Selected Filter Label Widget
  Widget _buildSelectedFilterLabel() {
    return _buildFilterItem(
      statusColors[selectedFilter] ?? Colors.blue,
      selectedFilter,
    );
  }

  // Header Widget
  Widget _buildHeader() {
    return Row(
      children: [
        const Text(
          "Dashboard",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        _buildFilterButton(),
      ],
    );
  }

  // Filter Button Widget
  Widget _buildFilterButton() {
    return PopupMenuButton<String>(
      onSelected: (value) {
        _fetchFilteredData(value); // Fetch data based on the selected filter
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      itemBuilder: (BuildContext context) => _buildPopupMenuItems(),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: const [
              Icon(Icons.filter_list, color: Colors.black, size: 20),
              SizedBox(width: 8),
              Text(
                "Filter",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PopupMenuEntry<String>> _buildPopupMenuItems() {
    return [
      PopupMenuItem<String>(
        value: 'All',
        child: _buildFilterItem(
          statusColors['All'] ?? Colors.blue,
          'All',
        ),
      ),
      PopupMenuItem<String>(
        value: 'Active',
        child: _buildFilterItem(
          statusColors['Active'] ?? Colors.green,
          'Active',
        ),
      ),
      PopupMenuItem<String>(
        value: 'Inactive',
        child: _buildFilterItem(
          statusColors['Inactive'] ?? Colors.orange,
          'Inactive',
        ),
      ),
      PopupMenuItem<String>(
        value: 'Danger',
        child: _buildFilterItem(
          statusColors['Danger'] ?? Colors.red,
          'Danger',
        ),
      ),
    ];
  }

  Widget _buildFilterItem(Color color, String name) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color, // Background color for this item
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(name, style: TextStyle(color: Colors.white)),
    );
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
            "Total Devices: ${filteredDevices.length}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          _buildSelectedFilterLabel(),
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

  // Drawer Widget
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.green),
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 50),
                const SizedBox(height: 10),
              ],
            ),
          ),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _createDrawerItem(
            icon: Icons.account_circle,
            text: 'Account',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 24),
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}

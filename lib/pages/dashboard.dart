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
                    fontWeight: FontWeight.w500,
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
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Filter Options",
      transitionDuration: const Duration(
        milliseconds: 100,
      ), // Animation duration
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF96FA67),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: const Text(
                        "Filters",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFilterOptions(), // Filter options widget
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: const Text("Close"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut, // Smooth fade-in animation
          ),
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut, // Smooth scaling animation
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }

  Widget _buildStatusFilterDropdown() {
    return Container(
      width: 120, // Set a fixed width for the dropdown
      height: 38, // Set a fixed height for the dropdown
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the dropdown button
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border: Border.all(color: Colors.grey[300]!), // Border color
      ),
      child: DropdownButton<String>(
        value: selectedStatus, // Bind the selected value to the state variable
        isExpanded: true, // Make the dropdown expand to full width
        underline: const SizedBox(), // Remove the default underline
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ), // Dropdown icon
        style: const TextStyle(
          color: Colors.black, // Text color
          fontSize: 16, // Font size
          fontWeight: FontWeight.w500, // Font weight
        ),
        items: [
          DropdownMenuItem(
            value: "All",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              child: Container(
                color: Colors.grey[200], // Background color for "All"
                padding: const EdgeInsets.all(4), // Padding around the text
                child: const Text("All"),
              ),
            ),
          ),
          DropdownMenuItem(
            value: "Active",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              child: Container(
                color: Colors.green[100], // Background color for "Active"
                padding: const EdgeInsets.all(4),
                child: const Text("Active"),
              ),
            ),
          ),
          DropdownMenuItem(
            value: "Inactive",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              child: Container(
                color: Colors.red[100], // Background color for "Inactive"
                padding: const EdgeInsets.all(4),
                child: const Text("Inactive"),
              ),
            ),
          ),
          DropdownMenuItem(
            value: "Danger",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Rounded corners
              child: Container(
                color: Colors.orange[100], // Background color for "Danger"
                padding: const EdgeInsets.all(4),
                child: const Text("Danger"),
              ),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            selectedStatus = value!; // Update the selected value
          });
          print("Selected: $value");
        },
      ),
    );
  }

  Widget _buildFilterOptions() {
    return Column(
      children: [
        // Add your filter options here
        // For example, checkboxes or dropdowns for filtering devices
      ],
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
            "Devices: ${filteredDevices.length}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          _buildStatusFilterDropdown(),
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

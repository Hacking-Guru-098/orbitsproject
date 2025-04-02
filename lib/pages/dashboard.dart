import 'package:flutter/material.dart';
import 'package:orbitsproject/pages/DeviceDetailPage.dart';
import 'package:orbitsproject/pages/Profile.dart';
import 'package:orbitsproject/widgets/CustomAppBar.dart';
import 'package:orbitsproject/widgets/device_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final List<Map<String, dynamic>> devices = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Column(
                children: [
                  Image.asset('assets/logo.png', height: 50),
                  SizedBox(height: 10),
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 1,
            children: [
              for (var device in devices)
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to DeviceDetailPage and pass the device ID
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  DeviceDetailPage(deviceId: device["id"]),
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
          ),
        ),
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
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      onTap: onTap,
    );
  }
}

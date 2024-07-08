import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vehicle Details',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: VehicleDetailsPage(),
    );
  }
  
}

class VehicleDetailsPage extends StatefulWidget {
  @override
  _VehicleDetailsPageState createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage> {
  List<Vehicle> vehicles = [
    Vehicle(type: 'Car', name: 'ttoyota', id: 5),
    Vehicle(type: 'Van', name: 'hsdwd', id: 5),
    Vehicle(type: 'Car', name: 'eeeer', id: 5),
  ];

  late List<Vehicle> filteredVehicles;

  @override
  void initState() {
    super.initState();
    filteredVehicles = vehicles;
  }

  void filterVehicles(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredVehicles = vehicles;
      } else {
        filteredVehicles = vehicles
            .where((vehicle) =>
                vehicle.name.toLowerCase().contains(query.toLowerCase()) ||
                vehicle.type.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Details'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button pressed
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options button pressed
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterVehicles,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.orange.shade100,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredVehicles.length,
              itemBuilder: (context, index) {
                final vehicle = filteredVehicles[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text('${vehicle.id}'),
                  subtitle: Text('${vehicle.type} - ${vehicle.name}'),
                  trailing: Icon(Icons.more_vert),
                  onTap: () {
                    // Handle list item tap
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Vehicle {
  final String type;
  final String name;
  final int id;

  Vehicle({required this.type, required this.name, required this.id});
}
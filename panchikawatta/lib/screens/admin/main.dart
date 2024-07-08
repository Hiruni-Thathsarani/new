import 'package:flutter/material.dart';
import 'package:panchikawatta/screens/admin/admin_page.dart';
import 'package:panchikawatta/screens/admin/vehicleD.dart';
import 'package:panchikawatta/screens/admin/vehicle_details_2.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 25, 20, 19)),
        useMaterial3: true,
      ),
      home: AdminPage(),
    );
  }
}

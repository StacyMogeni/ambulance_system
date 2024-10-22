import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const AmbulanceBookingApp());
}

class AmbulanceBookingApp extends StatelessWidget {
  const AmbulanceBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ambulance Booking System',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const LoginScreen(),
    );
  }
}

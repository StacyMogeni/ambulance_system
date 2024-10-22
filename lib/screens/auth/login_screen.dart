import 'package:flutter/material.dart';
import '../patient/patient_home_screen.dart';
import '../driver/driver_home_screen.dart';
import '../admin/admin_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _userType = 'patient'; // Default user type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emergency,
                size: 80,
                color: Colors.red,
              ),
              const SizedBox(height: 32),
              // User Type Selection
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                    value: 'patient',
                    label: Text('Patient'),
                    icon: Icon(Icons.person),
                  ),
                  ButtonSegment(
                    value: 'driver',
                    label: Text('Driver'),
                    icon: Icon(Icons.drive_eta),
                  ),
                  ButtonSegment(
                    value: 'admin',
                    label: Text('Admin'),
                    icon: Icon(Icons.admin_panel_settings),
                  ),
                ],
                selected: {_userType},
                onSelectionChanged: (Set<String> newSelection) {
                  setState(() {
                    _userType = newSelection.first;
                  });
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Navigate based on user type
                    Widget homeScreen;
                    switch (_userType) {
                      case 'patient':
                        homeScreen = const PatientHomeScreen();
                        break;
                      case 'driver':
                        homeScreen = const DriverHomeScreen();
                        break;
                      case 'admin':
                        homeScreen = const AdminDashboard();
                        break;
                      default:
                        homeScreen = const PatientHomeScreen();
                    }
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => homeScreen),
                    );
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
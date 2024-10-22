import 'package:flutter/material.dart';
import 'package:ambulance_system/screens/patient/booking_details_screen.dart';

class PatientHomeScreen extends StatelessWidget {
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Emergency Services',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: const [
                  EmergencyCard(
                    title: 'Life Support',
                    icon: Icons.local_hospital,
                  ),
                  EmergencyCard(
                    title: 'Pediatric',
                    icon: Icons.child_care,
                  ),
                  EmergencyCard(
                    title: 'General',
                    icon: Icons.medical_services,
                  ),
                  EmergencyCard(
                    title: 'Non-Emergency',
                    icon: Icons.health_and_safety,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmergencyCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const EmergencyCard({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingDetailsScreen(
                emergencyType: title,
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final String? patientName;
  final String? location;
  final String? emergencyType;
  final double? distance;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;

  const RequestCard({
    Key? key,
    this.patientName = 'John Onyango',
    this.location = '123 Main Street',
    this.emergencyType = 'Life Support',
    this.distance = 2.5,
    this.onAccept,
    this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Emergency Request',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${distance?.toStringAsFixed(1)} km away',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Patient: $patientName'),
            const SizedBox(height: 4),
            Text('Location: $location'),
            const SizedBox(height: 4),
            Text('Type: $emergencyType'),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Accept'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onDecline,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Decline'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

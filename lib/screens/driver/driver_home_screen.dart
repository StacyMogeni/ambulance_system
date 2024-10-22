import 'package:flutter/material.dart';
import '../../widgets/request_card.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({Key? key}) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool _isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Navigate to request history
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Navigate to profile
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Available for Service',
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                          value: _isAvailable,
                          activeColor: Colors.green,
                          onChanged: (bool value) {
                            setState(() {
                              _isAvailable = value;
                            });
                            // TODO: Update availability status in backend
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isAvailable
                          ? 'You are currently accepting new requests'
                          : 'You are currently offline',
                      style: TextStyle(
                        color: _isAvailable ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Incoming Requests',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (_isAvailable)
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      // Refresh request list
                    },
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isAvailable
                  ? ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const RequestCard();
                },
              )
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.notifications_off,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Go online to view requests',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
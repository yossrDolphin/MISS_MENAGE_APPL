import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import 'service.dart';
import '../booking/booking_page.dart';

class ServiceDetailsPage extends StatelessWidget {
  final Service service;

  const ServiceDetailsPage({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.name),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              service.icon,
              size: 64,
              color: AppColors.primary,
            ),
            const SizedBox(height: 16),
            Text(
              service.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              service.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                // NEXT STEP: booking / request flow
                  Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (_) => BookingPage(service: service),
                   ),
                   );
              },
              child: const Text('Request this service'),
            ),
          ],
        ),
      ),
    );
  }
}

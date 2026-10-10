import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../services/models/service.dart' show Service;


class BookingSummaryPage extends StatelessWidget {
  final Service service;
  final DateTime date;
  final TimeOfDay time;
  final String address;

  const BookingSummaryPage({
    super.key,
    required this.service,
    required this.date,
    required this.time,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking summary'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Row('Service', service.name),
            _Row(
              'Date',
              '${date.day}/${date.month}/${date.year}',
            ),
            _Row('Time', time.format(context)),
            _Row('Address', address.isEmpty ? '-' : address),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                 
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Booking confirmed'),
                    ),
                  );
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Confirm booking'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;

  const _Row(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

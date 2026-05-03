import 'package:flutter/material.dart';
import '../data/mock_services.dart';
import 'service_details_page.dart';
import 'widgets/service_tile.dart';

class ServicesPage extends StatelessWidget {
  final String category;

  const ServicesPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final services = servicesByCategory[category] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return ServiceTile(
           service: service,
           onTap: () {
            Navigator.push(
            context,
             MaterialPageRoute(
               builder: (_) => ServiceDetailsPage(service: service),
      ),
    );
  },
);

        },
      ),
    );
  }
}
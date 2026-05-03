import 'package:flutter/material.dart';
import 'services_page.dart';
import 'widgets/category_card.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Services")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            CategoryCard(
              title: "Plumbing",
              icon: Icons.plumbing,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                          builder: (_) => const ServicesPage(category: "Plumbing"),
                             ),
                );
              },
            ),
            CategoryCard(
              title: "Cleaning",
              icon: Icons.cleaning_services,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                          builder: (_) => const ServicesPage(category: "Cleaning"),
                             ),
                );
              },
            ),
            CategoryCard(
              title: "Electricity",
              icon: Icons.electrical_services,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                          builder: (_) => const ServicesPage(category: "Electricity"),
                             ),
                );
              },
            ),
            CategoryCard(
              title: "Installation",
              icon: Icons.build,
              onTap: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                          builder: (_) => const ServicesPage(category: "Installation"),
                             ),
                );},
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demandes disponibles')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, index) => Card(
          child: ListTile(
            title: Text('Demande #$index'),
            subtitle: const Text('Prix proposé : 30 TND'),
            trailing: ElevatedButton(
              child: const Text('Envoyer offre'),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
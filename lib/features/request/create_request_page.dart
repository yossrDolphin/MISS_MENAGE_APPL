import 'package:flutter/material.dart';

class CreateRequestPage extends StatelessWidget {
  const CreateRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nouvelle demande')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Adresse')),
            TextField(decoration: InputDecoration(labelText: 'Prix proposé')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Publier la demande'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('bookings')
            .where('userId', isEqualTo: userId)
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No bookings yet"));
          }

          final bookings = snapshot.data!.docs;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              final data = bookings[index];
              final rawDate = data['date'];
              final DateTime date = DateTime.parse(rawDate);
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const Icon(Icons.build),
                  title: Text(data['service']),
                  subtitle: Text(
                        "${date.day}/${date.month}/${date.year} • ${data['time']}",
                      ),
                    // ✅ HERE
                  trailing: Text(
                    data['status'],
                    style: TextStyle(
                    color: data['status'] == 'pending'
                    ? Colors.orange
                    : Colors.green,
                    fontWeight: FontWeight.w600,
          ),
         ),
       ),
              );
            },
          );
        },
      ),
    );
  }
}
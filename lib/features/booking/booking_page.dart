import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constants/colors.dart';
import '../services/service.dart';
import 'booking_summary_page.dart';
import 'map_picker_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingPage extends StatefulWidget {
  final Service service;

  const BookingPage({super.key, required this.service});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  LatLng? selectedLocation;

  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  // Display text for location (no Maps API required)
  String get displayAddress {
    if (selectedLocation == null) return 'Pick location on map';
    return 'Lat: ${selectedLocation!.latitude.toStringAsFixed(5)}, '
           'Lng: ${selectedLocation!.longitude.toStringAsFixed(5)}';
  }
  
Future<void> saveBooking() async {
  await FirebaseFirestore.instance.collection('bookings').add({
    'service': widget.service.name,
    'date': selectedDate!.toIso8601String(),
    'time': selectedTime!.format(context),
    'notes': notesController.text,
    'createdAt': FieldValue.serverTimestamp(),
        // location optionnelle
    'location': selectedLocation == null
        ? null
        : {
            'lat': selectedLocation!.latitude,
            'lng': selectedLocation!.longitude,
          },
  });
}



  // ---------- UI helpers ----------
  Widget sectionCard({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // ---------- Pickers ----------
  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text =
            '${picked.day}/${picked.month}/${picked.year}';
      });
    }
  }

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
        timeController.text = picked.format(context);
      });
    }
  }

  Future<void> pickLocation() async {
    final LatLng? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MapPickerPage()),
    );

    if (result != null) {
      setState(() => selectedLocation = result);
    }
  }

  // ---------- Build ----------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book ${widget.service.name}'),
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              widget.service.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.service.description,
              style: const TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 24),

            sectionCard(
              children: [
                const _Label('Date'),
                TextField(
                  controller: dateController,
                  readOnly: true,
                  onTap: pickDate,
                  decoration: const InputDecoration(
                    hintText: 'Select date',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                const SizedBox(height: 12),

                const _Label('Time'),
                TextField(
                  controller: timeController,
                  readOnly: true,
                  onTap: pickTime,
                  decoration: const InputDecoration(
                    hintText: 'Select time',
                    prefixIcon: Icon(Icons.access_time),
                  ),
                ),
                const SizedBox(height: 12),

                const _Label('Notes'),
                TextField(
                  controller: notesController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Apartment, floor, instructions...',
                  ),
                ),
                const SizedBox(height: 12),

                const _Label('Location'),
                TextField(
                  readOnly: true,
                  onTap: pickLocation,
                  decoration: InputDecoration(
                    hintText: displayAddress,
                    prefixIcon: const Icon(Icons.location_on),
                  ),
                ),
              ],
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (selectedDate == null ||
                      selectedTime == null
                  //     || selectedLocation == null
                      ) {
                        
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select date, time and location'),
                      ),
                    );
                    return;
                  }
                   try {
                        final data = {
                          'serviceName': widget.service.name,
                          'date': selectedDate,
                          'time': selectedTime!.format(context),
                          'notes': notesController.text,
                          'createdAt': FieldValue.serverTimestamp(),
                        };

                  if (selectedLocation != null) {
                 data['location'] = {
                       'lat': selectedLocation!.latitude,
                       'lng': selectedLocation!.longitude,
                      };
                  }

        await FirebaseFirestore.instance.collection('bookings').add(data);

                    await saveBooking();
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (_) => BookingSummaryPage(
                            service: widget.service,
                            date: selectedDate!,
                            time: selectedTime!,
                            address: displayAddress,
                            ),
                          ),
                          );
                } catch(e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error saving booking: $e')),
                   );
                }
                },
                child: const Text('Confirm request'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}

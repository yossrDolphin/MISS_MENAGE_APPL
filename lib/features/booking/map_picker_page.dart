import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPickerPage extends StatefulWidget {
  const MapPickerPage({super.key});

  @override
  State<MapPickerPage> createState() => _MapPickerPageState();
}

class _MapPickerPageState extends State<MapPickerPage> {
  LatLng? selectedPosition;

  Future<LatLng> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select location')),
      body: FutureBuilder<LatLng>(
        future: _getCurrentLocation(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: snapshot.data!,
              zoom: 15,
            ),
            myLocationEnabled: true,
            onTap: (latLng) {
              setState(() => selectedPosition = latLng);
            },
            markers: selectedPosition == null
                ? {}
                : {
                    Marker(
                      markerId: const MarkerId('selected'),
                      position: selectedPosition!,
                    ),
                  },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: selectedPosition == null
            ? null
            : () {
                Navigator.pop(context,
                 {
                 'latLng': selectedPosition,
                 'address': 'Rue …',
                 })
                 ;
              },
        label: const Text('Confirm location'),
        icon: const Icon(Icons.check),
      ),
    );
  }
}

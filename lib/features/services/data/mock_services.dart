import 'package:flutter/material.dart';
import '../models/service.dart';

final Map<String, List<Service>> servicesByCategory = {
  "Plumbing": [
    Service(
      name: "Fix leak",
      description: "Repair water leaks",
      icon: Icons.water_drop,
    ),
    Service(
      name: "Install faucet",
      description: "Install or replace faucet",
      icon: Icons.plumbing,
    ),
  ],
  "Cleaning": [
    Service(
      name: "Home cleaning",
      description: "Full house cleaning",
      icon: Icons.cleaning_services,
    ),
  ],
  "Electricity": [
    Service(
      name: "Fix wiring",
      description: "Repair electrical issues",
      icon: Icons.electrical_services,
    ),
  ],
    "Installation": [
    Service(
      name: "Mounting & setup",
      description: "Wall mounting and setup of your TV",
      icon: Icons.tv,
    ),
  ],
};
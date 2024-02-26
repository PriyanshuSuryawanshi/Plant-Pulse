import 'package:flutter/material.dart';
import 'package:plant_pulse/utils/bottom_navabr.dart';

void main() {
  runApp(const PlantPulseApp());
}

class PlantPulseApp extends StatelessWidget {
  const PlantPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Pulse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
        useMaterial3: true,
      ),
      home: BottomNav(),
    );
  }
}

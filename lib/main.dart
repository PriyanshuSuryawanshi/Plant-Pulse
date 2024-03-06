import 'package:flutter/material.dart';
import 'package:plant_pulse/firebase_options.dart';
import 'package:plant_pulse/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PlantPulseApp());
}

class PlantPulseApp extends StatefulWidget {
  const PlantPulseApp({super.key});

  @override
  State<PlantPulseApp> createState() => _PlantPulseAppState();
}

class _PlantPulseAppState extends State<PlantPulseApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant Pulse',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green.shade900),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}


// Platform  Firebase App Id
// android   1:807039639077:android:c65e4ee3a6ec5e887f29cc
// ios       1:807039639077:ios:b464987928234b2a7f29cc
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_pulse/database/plant_info.dart';

class FirebaseDatabase {
  static final FirebaseDatabase _instance = FirebaseDatabase._internal();

  factory FirebaseDatabase() {
    return _instance;
  }

  FirebaseDatabase._internal();

  final _firestore = FirebaseFirestore.instance;

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Future<void> fetchAndPrintPlantData() async {
    final plantInfoList = await fetchPlantData();

    if (plantInfoList.isEmpty) {
      print('No plant data found in Firestore.');
      return;
    }

    for (final plantInfo in plantInfoList) {
      // Print each plant information on a separate line
      print(plantInfo);
    }
  }

  Future<List<PlantInfo>> fetchPlantData() async {
    final querySnapshot = await _firestore.collection('PlantData').get();

    return querySnapshot.docs.map((doc) {
      final plantName = doc.id;
      final data = doc.data();
      final plantInfo = PlantInfo(
        plantName: plantName,
        plantType: data['plantType'] != null ? data['plantType'] as int : null,
        plantDescription: data['plantDescription'] != null
            ? data['plantDescription'] as String
            : null,
        humidity: data['humidity'] != null ? data['humidity'] as int : null,
        temperature:
            data['temperature'] != null ? data['temperature'] as int : null,
      );
      return plantInfo;
    }).toList();
  }
}

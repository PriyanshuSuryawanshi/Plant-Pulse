// import 'dart:core';

// class PlantInfo {
//   final String plantName;
//   // final String plantImage;
//   final int plantType;
//   final String plantDescription;
//   // final List<Duration> plantWaterCycle;
//   // final List<Duration> plantManureCycle;
//   final int humidity;
//   final int temperature;

//   PlantInfo({
//     required this.plantName,
//     // required this.plantImage,
//     required this.plantType,
//     required this.plantDescription,
//     // required this.plantWaterCycle,
//     // required this.plantManureCycle,
//     required this.humidity,
//     required this.temperature,
//   });
// }

class PlantInfo {
  final String plantName;
  final int? plantType;
  final String? plantDescription;
  final int? humidity;
  final int? temperature;

  @override
  String toString() {
    return "Plant Name: $plantName\n  Type: $plantType\n  Description: $plantDescription\n  Humidity: $humidity\n  Temperature: $temperature";
  }

  PlantInfo({
    required this.plantName,
    required this.plantType,
    required this.plantDescription,
    required this.humidity,
    required this.temperature,
  });
}

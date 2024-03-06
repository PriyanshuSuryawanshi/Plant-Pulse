import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final String plantName;
  final ImageProvider plantimg;
  final int plantType;

  const PlantCard({
    Key? key,
    required this.plantName,
    required this.plantimg,
    required this.plantType,
  }) : super(key: key);

  String getPlantTypeName(int plantType) {
    switch (plantType) {
      case 1:
        return 'Indoor Plant';
      case 2:
        return 'Outdoor Plant';
      case 3:
        return 'Office Plant';
      default:
        return 'Other';
    }
  }

  Color getPlantTypeColor(int plantType) {
    switch (plantType) {
      case 1:
        return Colors.orange; // Indoor plants
      case 2:
        return Colors.green; // Outdoor plants
      case 3:
        return Colors.purple; // Office plants
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.38,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2.0,
              blurRadius: 4.0,
            ),
          ],
          color: Colors.brown[50],
        ),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Stack(
              children: [
                // Image
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      image: plantimg,
                      fit: BoxFit.contain,
                      height: 150.0,
                      width: 150.0,
                    ),
                  ),
                ),
                // Plant type badge with colored circle
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 4.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(4.0),
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            //Coloured Dot
                            Container(
                              width: 12.0,
                              height: 12.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: getPlantTypeColor(plantType),
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              getPlantTypeName(plantType),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Plant name
            Text(
              plantName,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

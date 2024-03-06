import 'package:flutter/material.dart';
import 'package:plant_pulse/components/plant_card.dart';

class MyPlantsScreen extends StatefulWidget {
  const MyPlantsScreen({super.key});

  @override
  State<MyPlantsScreen> createState() => _MyPlantsScreenState();
}

class _MyPlantsScreenState extends State<MyPlantsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlantCard(
                  plantName: 'Monstera',
                  plantimg: AssetImage('assets/images/sample_plant.png'),
                  plantType: 1),
              PlantCard(
                  plantName: 'Hibiscus',
                  plantimg: AssetImage('assets/images/sample_plant.png'),
                  plantType: 2),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlantCard(
                  plantName: 'Monstera',
                  plantimg: AssetImage('assets/images/sample_plant.png'),
                  plantType: 3),
              PlantCard(
                  plantName: 'Hibiscus',
                  plantimg: AssetImage('assets/images/sample_plant.png'),
                  plantType: 4),
            ],
          ),
        ],
      ),
    );
  }
}

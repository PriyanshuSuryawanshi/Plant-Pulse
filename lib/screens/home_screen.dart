import 'package:flutter/material.dart';
import 'package:plant_pulse/components/plant_category_card.dart';
import 'package:plant_pulse/screens/home_subscreens/indoor_screen.dart';
import 'package:plant_pulse/screens/home_subscreens/myplants_screen.dart';
import 'package:plant_pulse/screens/home_subscreens/office_screen.dart';
import 'package:plant_pulse/screens/home_subscreens/other_screen.dart';
import 'package:plant_pulse/screens/home_subscreens/outdoor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> subscreens = [
    MyPlantsScreen(),
    IndoorScreen(),
    OutdoorScreen(),
    OfficeScreen(),
    OtherScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Text 'Let’s Find Your Plants!',
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Let’s Find Your Plants!',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24.0,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // SearchBar
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Find your plant',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.qr_code_scanner),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              // Text 'Plant Category'
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Plant Category',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              // Plant Category Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  plant_category_card(
                      Icons.food_bank_sharp, "Outdoor", Colors.green),
                  plant_category_card(Icons.home, "Indoor", Colors.orange),
                  plant_category_card(Icons.house, "Office", Colors.purple),
                  plant_category_card(Icons.drive_file_rename_outline_sharp,
                      "Other", Colors.blue),
                ],
              ),
              // 5 horizontal clickable texts

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      child: Text("My Plants"),
                      onPressed: () {
                        index = 0;
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      child: Text("Indoor"),
                      onPressed: () {
                        index = 1;
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      child: Text("Outdoor"),
                      onPressed: () {
                        index = 2;
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      child: Text("Office"),
                      onPressed: () {
                        index = 3;
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      child: Text("Other"),
                      onPressed: () {
                        index = 4;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Container(
                child: subscreens[index],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

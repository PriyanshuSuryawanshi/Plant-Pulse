import 'package:flutter/material.dart';
import 'package:plant_pulse/screens/health_screen.dart';
import 'package:plant_pulse/screens/home_screen.dart';
import 'package:plant_pulse/screens/profile_screen.dart';
import 'package:plant_pulse/screens/routine_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selected_screen_index = 0;
  PageController pagecontroller = PageController();

  void onTapped(int index) {
    setState(() {
      selected_screen_index = index;
    });
    pagecontroller.jumpToPage(selected_screen_index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Plant Pulse'),
      ),
      body: PageView(
        controller: pagecontroller,
        children: [
          HomeScreen(),
          RoutineScreen(),
          HealthScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.timer_outlined), label: 'Routine'),
          BottomNavigationBarItem(
              icon: Icon(Icons.medication_rounded), label: 'Health'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: selected_screen_index,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}

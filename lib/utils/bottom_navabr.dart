import 'package:flutter/material.dart';
import 'package:plant_pulse/database/firebase_database.dart';
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
  int selectedScreenIndex = 0;
  PageController pagecontroller = PageController();
  final database = FirebaseDatabase();

  @override
  void initState() {
    super.initState();
    database.fetchAndPrintPlantData();
  }

  void onTapped(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
    pagecontroller.jumpToPage(selectedScreenIndex);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Always prevent back
      child: Scaffold(
        body: PageView(
          controller: pagecontroller,
          children: const [
            HomeScreen(),
            RoutineScreen(),
            HealthScreen(),
            ProfileScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.0), // Increased icon size
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:
                  Icon(Icons.timer_outlined, size: 30.0), // Increased icon size
              label: 'Routine',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.medication_rounded,
                  size: 30.0), // Increased icon size
              label: 'Health',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30.0), // Increased icon size
              label: 'Profile',
            ),
          ],
          showSelectedLabels: false,
          currentIndex: selectedScreenIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: onTapped,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gym_flair/screens/cours/cours_screen.dart';
import 'package:gym_flair/screens/equipments/equipments_screen.dart';
import 'package:gym_flair/screens/home/home_screen.dart';
import 'package:gym_flair/screens/settings/settings_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int activeIndex = 0;
  void changeActivePage(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      const HomeScreen(),
      const EquipmentScreen(),
      const CoursesScreen(),
      const SettingsScreen()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.surfaceVariant,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () => changeActivePage(0), icon: const Icon(Icons.home)),
              IconButton(onPressed: () => changeActivePage(1), icon: const Icon(Icons.shopping_cart)),
              IconButton(onPressed: () => changeActivePage(2), icon: const Icon(Icons.fitness_center)),
              IconButton(onPressed: () => changeActivePage(3), icon: const Icon(Icons.settings)),
            ],
          ),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: pages[activeIndex],
        )
    );
  }
}

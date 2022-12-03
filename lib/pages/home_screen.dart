import 'package:attendance_app/pages/attendance_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _navigateBottomNavbar(int selectedIndex) {
    setState(
      () {
        _currentIndex = selectedIndex;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            const AttendanceScreen(),
           
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: const Color.fromARGB(255, 89, 12, 38),
          animationDuration: const Duration(microseconds: 600),
          onTap: _navigateBottomNavbar,
          index: _currentIndex,
          height: 60,
          items: const [
            Icon(
              Icons.check,
              color: Colors.white,
              size: 38,
            ),
            Icon(
              Icons.history,
              color: Colors.white,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}

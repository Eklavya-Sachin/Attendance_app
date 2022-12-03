import 'package:flutter/material.dart';

class AttendanceHistory extends StatelessWidget {
  const AttendanceHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: const [
            Text("Attendance History")
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentattendance/view/ui/attendance/attendancescreen.dart';
import 'package:studentattendance/view/viewmodel/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AttendanceController());

    return GetMaterialApp(
      title: 'Attendace App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AttendanceScreen(),
    );
  }
}

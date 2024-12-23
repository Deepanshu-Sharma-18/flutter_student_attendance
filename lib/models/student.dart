import 'package:studentattendance/models/attendance.dart';

class Student {
  final String name;
  Attendance status;
  String time;

  Student({required this.name, required this.status, required this.time});
}

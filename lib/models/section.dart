import 'package:studentattendance/models/Student.dart';

class Section {
  final String title;
  final List<Student> students;

  Section({required this.title, required this.students});
}

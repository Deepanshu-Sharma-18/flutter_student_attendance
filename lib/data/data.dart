import 'package:studentattendance/models/attendance.dart';
import 'package:studentattendance/models/Student.dart';
import 'package:studentattendance/models/classes.dart';
import 'package:studentattendance/models/section.dart';

List<Class> dummyData = [
  Class(className: "10", sections: [
    Section(title: "A", students: [
      Student(name: "John", status: Attendance.PRESENT, time: "10:00"),
      Student(name: "Ray", status: Attendance.NONE, time: "10:00"),
      Student(name: "Neon", status: Attendance.NONE, time: "10:00"),
      Student(name: "Reyan", status: Attendance.NONE, time: "10:00"),
    ]),
    Section(title: "B", students: [
      Student(name: "Alice", status: Attendance.NONE, time: "10:00"),
      Student(name: "Bob", status: Attendance.NONE, time: "10:00"),
      Student(name: "Charlie", status: Attendance.NONE, time: "10:00"),
      Student(name: "David", status: Attendance.NONE, time: "10:00"),
    ]),
  ]),
  Class(className: "9", sections: [
    Section(title: "A", students: [
      Student(name: "Emily", status: Attendance.NONE, time: "10:00"),
      Student(name: "Frank", status: Attendance.NONE, time: "10:00"),
      Student(name: "Grace", status: Attendance.NONE, time: "10:00"),
      Student(name: "Helen", status: Attendance.NONE, time: "10:00"),
    ]),
    Section(title: "B", students: [
      Student(name: "Isaac", status: Attendance.NONE, time: "10:00"),
      Student(name: "Jack", status: Attendance.NONE, time: "10:00"),
      Student(name: "Kathy", status: Attendance.NONE, time: "10:00"),
      Student(name: "Leo", status: Attendance.NONE, time: "10:00"),
    ]),
  ]),
  Class(className: "8", sections: [
    Section(title: "A", students: [
      Student(name: "Mona", status: Attendance.NONE, time: "10:00"),
      Student(name: "Nina", status: Attendance.NONE, time: "10:00"),
      Student(name: "Oliver", status: Attendance.NONE, time: "10:00"),
      Student(name: "Paul", status: Attendance.NONE, time: "10:00"),
    ]),
    Section(title: "B", students: [
      Student(name: "Quincy", status: Attendance.NONE, time: "10:00"),
      Student(name: "Rachel", status: Attendance.NONE, time: "10:00"),
      Student(name: "Sam", status: Attendance.NONE, time: "10:00"),
      Student(name: "Tina", status: Attendance.NONE, time: "10:00"),
    ]),
  ]),
  Class(className: "7", sections: [
    Section(title: "A", students: [
      Student(name: "Umar", status: Attendance.NONE, time: "10:00"),
      Student(name: "Vera", status: Attendance.NONE, time: "10:00"),
      Student(name: "Will", status: Attendance.NONE, time: "10:00"),
      Student(name: "Xander", status: Attendance.NONE, time: "10:00"),
    ]),
    Section(title: "B", students: [
      Student(name: "Yara", status: Attendance.NONE, time: "10:00"),
      Student(name: "Zane", status: Attendance.NONE, time: "10:00"),
      Student(name: "Alice", status: Attendance.NONE, time: "10:00"),
      Student(name: "Ben", status: Attendance.NONE, time: "10:00"),
    ]),
  ]),
];

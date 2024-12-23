import 'package:studentattendance/models/section.dart';

class Class {
  final String className;
  final List<Section> sections;

  Class({required this.className, required this.sections});
}

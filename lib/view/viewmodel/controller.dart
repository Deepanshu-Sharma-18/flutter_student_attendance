import 'package:get/get.dart';
import 'package:studentattendance/data/data.dart';
import 'package:studentattendance/models/Student.dart';
import 'package:studentattendance/models/attendance.dart';
import 'package:studentattendance/models/section.dart';

class AttendanceController extends GetxController {
  final RxList data = [].obs;

  RxString currentClass = "".obs;
  RxString currentSection = "".obs;

  RxInt classIndex = 0.obs;
  RxInt sectionIndex = 0.obs;

  List<Section> get sections {
    var classModel = data.firstWhere((c) => c.className == currentClass.value);
    return classModel.sections;
  }

  List<Student> get students {
    var sectionModel =
        sections.firstWhere((s) => s.title == currentSection.value);
    return sectionModel.students;
  }

  @override
  void onInit() {
    super.onInit();
    fetchAttendances();
    currentClass.value = data[0].className;
    currentSection.value = data[0].sections[0].title;
  }

  void fetchAttendances() {
    final dummy = dummyData;
    data.value = dummy;
  }

  void updateStatus(String className, String title, String name,
      Attendance status, String time) {
    final index = data.indexWhere((it) => it.className == className);
    final sectionIndex =
        data[index].sections.indexWhere((it) => it.title == title);
    final studentIndex = data[index]
        .sections[sectionIndex]
        .students
        .indexWhere((it) => it.name == name);

    data[index].sections[sectionIndex].students[studentIndex].status = status;
    data[index].sections[sectionIndex].students[studentIndex].time = time;

    data.refresh();
  }
}

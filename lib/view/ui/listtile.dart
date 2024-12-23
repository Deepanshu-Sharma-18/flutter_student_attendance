import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:studentattendance/view/viewmodel/controller.dart';
import '../../models/attendance.dart';

class customListTile extends StatefulWidget {
  final int classIndex;
  final int sectionIndex;
  final int studentIndex;

  customListTile({
    super.key,
    required this.classIndex,
    required this.sectionIndex,
    required this.studentIndex,
  });

  @override
  State<customListTile> createState() => _customListTileState();
}

class _customListTileState extends State<customListTile> {
  final controller = Get.find<AttendanceController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              child: Text(
                overflow: TextOverflow.ellipsis,
                controller.data[widget.classIndex].sections[widget.sectionIndex]
                    .students[widget.studentIndex].name
                    .toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Select Status",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.updateStatus(
                                    controller.currentClass.value,
                                    controller.currentSection.value,
                                    controller
                                        .data[widget.classIndex]
                                        .sections[widget.sectionIndex]
                                        .students[widget.studentIndex]
                                        .name,
                                    Attendance.PRESENT,
                                    controller
                                        .data[widget.classIndex]
                                        .sections[widget.sectionIndex]
                                        .students[widget.studentIndex]
                                        .time);
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Present",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 0.1,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.updateStatus(
                                    controller.currentClass.value,
                                    controller.currentSection.value,
                                    controller
                                        .data[widget.classIndex]
                                        .sections[widget.sectionIndex]
                                        .students[widget.studentIndex]
                                        .name,
                                    Attendance.ABSENT,
                                    controller
                                        .data[widget.classIndex]
                                        .sections[widget.sectionIndex]
                                        .students[widget.studentIndex]
                                        .time);
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Absent",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: controller
                              .data[widget.classIndex]
                              .sections[widget.sectionIndex]
                              .students[widget.studentIndex]
                              .status ==
                          Attendance.PRESENT
                      ? Colors.green
                      : controller
                                  .data[widget.classIndex]
                                  .sections[widget.sectionIndex]
                                  .students[widget.studentIndex]
                                  .status ==
                              Attendance.ABSENT
                          ? Colors.red
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                width: 100,
                height: 40,
                alignment: Alignment.center,
                child: Text(
                  controller
                              .data[widget.classIndex]
                              .sections[widget.sectionIndex]
                              .students[widget.studentIndex]
                              .status ==
                          Attendance.PRESENT
                      ? "Present"
                      : controller
                                  .data[widget.classIndex]
                                  .sections[widget.sectionIndex]
                                  .students[widget.studentIndex]
                                  .status ==
                              Attendance.ABSENT
                          ? "Absent"
                          : "None",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                final time = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (time != null) {
                  controller.updateStatus(
                      controller.currentClass.value,
                      controller.currentSection.value,
                      controller
                          .data[widget.classIndex]
                          .sections[widget.sectionIndex]
                          .students[widget.studentIndex]
                          .name,
                      controller
                          .data[widget.classIndex]
                          .sections[widget.sectionIndex]
                          .students[widget.studentIndex]
                          .status,
                      time.format(context));
                }
              },
              child: Container(
                width: 60,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 196, 195, 195)),
                child: Text(
                  controller
                      .data[widget.classIndex]
                      .sections[widget.sectionIndex]
                      .students[widget.studentIndex]
                      .time
                      .toString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentattendance/view/ui/listtile.dart';
import 'package:studentattendance/view/viewmodel/controller.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AttendanceController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 224, 224, 224),
        appBar: PreferredSize(
          preferredSize: Size(double.maxFinite, 100),
          child: Container(
            height: 50,
            width: double.maxFinite,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              "Student Attendance",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: controller.data.isEmpty
            ? Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Obx(
                  () => Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Class",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          DropdownButton(
                              value: controller.currentClass.value,
                              items: controller.data
                                  .map<DropdownMenuItem<String>>((element) {
                                return DropdownMenuItem(
                                    value: element.className,
                                    child: Text(element.className));
                              }).toList(),
                              onChanged: (it) {
                                controller.currentClass.value = it.toString();
                                final index = controller.data.indexWhere(
                                    (element) => element.className == it);
                                controller.currentSection.value =
                                    controller.data[index].sections[0].title;

                                controller.classIndex.value = index;
                              }),
                          Text(
                            "Section",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          DropdownButton<String>(
                              value: controller.currentSection.value,
                              items: controller
                                  .data[controller.classIndex.value].sections
                                  .map<DropdownMenuItem<String>>((element) {
                                return DropdownMenuItem<String>(
                                    value: element.title,
                                    child: Text(element.title));
                              }).toList(),
                              onChanged: (it) {
                                controller.currentSection.value = it.toString();
                                controller.sectionIndex.value = controller
                                    .data[controller.classIndex.value].sections
                                    .indexWhere(
                                        (element) => element.title == it);
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.maxFinite,
                        alignment: Alignment.center,
                        child: Text(
                          DateTime.now().toString().substring(0, 10),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 50,
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: 100,
                              child: Text(
                                "Name",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 100,
                              child: Text(
                                "Status",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 60,
                              child: Text(
                                "Time",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (content, index) {
                            return customListTile(
                              classIndex: controller.classIndex.value,
                              sectionIndex: controller.sectionIndex.value,
                              studentIndex: index,
                            );
                          },
                          itemCount: controller.students.length,
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

import 'dart:io';
import 'package:e7sebly/core/util/sizeConfig.dart';
import 'package:e7sebly/features/gpa/presentation/view/add_course_screen.dart';
import 'package:e7sebly/features/gpa/presentation/view/empty_state_gpa_screen.dart';
import 'package:flutter/material.dart';
import 'package:e7sebly/core/util/constants.dart';
import 'package:e7sebly/features/gpa/data/course_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'widgets/course_list_item.dart';
import 'widgets/gpa_circular_percent_indicator.dart';

class GPA extends StatefulWidget {
  const GPA({super.key});

  @override
  _GPAState createState() => _GPAState();
}

class _GPAState extends State<GPA> {
  final ScreenshotController _screenshotController = ScreenshotController();

  double calculateGPA() {
    double totalPoints = 0;
    int totalCreditHours = 0;

    AppConstants.courses.forEach((subject) {
      double gradePoint = _gradeToPoints(subject.grade);
      totalPoints += gradePoint * subject.creditHours;
      totalCreditHours += subject.creditHours;
    });

    return totalPoints / totalCreditHours;
  }

  double _gradeToPoints(String grade) {
    switch (grade) {
      case 'A+':
        return 4.0;
      case 'A':
        return 3.7;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.7;
      case 'C':
        return 2.3;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double w = SizeConfig.screenW!;
    return Scaffold(
      backgroundColor: const Color(0XFF1D6BDD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            AppConstants.courses.clear();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: (w <= 550) ? 25 : 30,
          ),
        ),
        title: Text(
          "المعدل التراكمي",
          style: TextStyle(
            fontFamily: "mess_bold",
            color: Colors.white,
            fontSize: (w <= 550) ? 25 : 30,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.share,
                color: Colors.white, size: (w <= 550) ? 25 : 30),
            onPressed: _takeScreenshotAndShare,
          ),
        ],
      ),
      body: Screenshot(
        controller: _screenshotController,
        child: Container(
          color: const Color(0XFF1D6BDD), // Set the background color here
          child: Stack(
            children: [
              AppConstants.courses.isEmpty
                  ? const EmptyStateGPAScreen()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          GpaCircularPercentIndicator(
                            gpa: calculateGPA(),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemCount: AppConstants.courses.length,
                              itemBuilder: (context, index) {
                                return CourseListItem(
                                  name: AppConstants.courses[index].name,
                                  grade: AppConstants.courses[index].grade,
                                  onDelete: () {
                                    setState(() {
                                      AppConstants.courses.removeAt(index);
                                    });
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildFooter(w),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () async {
          final result = await showModalBottomSheet<Course>(
            context: context,
            isScrollControlled: true,
            builder: (context) => AddSubjectBottomSheet(),
          );
          if (result != null) {
            setState(() {
              AppConstants.courses.add(result);
            });
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _takeScreenshotAndShare() async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = await _screenshotController.captureAndSave(directory.path,
        fileName: 'gpa_screenshot.png');
    if (imagePath != null) {
      final file = File(imagePath);
      Share.shareXFiles([XFile(file.path)], text: 'Check out my GPA!');
    }
  }

  Widget _buildFooter(double w) {
    return Column(
      children: [
        Image.asset(
          'assets/img/logos/icon.png',
          width: w * 0.1,
          color: Colors.white,
        ),
        const SizedBox(height: 10,),
        Text(
          "Generated by e7sebly",
          style: TextStyle(
            fontFamily: "mont_bold",
            color: Colors.white,
            fontSize: w * 0.03,
          ),
        ),
      ],
    );
  }
}

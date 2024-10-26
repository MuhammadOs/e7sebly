import 'package:e7sebly/core/util/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e7sebly/core/util/constants.dart';
import 'package:e7sebly/features/gpa/data/course_model.dart';

class AddSubjectBottomSheet extends StatefulWidget {
  @override
  _AddSubjectBottomSheetState createState() => _AddSubjectBottomSheetState();
}

class _AddSubjectBottomSheetState extends State<AddSubjectBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  String subjectName = '';
  String grade = 'A+';
  int creditHours = 7;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double w = SizeConfig.screenW!;

    return SingleChildScrollView(
      // Adjust the padding dynamically to prevent overflow when keyboard opens
      padding: EdgeInsets.only(
        bottom: MediaQuery
            .of(context)
            .viewInsets
            .bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFF1D6BDD).withOpacity(0.9),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'اسم المادة',
                  style: TextStyle(
                    fontFamily: "mess_bold",
                    color: Colors.white,
                    fontSize: (w <= 550) ? 22 : 28,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 8),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      fillColor: const Color(0XFF1D6BDD),
                      filled: true,
                      labelStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: "mess_regular",
                      ),
                      floatingLabelStyle: const TextStyle(
                        color: Colors.white,
                        fontFamily: "mess_regular",
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      alignLabelWithHint: true,
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "mess_regular",
                    ),
                    onChanged: (value) {
                      setState(() {
                        subjectName = value;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter subject name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ['A+', 'A', 'B+', 'B', 'C+', 'C', 'D+', 'D']
                        .map((label) =>
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: ChoiceChip(
                            label: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 4),
                              child: Text(
                                label,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "mont_bold",
                                ),
                              ),
                            ),
                            selected: grade == label,
                            onSelected: (selected) {
                              setState(() {
                                grade = label;
                              });
                            },
                            backgroundColor: const Color(0XFF1D6BDD),
                            selectedColor: Colors.orange,
                            showCheckmark: false,
                          ),
                        ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0XFF1D6BDD),
                      borderRadius: BorderRadius.circular(25)),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'الساعات المعتمدة',
                        style: TextStyle(
                          fontFamily: "mess_bold",
                          color: Colors.white,
                          fontSize: (w <= 550) ? 22 : 28,
                        ),
                      ),
                      Text(
                        creditHours.toString(),
                        style: TextStyle(
                          fontFamily: "mess_bold",
                          color: Colors.white,
                          fontSize: (w <= 550) ? 30 : 35,
                        ),
                      ),
                      Slider(
                        activeColor: Colors.orange,
                        inactiveColor: Colors.blue,
                        value: creditHours.toDouble(),
                        min: 1,
                        max: 7,
                        divisions: 6,
                        label: creditHours.toString(),
                        onChanged: (value) {
                          setState(() {
                            creditHours = value.toInt();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                FloatingActionButton(
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, Course(
                        name: subjectName,
                        grade: grade,
                        creditHours: creditHours,
                      ));
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class PsychologySupportQuestion extends StatefulWidget {
  const PsychologySupportQuestion({super.key});

  @override
  State<PsychologySupportQuestion> createState() =>
      _PsychologySupportQuestionState();
}

class _PsychologySupportQuestionState extends State<PsychologySupportQuestion> {
  String birthday = "Select Date";
  int currentIndex = 0;
  int isGender = 3;
  int isNurseGender = 3;
  int nurseQualification = 5;
  int activity = 4;
  String height = "0.0";
  double bmi = 0.0;
  List<String> tags = [];
  List<String> medicalHistory = [
    "Diabetes",
    "Hypertension",
    "Heart Disease",
    "Kidney Disease",
    "Liver Disease",
    "Thyroid",
    "Cancer",
    "Asthma",
    "Allergies",
    "None"
  ];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                  isGender = 4;
                  nurseQualification = 4;
                  activity = 4;
                  birthday = "Select Date";
                });
              },
              child: "Reset".text.white.make()),
        ],
        backgroundColor: themeColor,
        title: const Text(
          'Psychology Questions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // bottomSheet: SizedBox(
      //   height: 70,
      //   child: MessageBar(
      //     onSend: (_) => print(_),
      //   ),
      // ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Please help us with few details to get best possible Physiotherapy support"
                  .text
                  .semiBold
                  .make(),
              if (currentIndex >= 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BubbleSpecialThree(
                      text: 'Please mentioned patient name?',
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 98.0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            canvasColor: Colors.grey[200],
                            primaryColor: const Color(0xff0D0940)),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter your name',
                            filled: true,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey[200],
                          ),
                          onFieldSubmitted: (value) {
                            setState(() {
                              currentIndex = 1;
                            });
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          },
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          //    onSaved: (value) => age = int.parse(value!),
                        ),
                      ),
                    ),
                  ],
                ),
              if (currentIndex >= 1)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const BubbleSpecialThree(
                      text: 'Select your patient gender',
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        "Male"
                            .text
                            .bold
                            .xl
                            .color(isGender == 0 ? themeColor : Colors.black38)
                            .makeCentered()
                            .box
                            .width(130)
                            .height(35)
                            .withRounded(value: 8)
                            .border(
                              color: isGender == 0
                                  ? themeColor
                                  : Colors.grey[300]!,
                              width: 1,
                            )
                            .make()
                            .pOnly(
                              left: 20,
                            )
                            .onTap(() {
                          setState(() {
                            isGender = 0;
                            currentIndex = 2;
                          });
                        }),
                        "Female"
                            .text
                            .bold
                            .xl
                            .color(isGender == 1 ? themeColor : Colors.black38)
                            .makeCentered()
                            .box
                            .width(130)
                            .height(35)
                            .withRounded(value: 8)
                            .border(
                              color: isGender == 1
                                  ? themeColor
                                  : Colors.grey[300]!,
                              width: 1,
                            )
                            .make()
                            .pOnly(
                              left: 20,
                            )
                            .onTap(() {
                          setState(() {
                            isGender = 1;
                            currentIndex = 2;
                          });
                        }),
                      ],
                    ),
                    10.heightBox,
                    "Other"
                        .text
                        .bold
                        .xl
                        .color(isGender == 2 ? themeColor : Colors.black38)
                        .makeCentered()
                        .box
                        .width(130)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: isGender == 2 ? themeColor : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        isGender = 2;
                        currentIndex = 2;
                      });
                    }),
                  ],
                ),
              if (currentIndex >= 2)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const BubbleSpecialThree(
                      text: 'Select patient date of birth',
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 78.0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            canvasColor: Colors.grey[200],
                            primaryColor: const Color(0xff0D0940)),
                        child: TextFormField(
                          controller: TextEditingController(
                            text: birthday,
                          ),
                          readOnly: true,
                          onTap: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      /// use `colorScheme: ` for more
                                      // date picker dialogBackground color in simple case
                                      dialogBackgroundColor: Colors.white,
                                      timePickerTheme:
                                          TimePickerTheme.of(context).copyWith(
                                        //background color of time picker
                                        backgroundColor: Colors.lightBlueAccent,
                                      ),
                                    ),
                                    child: child!,
                                  );
                                }).then((value) {
                              setState(() {
                                birthday =
                                    "${value!.day}/${value.month}/${value.year} (${DateTime.now().year - value.year} years old)";
                                currentIndex = 3;
                              });
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Select Date',
                            filled: true,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            fillColor: Colors.grey[200],
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                          //    onSaved: (value) => age = int.parse(value!),
                        ),
                      ),
                    ),
                  ],
                ),
              if (currentIndex >= 3)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const BubbleSpecialThree(
                      text: "Your requirement for physiotherapy?",
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    "Cardiac physiotherapy"
                        .text
                        .bold
                        .xl
                        .color(nurseQualification == 0
                            ? themeColor
                            : Colors.black38)
                        .makeCentered()
                        .box
                        .width(210)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: nurseQualification == 0
                              ? themeColor
                              : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        nurseQualification = 0;
                        currentIndex = 4;
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    }),
                    10.heightBox,
                    "Neuro Physiotherapy"
                        .text
                        .bold
                        .xl
                        .color(nurseQualification == 1
                            ? themeColor
                            : Colors.black38)
                        .makeCentered()
                        .box
                        .width(210)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: nurseQualification == 1
                              ? themeColor
                              : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        nurseQualification = 1;
                        currentIndex = 4;
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    }),
                    10.heightBox,
                    "Ortho Physiotherapy"
                        .text
                        .bold
                        .xl
                        .color(nurseQualification == 2
                            ? themeColor
                            : Colors.black38)
                        .makeCentered()
                        .box
                        .width(210)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: nurseQualification == 2
                              ? themeColor
                              : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        nurseQualification = 2;
                        currentIndex = 4;
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    }),
                    10.heightBox,
                    "Others"
                        .text
                        .bold
                        .xl
                        .color(nurseQualification == 3
                            ? themeColor
                            : Colors.black38)
                        .makeCentered()
                        .box
                        .width(210)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: nurseQualification == 3
                              ? themeColor
                              : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        nurseQualification = 3;
                        currentIndex = 4;
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    }),
                  ],
                ),
              if (currentIndex >= 4)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const BubbleSpecialThree(
                      text: 'Session required in a day?',
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    "Once a day "
                        .text
                        .bold
                        .xl
                        .color(isNurseGender == 0 ? themeColor : Colors.black38)
                        .makeCentered()
                        .box
                        .width(180)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: isNurseGender == 0
                              ? themeColor
                              : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        isNurseGender = 0;
                        currentIndex = 5;
                      });
                    }),
                    10.heightBox,
                    "Twice a day"
                        .text
                        .bold
                        .xl
                        .color(isNurseGender == 1 ? themeColor : Colors.black38)
                        .makeCentered()
                        .box
                        .width(180)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: isNurseGender == 1
                              ? themeColor
                              : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        isNurseGender = 1;
                        currentIndex = 5;
                      });
                    }),
                    10.heightBox,
                    "Three times a day"
                        .text
                        .bold
                        .xl
                        .color(isNurseGender == 2 ? themeColor : Colors.black38)
                        .makeCentered()
                        .box
                        .width(180)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: isNurseGender == 2
                              ? themeColor
                              : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        isNurseGender = 2;
                        currentIndex = 5;
                      });
                    }),
                  ],
                ),
              if (currentIndex >= 5)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          Get.dialog(
                            WillPopScope(
                              onWillPop: () async {
                                Get.back();
                                Get.back();
                                Get.back();
                                Get.back();

                                return false;
                              },
                              child: Theme(
                                data: ThemeData.light(),
                                child: AlertDialog(
                                  title: const Text("Thank you!"),
                                  content: const Text(
                                      "Thank you for the detail. Our customer executive would reach out to you on +9199999999 within 30 min of working hour to assist you."),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Get.back();
                                          Get.back();
                                          Get.back();
                                          Get.back();
                                        },
                                        child: const Text("Okay")),
                                  ],
                                ),
                              ),
                            ),
                            barrierDismissible: false,
                            barrierColor: Colors.black.withOpacity(0.8),
                          );
                        },
                        child: const Text("Submit"))
                  ],
                ),
              100.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

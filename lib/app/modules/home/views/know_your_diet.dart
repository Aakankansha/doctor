import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:clear_vikalp_app/app/modules/home/views/near_by_homehealth_question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class KnowYourDiet extends StatefulWidget {
  const KnowYourDiet({super.key});

  @override
  State<KnowYourDiet> createState() => _KnowYourDietState();
}

class _KnowYourDietState extends State<KnowYourDiet> {
  String birthday = "Select Date";
  int currentIndex = 4;
  int isGender = 4;
  int meal = 4;
  bool isSelf = true;
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
                  currentIndex = 4;
                  isSelf = true;
                  isGender = 4;
                  meal = 4;
                  activity = 4;
                  birthday = "Select Date";
                });
              },
              child: "Reset".text.white.make()),
        ],
        backgroundColor: themeColor,
        title: const Text(
          'Know Your Diet',
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
              5.heightBox,
              "Let's know you better".text.bold.xl.make(),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              10.heightBox,
              const BubbleSpecialThree(
                text: 'Who Need Diet Plan?',
                color: themeColor,
                tail: true,
                isSender: false,
                textStyle: TextStyle(color: Colors.white, fontSize: 16),
              ),
              10.heightBox,
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSelf = true;
                    currentIndex = 4;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelf ? themeColor : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: "Myself".text.white.make(),
              ).paddingSymmetric(
                horizontal: 20,
              ),
              10.heightBox,
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isSelf = false;
                    currentIndex = 0;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isSelf ? themeColor : Colors.grey,
                  minimumSize: const Size(double.infinity, 50),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: "Family Member".text.white.make(),
              ).paddingSymmetric(
                horizontal: 20,
              ),
              10.heightBox,
              if (!isSelf)
                Column(
                  children: [
                    if (currentIndex >= 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const BubbleSpecialThree(
                            text: 'Please mentioned patient name?',
                            color: themeColor,
                            tail: true,
                            isSender: false,
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 16),
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
                  ],
                ),
              if (!isSelf)
                if (currentIndex >= 1)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.heightBox,
                      const BubbleSpecialThree(
                        text: 'Select your gender',
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
                              .color(
                                  isGender == 0 ? themeColor : Colors.black38)
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
                              .color(
                                  isGender == 1 ? themeColor : Colors.black38)
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
                      15.heightBox,
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
                            color:
                                isGender == 2 ? themeColor : Colors.grey[300]!,
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
              if (!isSelf)
                if (currentIndex >= 2)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.heightBox,
                      const BubbleSpecialThree(
                        text: 'Select your date of birth',
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
                                            TimePickerTheme.of(context)
                                                .copyWith(
                                          //background color of time picker
                                          backgroundColor:
                                              Colors.lightBlueAccent,
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
                                _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                );
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
                      text: 'What is your height?',
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 98.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter your height in cm",
                          filled: true,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          fillColor: Colors.grey[200],
                        ),
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {
                          height = value;
                          setState(() {
                            currentIndex = 4;
                          });
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              if (currentIndex >= 4)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const BubbleSpecialThree(
                      text: 'What is your Weight?',
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 98.0),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Enter your weight in kg",
                          filled: true,
                          fillColor: Colors.grey[200],
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide.none),
                        ),
                        onFieldSubmitted: (value) {
                          bmi = 0.0;
                          setState(() {
                            currentIndex = 5;
                            print(value);
                            print(bmi);
                            bmi = double.parse(value) /
                                (double.parse(height) *
                                    double.parse(height) /
                                    10000);
                            print(bmi);
                          });
                          _scrollController.animateTo(
                            _scrollController.position.maxScrollExtent,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              if (currentIndex >= 5)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: BubbleSpecialThree(
                    text: "your bmi is ${bmi.toStringAsFixed(2)}",
                    color: themeColor2,
                    tail: true,
                    isSender: false,
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              if (currentIndex >= 5)
                Column(
                  children: [
                    if (bmi < 18.5)
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: BubbleSpecialThree(
                          text: "you are underweight",
                          color: themeColor2,
                          tail: true,
                          isSender: false,
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    if (bmi >= 18.5 && bmi < 25)
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: BubbleSpecialThree(
                          text: "you are normal",
                          color: themeColor2,
                          tail: true,
                          isSender: false,
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    if (bmi >= 25 && bmi < 30)
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: BubbleSpecialThree(
                          text: "you are overweight",
                          color: themeColor2,
                          tail: true,
                          isSender: false,
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                  ],
                ),
              if (currentIndex >= 5)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const BubbleSpecialThree(
                      text: "Do you have any Medical History?",
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    ChipsChoice<String>.multiple(
                      value: tags,
                      wrapped: true,
                      padding: const EdgeInsets.all(2),
                      onChanged: (val) {
                        if (val.isEmpty) {
                          setState(() {
                            currentIndex = 5;
                            tags = val;
                          });
                        } else {
                          setState(() {
                            currentIndex = 6;
                            tags = val;
                          });
                        }
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      choiceItems: C2Choice.listFrom<String, String>(
                        source: medicalHistory,
                        value: (i, v) => v,
                        label: (i, v) => v,
                        tooltip: (i, v) => v,
                      ),
                      choiceCheckmark: true,
                      choiceStyle: C2ChipStyle.outlined(
                        color: Colors.grey,
                        selectedStyle: const C2ChipStyle(
                            foregroundColor: themeColor,
                            checkmarkColor: themeColor,
                            borderColor: themeColor),
                      ),
                    ),
                  ],
                ),
              if (currentIndex >= 6)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const BubbleSpecialThree(
                      text: "Diet you prefer in your routine",
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        "Veg"
                            .text
                            .bold
                            .xl
                            .color(meal == 0 ? themeColor : Colors.black38)
                            .makeCentered()
                            .box
                            .width(130)
                            .height(35)
                            .withRounded(value: 8)
                            .border(
                              color: meal == 0 ? themeColor : Colors.grey[300]!,
                              width: 1,
                            )
                            .make()
                            .pOnly(
                              left: 20,
                            )
                            .onTap(() {
                          setState(() {
                            meal = 0;
                            currentIndex = 7;
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          });
                        }),
                        "Non-Veg"
                            .text
                            .bold
                            .xl
                            .color(meal == 1 ? themeColor : Colors.black38)
                            .makeCentered()
                            .box
                            .width(130)
                            .height(35)
                            .withRounded(value: 8)
                            .border(
                              color: meal == 1 ? themeColor : Colors.grey[300]!,
                              width: 1,
                            )
                            .make()
                            .pOnly(
                              left: 20,
                            )
                            .onTap(() {
                          setState(() {
                            meal = 1;
                            currentIndex = 7;
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          });
                        }),
                      ],
                    ),
                    10.heightBox,
                    "Both"
                        .text
                        .bold
                        .xl
                        .color(meal == 2 ? themeColor : Colors.black38)
                        .makeCentered()
                        .box
                        .width(130)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: meal == 2 ? themeColor : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        meal = 2;
                        currentIndex = 7;
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    }),
                  ],
                ),
              if (currentIndex >= 7)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    const BubbleSpecialThree(
                      text: "How active are you in your daily routine?",
                      color: themeColor,
                      tail: true,
                      isSender: false,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        "Daily"
                            .text
                            .bold
                            .xl
                            .color(activity == 0 ? themeColor : Colors.black38)
                            .makeCentered()
                            .box
                            .width(160)
                            .height(35)
                            .withRounded(value: 8)
                            .border(
                              color: activity == 0
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
                            activity = 0;
                            currentIndex = 8;
                            Get.to(() => const NearbyHomeHealthQuestions());
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          });
                        }),
                        "Non Frequently"
                            .text
                            .bold
                            .xl
                            .color(activity == 1 ? themeColor : Colors.black38)
                            .makeCentered()
                            .box
                            .width(160)
                            .height(35)
                            .withRounded(value: 8)
                            .border(
                              color: activity == 1
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
                            activity = 1;
                            currentIndex = 8;
                            Get.to(() => const NearbyHomeHealthQuestions());
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          });
                        }),
                      ],
                    ),
                    10.heightBox,
                    "Not at all"
                        .text
                        .bold
                        .xl
                        .color(activity == 2 ? themeColor : Colors.black38)
                        .makeCentered()
                        .box
                        .width(160)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: activity == 2 ? themeColor : Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        activity = 2;
                        currentIndex = 8;
                        Get.to(() => const NearbyHomeHealthQuestions());
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      });
                    }),
                    if (currentIndex >= 8) 20.heightBox,
                    if (currentIndex >= 8)
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Get.to(() => const NearbyHomeHealthQuestions());
                          },
                          child: const Text("Submit"))
                  ],
                ),
              40.h.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}

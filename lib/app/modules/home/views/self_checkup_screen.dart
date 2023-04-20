import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:clear_vikalp_app/app/modules/home/views/hospital_nearby_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class SelfCheckUpScreen extends StatefulWidget {
  const SelfCheckUpScreen({super.key});

  @override
  State<SelfCheckUpScreen> createState() => _SelfCheckUpScreenState();
}

class _SelfCheckUpScreenState extends State<SelfCheckUpScreen> {
  bool isSelf = true;
  List<String> tags = [];
  List<String> medicalHistory = [
    "Headache",
    "Fever",
    "Cough",
    "Cold",
    "Sore Throat",
    "Diarrhea",
  ];
  //Symptoms
  List<String> symptoms = [
    "Vomiting",
    "Stomach Pain",
    "Chest Pain",
    "Shortness of Breath",
    "Loss of Taste or Smell",
    "Loss of Appetite",
  ];
  String birthday = "Select Date";
  int currentIndex = 0;
  int isGender = 3;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: themeColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(
          'Self Check Up',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          if (currentIndex > 0)
            TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                    isGender = 4;
                    tags = [];

                    birthday = "Select Date";
                  });
                },
                child: "Reset".text.white.make()),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            10.heightBox,
            const BubbleSpecialThree(
              text: 'Who need self check today?',
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
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        10.heightBox,
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
                        10.heightBox,
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
                              color: isGender == 2
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
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 16),
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
                ],
              ),
            if (isSelf == true || currentIndex >= 3)
              Column(
                children: [
                  10.heightBox,
                  "Select  symptoms"
                      .text
                      .bold
                      .xl
                      .color(Colors.black)
                      .makeCentered()
                      .box
                      .width(300)
                      .height(35)
                      .withRounded(value: 8)
                      .border(
                        color: Colors.grey[300]!,
                        width: 1,
                      )
                      .make()
                      .pOnly(
                        left: 20,
                      )
                      .onTap(() {
                    setState(() {
                      currentIndex = 5;
                    });
                  }),
                  20.heightBox,
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Search for symptoms',
                      filled: true,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey[100],
                    ),
                  ).pSymmetric(
                    h: 20,
                  ),
                  20.heightBox,
                  ChipsChoice<String>.multiple(
                    value: tags,
                    wrapped: true,
                    padding: const EdgeInsets.all(2),
                    onChanged: (val) {
                      if (val.isEmpty) {
                        setState(() {
                          currentIndex = 4;
                          tags = val;
                        });
                      } else {
                        setState(() {
                          currentIndex = 5;
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
                  20.heightBox,
                  if (currentIndex >= 5)
                    "Please select any other symptoms"
                        .text
                        .bold
                        .xl
                        .color(Colors.black)
                        .makeCentered()
                        .box
                        .width(300)
                        .height(35)
                        .withRounded(value: 8)
                        .border(
                          color: Colors.grey[300]!,
                          width: 1,
                        )
                        .make()
                        .pOnly(
                          left: 20,
                        )
                        .onTap(() {
                      setState(() {
                        currentIndex = 5;
                      });
                    }),
                  20.heightBox,
                  if (currentIndex >= 5)
                    Column(
                      children: [
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
                            source: symptoms,
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
                  30.heightBox,
                  if (currentIndex >= 6)
                    Column(
                      children: [
                        "You May Have".text.bold.xl.make(),
                        ListTile(
                            title: "1.Migraine (90%)".text.make(),
                            trailing: "No More"
                                .text
                                .white
                                .make()
                                .pSymmetric(h: 10, v: 5)
                                .box
                                .withRounded(value: 6)
                                .color(themeColor)
                                .make()),
                        Divider(
                          color: Colors.grey[300]!,
                        ),
                        ListTile(
                            title: "2.Brain diseases (50%)".text.make(),
                            trailing: "No More"
                                .text
                                .white
                                .make()
                                .pSymmetric(h: 10, v: 5)
                                .box
                                .withRounded(value: 6)
                                .color(themeColor)
                                .make()),
                        const Divider(),
                      ],
                    ),
                  30.heightBox,
                  if (currentIndex >= 6)
                    ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: themeColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            onPressed: () {
                              Get.to(() => const HospitalNearbyScreen());
                            },
                            child: "Consult Now".text.white.make())
                        .pSymmetric(
                      h: 20,
                    )
                ],
              ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

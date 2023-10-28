import 'dart:developer';
import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:clear_vikalp_app/util/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class AddFamilyMemberScreen extends StatefulWidget {
  const AddFamilyMemberScreen({Key? key}) : super(key: key);

  @override
  State<AddFamilyMemberScreen> createState() => _AddFamilyMemberScreenState();
}

class _AddFamilyMemberScreenState extends State<AddFamilyMemberScreen> {
  bool isInsured = false;
  bool isMedical = false;
  String blood = "AB+";
  String insured = "Corporate";
  String diet = "Veg";
  List<String> tags = [];

  List<String> medicalHistory = [
    "Headache",
    "Fever",
    "Cough",
    "Cold",
    "Sore Throat",
    "Diarrhea",
  ];
  int currentIndex = 0;
  final formKey = GlobalKey<FormState>();
  var relation = "Mother";
  var gender = "Female";
  String medicalHistorySelected = "";
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final controller = Get.put(EditProfileController());
  final nameCOntroller = TextEditingController();
  final emailCOntroller = TextEditingController();
  final mobileController = TextEditingController();
  final dobController = TextEditingController();
  final areaController = TextEditingController();

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  File? profileImage;
  Future imagePicker(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 40,
        maxHeight: 150,
        maxWidth: 150,
      );
      if (image == null) return;
      final galleryImage = File(image.path);
      setState(() {
        profileImage = galleryImage;
        log(profileImage!.path);
      });
    } on PlatformException catch (e) {
      Get.snackbar(
        "Error",
        e.message!,
      );
    }
  }

  updateProfile() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}Home_health_care/family_member_save'));
    request.fields.addAll({
      'user_id': '10',
      'family_relation': relation,
      'family_mobile': mobileController.text,
      'name': nameCOntroller.text,
      'email': emailCOntroller.text,
      'gender': gender,
      'dob': dobController.text,
      'blood_group': blood,
      'food_type': diet,
      'height': heightController.text,
      'weight': weightController.text,
      'insured': isInsured.toString(),
      'insured_type': insured,
      'medical_history': isMedical.toString(),
      'medical_type': tags.toString(),
      'area': areaController.text,
    });
    request.files.add(
        await http.MultipartFile.fromPath('profile_image', profileImage!.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      Get.back();
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Add Family profile"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            profileImage != null
                ? Image.file(
                    profileImage!,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  )
                : CircleAvatar(
                    radius: 32,
                    backgroundColor: themeColor,
                    child: InkWell(
                      onTap: () async {
                        setState(() {
                          imagePicker(ImageSource.camera);
                        });
                      },
                      child: const Icon(
                        Icons.account_circle_rounded,
                        size: 32,
                        color: Vx.white,
                      ),
                    )).centered(),
            20.heightBox,
            "Upload profile".text.make().centered(),
            20.heightBox,
            "Personal information".text.gray500.make().marginOnly(left: 10),
            20.heightBox,
            buildField(
              title: "Name",
              hint: "Enter your name",
              controller: nameCOntroller,
            ),
            buildField(
              title: "Email id",
              hint: "Enter your email",
              controller: emailCOntroller,
            ),
            buildField(
              title: "Phone no",
              hint: "Enter your phone no",
              controller: mobileController,
            ),
            buildField(
              title: "Area",
              hint: "Enter your area",
              controller: areaController,
            ),
            10.heightBox,
            "Relation".text.black.make().marginOnly(left: 10),
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
              ),
              child: DropdownButton(
                      value: relation,
                      items: [
                        DropdownMenuItem(
                          value: "Father",
                          child: "Father".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Mother",
                          child: "Mother".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Brother",
                          child: "Brother".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Sister",
                          child: "Sister".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Son",
                          child: "Son".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Daughter",
                          child: "Daughter".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Grandfather",
                          child: "Grandfather".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Grandmother",
                          child: "Grandmother".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Uncle",
                          child: "Uncle".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Aunt",
                          child: "Aunt".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Cousin",
                          child: "Cousin".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Nephew",
                          child: "Nephew".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Niece",
                          child: "Niece".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Friend",
                          child: "Friend".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Other",
                          child: "Other".text.make(),
                        ),
                      ],
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {});
                        relation = value.toString();
                      })
                  .marginOnly(left: 10, right: 10)
                  .box
                  .withRounded(value: 8)
                  .border(
                    color: Colors.grey,
                    width: 1,
                  )
                  .make()
                  .marginOnly(left: 10, right: 10),
            ),
            10.heightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: buildField(
                    title: "Date of Birth",
                    hint: "DD/MM/YYYY",
                    controller: dobController,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    "Gender".text.black.make().marginOnly(left: 10, right: 10),
                    10.heightBox,
                    Theme(
                      data: ThemeData(
                        canvasColor: Colors.white,
                      ),
                      child: DropdownButton(
                              isDense: true,
                              value: gender,
                              items: [
                                DropdownMenuItem(
                                  value: "Female",
                                  child: "Female".text.make(),
                                ),
                                DropdownMenuItem(
                                  value: "Male",
                                  child: "Male".text.make(),
                                ),
                                DropdownMenuItem(
                                  value: "Other",
                                  child: "Other".text.make(),
                                ),
                              ],
                              underline: Container(),
                              isExpanded: true,
                              onChanged: (value) {
                                gender = value.toString();
                                setState(() {});
                              })
                          .marginAll(10)
                          .box
                          .withRounded(value: 8)
                          .border(
                            color: Colors.grey,
                            width: 1,
                          )
                          .make()
                          .marginOnly(left: 10, right: 10),
                    ),
                  ],
                )),
              ],
            ),
            "Blood group".text.black.make().marginOnly(left: 10),
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
              ),
              child: DropdownButton(
                      value: blood,
                      items: [
                        DropdownMenuItem(
                          value: "AB+",
                          child: "AB+".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "AB-",
                          child: "AB-".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "A+",
                          child: "A+".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "A-",
                          child: "A-".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "B+",
                          child: "B+".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "B-",
                          child: "B-".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "O+",
                          child: "O+".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "O-",
                          child: "O-".text.make(),
                        ),
                      ],
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          blood = value.toString();
                        });
                      })
                  .marginOnly(left: 10, right: 10)
                  .box
                  .withRounded(value: 8)
                  .border(
                    color: Colors.grey,
                    width: 1,
                  )
                  .make()
                  .marginOnly(left: 10, right: 10),
            ),
            10.heightBox,
            "Diet".text.black.make().marginOnly(left: 10),
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
              ),
              child: DropdownButton(
                      value: diet,
                      items: [
                        DropdownMenuItem(
                          value: "Veg",
                          child: "Veg".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Non-Veg",
                          child: "Non-Veg".text.make(),
                        ),
                        DropdownMenuItem(
                          value: "Both",
                          child: "Both".text.make(),
                        ),
                      ],
                      underline: Container(),
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          diet = value.toString();
                        });
                      })
                  .marginOnly(left: 10, right: 10)
                  .box
                  .withRounded(value: 8)
                  .border(
                    color: Colors.grey,
                    width: 1,
                  )
                  .make()
                  .marginOnly(left: 10, right: 10),
            ),
            10.heightBox,
            Row(
              children: [
                Expanded(
                  child: buildField(
                    title: "Height(cm)",
                    hint: "Enter your height",
                    controller: heightController,
                  ),
                ),
                Expanded(
                  child: buildField(
                    title: "Weight(kg)",
                    hint: "Enter your weight",
                    controller: weightController,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                "Are you insured?".text.black.make(),
                //yes no elevated button
                const SizedBox(width: 10), const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isInsured = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: const Size(60, 30),
                    backgroundColor: isInsured ? themeColor2 : Colors.grey[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                10.widthBox,
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isInsured = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(60, 30),
                    elevation: 0,
                    backgroundColor:
                        !isInsured ? themeColor2 : Colors.grey[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                10.widthBox,
              ],
            ).marginOnly(
              left: 10,
              right: 10,
            ),
            if (isInsured == true)
              Theme(
                data: ThemeData(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton(
                        value: insured,
                        items: [
                          DropdownMenuItem(
                            value: "Corporate",
                            child: "Corporate".text.make(),
                          ),
                          DropdownMenuItem(
                            value: "Self-insured",
                            child: "Self-insured".text.make(),
                          ),
                          DropdownMenuItem(
                            value: "Both",
                            child: "Both".text.make(),
                          ),
                        ],
                        underline: Container(),
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            insured = value.toString();
                          });
                        })
                    .marginOnly(left: 10, right: 10)
                    .box
                    .withRounded(value: 8)
                    .border(
                      color: Colors.grey,
                      width: 1,
                    )
                    .make()
                    .marginOnly(left: 10, right: 10),
              ),
            10.heightBox,
            Row(
              children: [
                "You Have Medical History?".text.black.make(),
                //yes no elevated button
                const SizedBox(width: 5), const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMedical = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: const Size(60, 30),
                    backgroundColor: isMedical ? themeColor2 : Colors.grey[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                10.widthBox,
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isMedical = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(60, 30),
                    elevation: 0,
                    backgroundColor:
                        !isMedical ? themeColor2 : Colors.grey[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                10.widthBox,
              ],
            ).marginOnly(
              left: 10,
              right: 10,
            ),
            if (isMedical == true)
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
              ).marginOnly(left: 10, right: 10),
            10.heightBox,
            ButtonPrimary(
              onPressed: () async {
                isLoading.value = true;
                try {
                  updateProfile();
                } catch (e) {
                  log("$e");
                } finally {
                  isLoading.value = false;
                }
              },
              title: "Update",
            ),
          ],
        ).w(
          double.infinity,
        ),
      ),
    );
  }
}

Column bulldScore(String title, List<String> optipns, String outof,
    TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title.text.make().marginOnly(left: 10),
      10.heightBox,
      Row(
        children: [
          buildScore(optipns.first),
          buildScore(optipns[1]),
          buildScore(optipns[2]),
        ],
      ),
      TextFormField(
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            border: InputBorder.none,
            suffixIcon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                outof.text.gray400.make(),
              ],
            ),
            hintText: "Enter here"),
      )
          .box
          .border(color: Vx.gray400)
          .roundedSM
          .margin(const EdgeInsets.all(15))
          .make(),
      10.heightBox
    ],
  );
}

Widget buildScore(String title) {
  return title.text
      .color(themeColor)
      .make()
      .pOnly(left: 15, right: 15, top: 5, bottom: 5)
      .box
      .rounded
      .border(color: themeColor)
      .margin(const EdgeInsets.all(10))
      .make();
}

import 'dart:developer';
import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/edit_profile/controllers/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  bool isInsured = false;
  bool isMedical = false;
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
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
    final controller = Get.put(EditProfileController());
    final nameCOntroller = TextEditingController();
    final emailCOntroller = TextEditingController();
    final mobileController = TextEditingController();

    final educationDetailsController = TextEditingController();
    final subjectController = TextEditingController();
    final collegeNameCotroller = TextEditingController();
    final specializationController = TextEditingController();
    final expectedScoreController = TextEditingController();
    final engTestScoreController = TextEditingController();
    final aptitudeTestScoreController = TextEditingController();
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar("Edit profile"),
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
              hint: "+91 97101224553",
              controller: mobileController,
            ),
            Row(
              children: [
                Expanded(
                  child: buildField(
                    title: "Date of Birth",
                    hint: "DD/MM/YYYY",
                    controller: mobileController,
                  ),
                ),
                Expanded(
                  child: buildField(
                    title: "Gender",
                    hint: "Male",
                    controller: mobileController,
                  ),
                ),
              ],
            ),
            "Blood group".text.black.make().marginOnly(left: 10),
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
              ),
              child: DropdownButton(
                      value: "AB+",
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
                      onChanged: (value) {})
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
            "Blood group".text.black.make().marginOnly(left: 10),
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
              ),
              child: DropdownButton(
                      value: "Veg",
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
                      onChanged: (value) {})
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
                    hint: "58",
                    controller: mobileController,
                  ),
                ),
                Expanded(
                  child: buildField(
                    title: "Weight(kg)",
                    hint: "68",
                    controller: mobileController,
                  ),
                ),
              ],
            ),

            "Do you Have Health Insurance?".text.black.make().marginOnly(
                  left: 10,
                  right: 10,
                ),
            //yes no elevated button
            Row(
              children: [
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
                        value: "Corporate",
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
                        onChanged: (value) {})
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
            "You Have Medical History?".text.black.make().marginOnly(
                  left: 10,
                  right: 10,
                ),

            Row(
              children: [
                //yes no elevated button

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
                  setState(() {
                    tags = val;
                  });
                },
                choiceItems: C2Choice.listFrom<String, String>(
                  source: medicalHistory,
                  value: (i, v) => v,
                  label: (i, v) => v,
                  tooltip: (i, v) => v,
                ),
                choiceCheckmark: true,
                choiceStyle: C2ChipStyle.outlined(),
              ),
            // 10.heightBox,
            // if (isMedical)
            //   buildField(
            //     title: "Duration",
            //     hint: "Duration",
            //   ),
            // if (isMedical)
            //   //add more button
            //   ElevatedButton(
            //           style: ElevatedButton.styleFrom(
            //             elevation: 0,
            //             minimumSize: const Size(60, 30),
            //             backgroundColor: themeColor2,
            //             shape: RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //           onPressed: () {},
            //           child: "Add More".text.white.make())
            //       .pSymmetric(
            //     h: 10,
            //   ),
            ButtonPrimary(
              onPressed: () async {
                isLoading.value = true;
                try {
                  await controller.editProfile(
                    aptitudeTestScore: aptitudeTestScoreController.text,
                    collegeName: collegeNameCotroller.text,
                    educationDetails: educationDetailsController.text,
                    email: emailCOntroller.text,
                    engTestScore: engTestScoreController.text,
                    expectedScore: expectedScoreController.text,
                    mobile: mobileController.text,
                    name: nameCOntroller.text,
                    profile: profileImage!,
                    specialization: specializationController.text,
                    subject: subjectController.text,
                  );
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

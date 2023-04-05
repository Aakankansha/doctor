import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/edit_profile/controllers/edit_profile_controller.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
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
      backgroundColor: const Color(0xffEDF9F9),
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
            const SizedBox(height: 10),
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

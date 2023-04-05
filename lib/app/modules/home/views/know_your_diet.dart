import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';
import 'know_your_diet_details.dart';

class KnowYourDiet extends StatefulWidget {
  const KnowYourDiet({super.key});

  @override
  State<KnowYourDiet> createState() => _KnowYourDietState();
}

class _KnowYourDietState extends State<KnowYourDiet> {
  String birthday = "Select Date";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: CoolStepper(
        onCompleted: () {
          Get.to(() => const KnowYourDietDetails());
        },
        steps: [
          CoolStep(
            validation: () {
              return null;
            },
            title: "Basic Information",
            subtitle:
                "Please fill in the basic information to continue with the registration process",
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightBox,
                  "Name".text.bold.xl.make(),
                  10.heightBox,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your name",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  20.heightBox,
                  "Gender".text.bold.xl.make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: "Male".text.make(),
                            value: false,
                            groupValue: false,
                            onChanged: (v) {}),
                      ),
                      Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: "Female".text.make(),
                            value: true,
                            groupValue: false,
                            onChanged: (v) {}),
                      ),
                    ],
                  ),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: "Others".text.make(),
                      value: true,
                      groupValue: false,
                      onChanged: (v) {}),
                  20.heightBox,
                  "Age".text.bold.xl.make(),
                  10.heightBox,
                  Theme(
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
                                " ${value!.day}/${value.month}/${value.year}  (${DateTime.now().difference(value).inDays ~/ 365} years)";
                          });
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Select Date',
                        filled: true,
                        border: UnderlineInputBorder(
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
                  20.heightBox,
                  "Height".text.bold.xl.make(),
                  10.heightBox,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your height",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  20.heightBox,
                  "Weight".text.bold.xl.make(),
                  10.heightBox,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your weight",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            isHeaderEnabled: false,
          ),
          CoolStep(
            validation: () {
              return null;
            },
            isHeaderEnabled: false,
            title: "",
            subtitle: "",
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightBox,
                  "Do you have any Medical History?".text.bold.xl.make(),
                  10.heightBox,
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter your name",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                  20.heightBox,
                  "Diet you prefer in your routine".text.bold.xl.make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: "Veg".text.make(),
                            value: false,
                            groupValue: false,
                            onChanged: (v) {}),
                      ),
                      Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: "Non-Veg".text.make(),
                            value: true,
                            groupValue: false,
                            onChanged: (v) {}),
                      ),
                    ],
                  ),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: "Both".text.make(),
                      value: true,
                      groupValue: false,
                      onChanged: (v) {}),
                  20.heightBox,
                  "Your Exercise pattern".text.bold.xl.make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: "Daily".text.make(),
                            value: false,
                            groupValue: false,
                            onChanged: (v) {}),
                      ),
                      Expanded(
                        child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            title: "Non frequently".text.make(),
                            value: true,
                            groupValue: false,
                            onChanged: (v) {}),
                      ),
                    ],
                  ),
                  RadioListTile(
                      contentPadding: EdgeInsets.zero,
                      title: "Not at all".text.make(),
                      value: true,
                      groupValue: false,
                      onChanged: (v) {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

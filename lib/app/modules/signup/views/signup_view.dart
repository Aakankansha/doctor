import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/main/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool isInsured = false;
  final formKey = GlobalKey<FormState>();
  String name = "";
  String gender = "male";
  String birthday = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          title: "Create Account".text.color(themeColor).xl2.bold.make(),
          centerTitle: true,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_rounded,
              color: themeColor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/create ac.png",
                  ),
                ),
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Colors.grey[200],
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      onSaved: (value) => name = value!,
                    ),
                    const SizedBox(height: 15),
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
                          labelText: 'Date of Birth',
                          filled: true,
                          border: OutlineInputBorder(
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
                    const SizedBox(height: 15),
                    Theme(
                      data: Theme.of(context).copyWith(
                          canvasColor: Colors.grey[200],
                          primaryColor: const Color(0xff0D0940)),
                      child: DropdownButtonFormField(
                        borderRadius: BorderRadius.circular(10),
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: gender,
                        onChanged: (value) => setState(() => gender = value!),
                        items: const [
                          DropdownMenuItem(
                            value: 'male',
                            child: Text('Male'),
                          ),
                          DropdownMenuItem(
                            value: 'female',
                            child: Text('Female'),
                          ),
                          DropdownMenuItem(
                            value: 'other',
                            child: Text('Other'),
                          ),
                        ],
                        validator: (value) {
                          if (value == null) {
                            return 'Please select your gender';
                          }
                          return null;
                        },
                      ),
                    ),
                    10.heightBox,
                    Row(
                      children: [
                        "Are you insured?".text.color(themeColor2).make(),
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
                            backgroundColor:
                                isInsured ? themeColor2 : Colors.grey[500],
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
                    ),
                    30.heightBox,
                    ElevatedButton(
                      onPressed: () {
                        // if (formKey.currentState!.validate()) {
                        //   formKey.currentState!.save();

                        Get.to(() => const MainView());

                        //   }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: themeColor2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 60),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).p12(),
              ],
            ),
          ),
        ));
  }
}

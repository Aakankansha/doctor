import 'dart:convert';
import 'dart:developer';

import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/edit_profile/views/add_family_member.dart';
import 'package:clear_vikalp_app/app/modules/home/views/review_order_screen.dart';
import 'package:clear_vikalp_app/app/modules/nearByHospital/controller/near_by_hospital_controller.dart';
import 'package:clear_vikalp_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:clear_vikalp_app/util/constant.dart';
import 'package:expandable/expandable.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class HospitalDetailsScreen extends StatelessWidget {
  const HospitalDetailsScreen({super.key, required this.hospitalDetails});
  final dynamic hospitalDetails;

  getDepartments() async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('$baseUrl/service/departmentbyhospital'));
    request.fields.addAll({'hosid': '6'});


    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      var body = await response.stream.bytesToString();
      print(body);
      return jsonDecode(body)['doctor'];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    NearByHospitalController nearByHospitalController =
        Get.put(NearByHospitalController());
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nearby Hospital',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                ),
                Text(
                  'Vasai Road',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
      body: FutureBuilder(
          future: getDepartments(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snap.hasError) {
              return const Center(
                child: Text("Error"),
              );
            }
            List<dynamic> departList = snap.data as List<dynamic>;
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            color: Colors.white,
                            image: hospitalDetails["hospital_img"] == null
                                ? const DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      "assets/images/app_icon.png",
                                    ),
                                  )
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      "$baseMediaUrl${hospitalDetails["hospital_img"].toString().split(",").first}",
                                    ),
                                  ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              hospitalDetails['hospital_name'],
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                VxRating(
                                  value: double.parse(
                                      hospitalDetails['google_rating']),
                                  count: 5,
                                  onRatingUpdate: (value) {},
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  hospitalDetails['google_rating'],
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.info_outlined,
                                  color: Colors.black45,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              hospitalDetails['address'],
                              maxLines: 2,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '3.6 km Away',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Near Station ${hospitalDetails['nearest_station']}',
                        style: const TextStyle(
                          color: themeColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FindDropdown<dynamic>(
                          searchBoxDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            hintText: "Search by Department",
                          ),
                          backgroundColor: Colors.white,
                          items: departList,
                          label: "Search by Department",
                          onChanged: (dynamic item) => nearByHospitalController
                              .selectedDepart.value = item,
                          selectedItem: departList.first,
                          dropdownItemBuilder:
                              (context, dynamic item, bool isSelected) {
                            return ListTile(
                              title: Text(item['department_name']!),
                              trailing:
                                  isSelected ? const Icon(Icons.check) : null,
                            );
                          },
                          dropdownBuilder: (context, value) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      value!['department_name'],
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  5.widthBox,
                                  const Icon(
                                    Icons.arrow_downward_rounded,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      10.widthBox,
                      Expanded(
                        child: FindDropdown<String>(
                          dropdownBuilder: (context, String? value) {
                            return Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  10.widthBox,
                                  const Icon(
                                    Icons.arrow_downward_rounded,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            );
                          },
                          searchBoxDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 1,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            hintText: "Search by Doctor Name",
                          ),
                          backgroundColor: Colors.white,
                          items: const [
                            "Dr.Raj Sharma",
                            "Dr.Raj Sharma",
                            "Dr.Raj Sharma",
                            "Dr.Raj Sharma",
                            "Dr.Raj Sharma",
                          ],
                          label: "Search by Doctor",
                          onChanged: (String? item) => print(item),
                          selectedItem: "Dr.Raj Sharma",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      "List of Doctor"
                          .text
                          .color(themeColor)
                          .bold
                          .size(18)
                          .make(),
                      const Spacer(),
                      Obx(
                        () => Visibility(
                            visible: nearByHospitalController
                                .selectedDepart.isNotEmpty,
                            child: GestureDetector(
                              onTap: () {
                                nearByHospitalController.selectedDepart.value =
                                    {};
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.clear_rounded,
                                    color: themeColor,
                                  ),
                                  5.widthBox,
                                  "Clear Filter".text.color(themeColor).make(),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                  const Divider(
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  Obx(
                    () => nearByHospitalController.selectedDepart.isNotEmpty
                        ? ExpandablePanel(
                            header: Text(
                                nearByHospitalController
                                    .selectedDepart["department_name"],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                            collapsed: const SizedBox(),
                            expanded: ExpandedWidget(
                              departId: nearByHospitalController
                                  .selectedDepart["id"]
                                  .toString(),
                              hospitalDetails: hospitalDetails,
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: departList.length,
                            itemBuilder: (context, index) {
                              return ExpandablePanel(
                                header:
                                    Text(departList[index]["department_name"],
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                collapsed: const SizedBox(),
                                expanded: ExpandedWidget(
                                  departId: departList[index]["id"].toString(),
                                  hospitalDetails: hospitalDetails,
                                ),
                              );
                            }),
                  ),
                ],
              ),
            ));
          }),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  ExpandedWidget(
      {super.key, required this.departId, required this.hospitalDetails});
  final String departId;
  final dynamic hospitalDetails;
  Future<List> getDoctor() async {
    log("Enter in getDoctor");
    var request = http.MultipartRequest(
        'POST', Uri.parse('${baseUrl}service/doctorbyhospital'));
    request.fields.addAll({'depid': departId, 'hosid': '6'});

    http.StreamedResponse response = await request.send();
    var body = await response.stream.bytesToString();
    log(body);
    if (response.statusCode == 200) {
      return jsonDecode(body)['doctor'] as List;
    } else {
      return [];
    }
  }

  bool isSelf = true;
  bool isProceed = false;
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    log(hospitalDetails.toString());
    NearByHospitalController c = Get.find();
    ProfileController profileController = Get.find();
    return FutureBuilder<List>(
        future: getDoctor(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snap.hasError) {
            return const Center(
              child: Text("No Doctor Found"),
            );
          }
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snap.data!.length,
              itemBuilder: (context, index) {
                var doctor = snap.data![index];
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.bottomSheet(
                          StatefulBuilder(builder: (context, set) {
                            return isProceed == true
                                ? Obx(
                                    () => Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          "Your booking OPD Consultation for"
                                              .text
                                              .xl2
                                              .bold
                                              .make(),
                                          doctor["doctor_name"]
                                              .toString()
                                              .text
                                              .xl
                                              .bold
                                              .make(),
                                          //"Spine Surgeon".text.xl.make(),
                                          "${hospitalDetails["hospital_name"]}"
                                              .text
                                              .xl
                                              .make(),
                                          10.heightBox,
                                          "Date for booking".text.xl.make(),
                                          10.heightBox,
                                          TextFormField(
                                            controller: dateController,
                                            readOnly: true,
                                            onTap: () {
                                              showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime.now().add(
                                                    const Duration(days: 60),
                                                  ),
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        /// use `colorScheme: ` for more
                                                        // date picker dialogBackground color in simple case
                                                        dialogBackgroundColor:
                                                            Colors.white,
                                                        timePickerTheme:
                                                            TimePickerTheme.of(
                                                                    context)
                                                                .copyWith(
                                                          //background color of time picker
                                                          backgroundColor: Colors
                                                              .lightBlueAccent,
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  }).then((value) {
                                                set(() {
                                                  dateController.text =
                                                      " ${value!.day}/${value.month}/${value.year}";

                                                  c.date =
                                                      "${value.year}-${value.month}-${value.day}";
                                                });
                                              });
                                            },
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 5),
                                              hintText: "Select Date",
                                            ),
                                          ),
                                          10.heightBox,
                                          "Time for booking".text.xl.make(),
                                          10.heightBox,
                                          Row(
                                            children: [
                                              Expanded(
                                                child: "Morning"
                                                    .text
                                                    .xl
                                                    .color(
                                                      c.selectedBookingTime
                                                                  .value ==
                                                              "Morning"
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )
                                                    .makeCentered()
                                                    .p12()
                                                    .box
                                                    .color(c.selectedBookingTime
                                                                .value ==
                                                            "Morning"
                                                        ? themeColor
                                                        : Colors.white)
                                                    .withRounded(value: 6)
                                                    .make()
                                                    .onTap(() {
                                                  c.selectedBookingTime.value =
                                                      "Morning";
                                                }),
                                              ),
                                              20.widthBox,
                                              Expanded(
                                                child: "Afternoon"
                                                    .text
                                                    .xl
                                                    .color(
                                                      c.selectedBookingTime
                                                                  .value ==
                                                              "Afternoon"
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )
                                                    .makeCentered()
                                                    .p12()
                                                    .box
                                                    .color(c.selectedBookingTime
                                                                .value ==
                                                            "Afternoon"
                                                        ? themeColor
                                                        : Colors.white)
                                                    .withRounded(value: 6)
                                                    .make()
                                                    .onTap(() {
                                                  c.selectedBookingTime.value =
                                                      "Afternoon";
                                                }),
                                              ),
                                            ],
                                          ),
                                          20.heightBox,
                                          Row(
                                            children: [
                                              Expanded(
                                                child: "Evening"
                                                    .text
                                                    .xl
                                                    .color(
                                                      c.selectedBookingTime
                                                                  .value ==
                                                              "Evening"
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )
                                                    .makeCentered()
                                                    .p12()
                                                    .box
                                                    .color(c.selectedBookingTime
                                                                .value ==
                                                            "Evening"
                                                        ? themeColor
                                                        : Colors.white)
                                                    .withRounded(value: 6)
                                                    .make()
                                                    .onTap(() {
                                                  c.selectedBookingTime.value =
                                                      "Evening";
                                                }),
                                              ),
                                              20.widthBox,
                                              Expanded(
                                                child: "Anytime"
                                                    .text
                                                    .xl
                                                    .color(
                                                      c.selectedBookingTime
                                                                  .value ==
                                                              "Anytime"
                                                          ? Colors.white
                                                          : Colors.black,
                                                    )
                                                    .makeCentered()
                                                    .p12()
                                                    .box
                                                    .color(c.selectedBookingTime
                                                                .value ==
                                                            "Anytime"
                                                        ? themeColor
                                                        : Colors.white)
                                                    .withRounded(value: 6)
                                                    .make()
                                                    .onTap(() {
                                                  c.selectedBookingTime.value =
                                                      "Anytime";
                                                }),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: themeColor,
                                                minimumSize: const Size(
                                                    double.infinity, 50),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              onPressed: () {
                                                set(() {
                                                  isProceed = false;
                                                });
                                                c.addToNearByHospital(
                                                    docId:
                                                        hospitalDetails["id"],
                                                    departId: departId,
                                                    hospitalId: doctor["id"]);
                                                Get.back();
                                                Get.to(() =>
                                                    const ReviewOrderScreen());
                                              },
                                              child:
                                                  "Proceed".text.white.make()),
                                          10.heightBox,
                                        ],
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        "Booking for ?".text.xl2.bold.make(),
                                        10.heightBox,
                                        Obx(
                                          () => Wrap(
                                            runAlignment: WrapAlignment.center,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            runSpacing: 10,
                                            spacing: 10,
                                            children: [
                                              ...profileController.familyList
                                                  .map((e) => SizedBox(
                                                        width: Get.width * 0.28,
                                                        child: Column(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 26,
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                e.profileImage
                                                                        .isEmptyOrNull
                                                                    ? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pngall.com%2Favatar-png%2Fdownload%2F95461&psig=AOvVaw1hCjOpp70qFNv4nlW2W86j&ust=1698568438420000&source=images&cd=vfe&opi=89978449&ved=0CBIQjRxqFwoTCPiE6dWqmIIDFQAAAAAdAAAAABBC"
                                                                    : (baseMediaUrl +
                                                                        e.profileImage!),
                                                              ),
                                                            ),
                                                            5.heightBox,
                                                            "(${e.familyRelation})"
                                                                .text
                                                                .gray500
                                                                .make(),
                                                            "${e.name}"
                                                                .text
                                                                .make(),
                                                          ],
                                                        )
                                                            .p8()
                                                            .box
                                                            .withRounded()
                                                            .color(c.selectedFamilyMember
                                                                        .value !=
                                                                    e
                                                                ? Colors
                                                                    .transparent
                                                                : themeColor
                                                                    .withOpacity(
                                                                        0.1))
                                                            .make()
                                                            .onTap(() {
                                                          c.selectedFamilyMember
                                                              .value = e;
                                                        }),
                                                      ))
                                                  .toList(),
                                              20.widthBox,
                                              const CircleAvatar(
                                                radius: 26,
                                                backgroundColor: themeColor,
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ).onTap(() {
                                                Get.to(() =>
                                                    const AddFamilyMemberScreen());
                                              }),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: themeColor,
                                              minimumSize: const Size(
                                                  double.infinity, 50),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              if (c.selectedFamilyMember.value
                                                      .id ==
                                                  null) {
                                                Get.snackbar("Error",
                                                    "Please select family member",
                                                    backgroundColor: Colors.red,
                                                    colorText: Colors.white,
                                                    margin:
                                                        const EdgeInsets.only(
                                                      top: 10,
                                                      left: 10,
                                                      right: 10,
                                                    ));
                                                return;
                                              } else {
                                                set(() {
                                                  isProceed = true;
                                                });
                                              }
                                            },
                                            child: "Proceed".text.white.make()),
                                        10.heightBox,
                                      ],
                                    ),
                                  );
                          }),
                          backgroundColor: Colors.white,
                        );
                      },
                      leading: const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            "https://lucknow.apollohospitals.com/wp-content/uploads/2021/doctors/2.jpg"),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                              child: Text(
                            doctor["doctor_name"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          // 10.widthBox,
                          // Tooltip(
                          //   triggerMode: TooltipTriggerMode.tap,
                          //   message:
                          //       "${doctor["year_experience"]} years of Operation",
                          //   child: const Icon(Icons.info),
                          // ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(doctor["qualification"] +
                                    "  ${doctor["year_experience"]} years"),
                              ),
                              5.widthBox,
                              if (doctor["qualification_verify"] == "1")
                                Image.asset(
                                  "assets/images/verify6.png",
                                  height: 20,
                                ),
                            ],
                          ),
                          //   const Text("Spine Surgeon  3 year"),
                        ],
                      ),
                      trailing: "Consult"
                          .text
                          .white
                          .bold
                          .make()
                          .pSymmetric(h: 20, v: 5)
                          .box
                          .withRounded(value: 8)
                          .color(themeColor2)
                          .make(),
                    ),
                  ],
                );
              });
        });
  }
}

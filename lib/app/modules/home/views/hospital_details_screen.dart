import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/edit_profile/views/add_family_member.dart';
import 'package:clear_vikalp_app/app/modules/home/views/review_order_screen.dart';
import 'package:expandable/expandable.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HospitalDetailsScreen extends StatelessWidget {
  const HospitalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isSelf = true;
    bool isProceed = false;
    TextEditingController dateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nearby Hospital',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: const [
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
      body: SingleChildScrollView(
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
                Image.asset(
                  'assets/images/image.png',
                  height: 120,
                  width: 120,
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
                      const Text(
                        'SPECTRUM HOSPITAL',
                        style: TextStyle(
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
                            count: 5,
                            onRatingUpdate: (value) {},
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '4.5',
                            style: TextStyle(
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
                      const Text(
                        '1st Floor, Maitri ICON,  Ganesh Mandir Open 24 hours',
                        maxLines: 2,
                        style: TextStyle(
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
              children: const [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '3.6 km Away',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Spacer(),
                Text(
                  'Near Station Kalwa',
                  style: TextStyle(
                    color: Colors.blue,
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
                FindDropdown<String>(
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
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    hintText: "Search by Department",
                  ),
                  backgroundColor: Colors.white,
                  items: const [
                    "General Surgery",
                    "Skin Specialist",
                    "Orthopedic Surgery",
                    "Dentist",
                    "Cardiologist",
                    "Neurologist",
                    "Gynecologist",
                    "Psychiatrist",
                    "Dermatologist",
                    "Urologist",
                    "Gastroenterologist",
                    "Ophthalmologist",
                    "ENT Specialist",
                    "Physiotherapist",
                    "Ayurveda",
                    "Homeopathy",
                    "Dietitian",
                  ],
                  label: "Search by Department",
                  onChanged: (String? item) => print(item),
                  selectedItem: "General Surgery",
                  dropdownBuilder: (context, String? value) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            value!,
                            style: const TextStyle(
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
                ),
                10.widthBox,
                FindDropdown<String>(
                  dropdownBuilder: (context, String? value) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            value!,
                            style: const TextStyle(
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
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            "List of Doctor".text.color(themeColor).bold.size(18).make(),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            ExpandablePanel(
              header: const Text("General Surgery",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              collapsed: const SizedBox(),
              expanded: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(
                        StatefulBuilder(builder: (context, set) {
                          return isProceed == true
                              ? Padding(
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
                                      "Dr. Raj Sharma".text.xl.bold.make(),
                                      "Spine Surgeon".text.xl.make(),
                                      "Nanavati hospital".text.xl.make(),
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
                                          disabledBorder: OutlineInputBorder(
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
                                                  horizontal: 10, vertical: 5),
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
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                          20.widthBox,
                                          Expanded(
                                            child: "Afternoon"
                                                .text
                                                .xl
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
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
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                          20.widthBox,
                                          Expanded(
                                            child: "Anytime"
                                                .text
                                                .xl
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: themeColor,
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            set(() {
                                              isProceed = false;
                                            });
                                            Get.back();
                                            Get.to(() =>
                                                const ReviewOrderScreen());
                                          },
                                          child: "Proceed".text.white.make()),
                                      10.heightBox,
                                    ],
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
                                      Wrap(
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              const CircleAvatar(
                                                radius: 26,
                                                backgroundImage: NetworkImage(
                                                    "https://t4.ftcdn.net/jpg/01/82/22/03/360_F_182220324_QiTjkB3IPwx1zfNltFA4ww3dKQyYvVWB.jpg"),
                                              ),
                                              5.heightBox,
                                              "(Self)".text.gray500.make(),
                                              "Richa Tiwari".text.make(),
                                            ],
                                          )
                                              .p8()
                                              .box
                                              .withRounded()
                                              .color(!isSelf
                                                  ? Colors.transparent
                                                  : themeColor.withOpacity(0.1))
                                              .make()
                                              .onTap(() {
                                            set(() {
                                              isSelf = true;
                                            });
                                          }),
                                          20.widthBox,
                                          Column(
                                            children: [
                                              const CircleAvatar(
                                                radius: 26,
                                                backgroundImage: NetworkImage(
                                                    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2021/03/08/962158-nirmala-sitharaman-5.jpg"),
                                              ),
                                              5.heightBox,
                                              "(Mother)".text.gray500.make(),
                                              "Anaya Tiwari".text.make(),
                                            ],
                                          )
                                              .p8()
                                              .box
                                              .withRounded()
                                              .color(isSelf
                                                  ? Colors.transparent
                                                  : themeColor.withOpacity(0.1))
                                              .make()
                                              .onTap(() {
                                            set(() {
                                              isSelf = false;
                                            });
                                          }),
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
                                      const Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: themeColor,
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            set(() {
                                              isProceed = true;
                                            });
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
                    title: const Text("Dr.Raj Sharma (MBA)"),
                    subtitle: const Text("Spine Surgeon  3 year"),
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
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(
                        StatefulBuilder(builder: (context, set) {
                          return isProceed == true
                              ? Padding(
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
                                      "Dr. Raj Sharma".text.xl.bold.make(),
                                      "Spine Surgeon".text.xl.make(),
                                      "Nanavati hospital".text.xl.make(),
                                      20.heightBox,
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
                                          disabledBorder: OutlineInputBorder(
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
                                                  horizontal: 10, vertical: 5),
                                          hintText: "Select Date",
                                        ),
                                      ),
                                      20.heightBox,
                                      "Time for booking".text.xl.make(),
                                      20.heightBox,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: "Morning"
                                                .text
                                                .xl
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                          20.widthBox,
                                          Expanded(
                                            child: "Afternoon"
                                                .text
                                                .xl
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
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
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                          20.widthBox,
                                          Expanded(
                                            child: "Anytime"
                                                .text
                                                .xl
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: themeColor,
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            set(() {
                                              isProceed = false;
                                            });
                                            Get.back();
                                            Get.to(() =>
                                                const ReviewOrderScreen());
                                          },
                                          child: "Proceed".text.white.make()),
                                      10.heightBox,
                                    ],
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
                                      Wrap(
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              const CircleAvatar(
                                                radius: 26,
                                                backgroundImage: NetworkImage(
                                                    "https://t4.ftcdn.net/jpg/01/82/22/03/360_F_182220324_QiTjkB3IPwx1zfNltFA4ww3dKQyYvVWB.jpg"),
                                              ),
                                              5.heightBox,
                                              "(Self)".text.gray500.make(),
                                              "Richa Tiwari".text.make(),
                                            ],
                                          )
                                              .p8()
                                              .box
                                              .withRounded()
                                              .color(!isSelf
                                                  ? Colors.transparent
                                                  : themeColor.withOpacity(0.1))
                                              .make()
                                              .onTap(() {
                                            set(() {
                                              isSelf = true;
                                            });
                                          }),
                                          20.widthBox,
                                          Column(
                                            children: [
                                              const CircleAvatar(
                                                radius: 26,
                                                backgroundImage: NetworkImage(
                                                    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2021/03/08/962158-nirmala-sitharaman-5.jpg"),
                                              ),
                                              5.heightBox,
                                              "(Mother)".text.gray500.make(),
                                              "Anaya Tiwari".text.make(),
                                            ],
                                          )
                                              .p8()
                                              .box
                                              .withRounded()
                                              .color(isSelf
                                                  ? Colors.transparent
                                                  : themeColor.withOpacity(0.1))
                                              .make()
                                              .onTap(() {
                                            set(() {
                                              isSelf = false;
                                            });
                                          }),
                                          20.widthBox,
                                          const CircleAvatar(
                                            radius: 26,
                                            backgroundColor: themeColor,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: themeColor,
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            set(() {
                                              isProceed = true;
                                            });
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
                    title: const Text("Dr.Raj Sharma (MBA)"),
                    subtitle: const Text("Brain Specialist  3 year"),
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
                  ListTile(
                    onTap: () {
                      Get.bottomSheet(
                        StatefulBuilder(builder: (context, set) {
                          return isProceed == true
                              ? Padding(
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
                                      "Dr. Raj Sharma".text.xl.bold.make(),
                                      "Spine Surgeon".text.xl.make(),
                                      "Nanavati hospital".text.xl.make(),
                                      20.heightBox,
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
                                          disabledBorder: OutlineInputBorder(
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
                                                  horizontal: 10, vertical: 5),
                                          hintText: "Select Date",
                                        ),
                                      ),
                                      20.heightBox,
                                      "Time for booking".text.xl.make(),
                                      20.heightBox,
                                      Row(
                                        children: [
                                          Expanded(
                                            child: "Morning"
                                                .text
                                                .xl
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                          20.widthBox,
                                          Expanded(
                                            child: "Afternoon"
                                                .text
                                                .xl
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
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
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                          20.widthBox,
                                          Expanded(
                                            child: "Anytime"
                                                .text
                                                .xl
                                                .makeCentered()
                                                .p12()
                                                .box
                                                .white
                                                .withRounded(value: 6)
                                                .make(),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: themeColor,
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            set(() {
                                              isProceed = false;
                                            });
                                            Get.back();
                                            Get.to(() =>
                                                const ReviewOrderScreen());
                                          },
                                          child: "Proceed".text.white.make()),
                                      10.heightBox,
                                    ],
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
                                      Wrap(
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              const CircleAvatar(
                                                radius: 26,
                                                backgroundImage: NetworkImage(
                                                    "https://t4.ftcdn.net/jpg/01/82/22/03/360_F_182220324_QiTjkB3IPwx1zfNltFA4ww3dKQyYvVWB.jpg"),
                                              ),
                                              5.heightBox,
                                              "(Self)".text.gray500.make(),
                                              "Richa Tiwari".text.make(),
                                            ],
                                          )
                                              .p8()
                                              .box
                                              .withRounded()
                                              .color(!isSelf
                                                  ? Colors.transparent
                                                  : themeColor.withOpacity(0.1))
                                              .make()
                                              .onTap(() {
                                            set(() {
                                              isSelf = true;
                                            });
                                          }),
                                          20.widthBox,
                                          Column(
                                            children: [
                                              const CircleAvatar(
                                                radius: 26,
                                                backgroundImage: NetworkImage(
                                                    "https://cdn.dnaindia.com/sites/default/files/styles/full/public/2021/03/08/962158-nirmala-sitharaman-5.jpg"),
                                              ),
                                              5.heightBox,
                                              "(Mother)".text.gray500.make(),
                                              "Anaya Tiwari".text.make(),
                                            ],
                                          )
                                              .p8()
                                              .box
                                              .withRounded()
                                              .color(isSelf
                                                  ? Colors.transparent
                                                  : themeColor.withOpacity(0.1))
                                              .make()
                                              .onTap(() {
                                            set(() {
                                              isSelf = false;
                                            });
                                          }),
                                          20.widthBox,
                                          const CircleAvatar(
                                            radius: 26,
                                            backgroundColor: themeColor,
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: themeColor,
                                            minimumSize:
                                                const Size(double.infinity, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          onPressed: () {
                                            set(() {
                                              isProceed = true;
                                            });
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
                    title: const Text("Dr.Raj Sharma (MBA)"),
                    subtitle: const Text("Spine Surgeon 3 year"),
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
              ),
            ),
            ExpandablePanel(
              header: const Text("Skin Specialist",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              collapsed: const SizedBox(),
              expanded: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://lucknow.apollohospitals.com/wp-content/uploads/2021/doctors/2.jpg"),
                    ),
                    title: const Text("Dr.Raj Sharma"),
                    subtitle: const Text("Spine Surgeon - 3 year"),
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
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://lucknow.apollohospitals.com/wp-content/uploads/2021/doctors/2.jpg"),
                    ),
                    title: const Text("Dr.Raj Sharma"),
                    subtitle: const Text("Brain Specialist  3 year"),
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
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://lucknow.apollohospitals.com/wp-content/uploads/2021/doctors/2.jpg"),
                    ),
                    title: const Text("Dr.Raj Sharma"),
                    subtitle: const Text("Brain Specialist  3 year"),
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
              ),
            ),
            ExpandablePanel(
              header: const Text("Orthopedic Surgery",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              collapsed: const SizedBox(),
              expanded: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://lucknow.apollohospitals.com/wp-content/uploads/2021/doctors/2.jpg"),
                    ),
                    title: const Text("Dr.Raj Sharma"),
                    subtitle: const Text("Brain Specialist  3 year"),
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
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://lucknow.apollohospitals.com/wp-content/uploads/2021/doctors/2.jpg"),
                    ),
                    title: const Text("Dr.Raj Sharma"),
                    subtitle: const Text("Brain Specialist  3 year"),
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
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          "https://lucknow.apollohospitals.com/wp-content/uploads/2021/doctors/2.jpg"),
                    ),
                    title: const Text("Dr.Raj Sharma"),
                    subtitle: const Text("Brain Specialist  3 year"),
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
              ),
            )
          ],
        ),
      )),
    );
  }
}

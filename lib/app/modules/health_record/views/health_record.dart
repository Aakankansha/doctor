import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/health_record/controllers/community_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

class HealthRecord extends GetView<HealthRecordController> {
  const HealthRecord({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(CommunityController());
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Health Record',
            style: TextStyle(
              color: themeColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    gridWidget(
                      textColor: const Color.fromARGB(255, 45, 92, 99),
                      title: "Lab Test\nRecord",
                      image: 'assets/images/lab test.png',
                      color: const Color.fromARGB(255, 240, 255, 254),
                    ),
                    gridWidget(
                      textColor: const Color.fromARGB(255, 99, 53, 45),
                      title: "My Records",
                      image: 'assets/images/opd booking.png',
                      color: const Color.fromARGB(255, 255, 242, 240),
                    ),
                    gridWidget(
                      textColor: const Color.fromARGB(255, 59, 45, 99),
                      title: "Upload Documents",
                      image: 'assets/images/presciption 2.png',
                      color: const Color.fromARGB(255, 247, 240, 255),
                    ),
                    // gridWidget(
                    //   textColor: const Color.fromARGB(255, 45, 79, 99),
                    //   title: "Prescription Details Record",
                    //   image: 'assets/images/presciption 2.png',
                    //   color: const Color.fromARGB(255, 240, 249, 255),
                    // ),
                    // gridWidget(
                    //   textColor: const Color.fromARGB(255, 45, 99, 85),
                    //   title: "Health Record",
                    //   image:
                    //       'assets/images/lady-doctor-checking-patient-2496307-2093272.png',
                    //   color: const Color.fromARGB(255, 240, 249, 255),
                    // ),
                  ],
                ),
              ),
              "Subscribe Membership Plan".text.bold.xl2.make(),
              10.heightBox,
              "Subscribe to our Membership Plan to get access to all the features And get 50% off on your first month "
                  .text
                  .make(),
              10.heightBox,
              Stack(
                children: [
                  Image.asset(
                    'assets/images/Banner.png',
                    width: 100.w,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: "Subscribe"
                        .text
                        .color(themeColor)
                        .bold
                        .size(12)
                        .makeCentered()
                        .box
                        .width(80)
                        .height(25)
                        .color(Colors.white)
                        .withRounded()
                        .make(),
                  ),
                ],
              ),
              10.heightBox,
            ],
          ),
        ));
  }

  Widget gridWidget({
    required String title,
    required String image,
    required Color color,
    required Color textColor,
  }) {
    return InkWell(
      onTap: () {
        Get.to(() => HealthListWidget(
              title: title,
            ));
      },
      child: Card(
        elevation: 6,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(image),
              ),
            ),
            title.text
                .color(textColor)
                .bold
                .center
                .size(
                  11,
                )
                .makeCentered(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class HealthListWidget extends StatelessWidget {
  const HealthListWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title.replaceAll("\n", " "),
          style: const TextStyle(
            color: themeColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Colors.white,
                  ),
                  child: DropdownButton(
                    onTap: () {
                      Get.to(() => const FilterScreen());
                    },
                    borderRadius: BorderRadius.circular(10),
                    style: const TextStyle(
                      color: themeColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    value: 'Filter',
                    underline: Container(
                      height: 1,
                      color: Colors.white,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'Filter',
                        child: Text('Filter'),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Health Checkup',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Blood Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Blood Donation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Health Checkup',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Blood Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Blood Donation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Health Checkup',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Blood Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Blood Donation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Health Checkup',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Blood Test',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                title: Text(
                  'Last Blood Donation',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                subtitle: Text(
                  '12/12/2020',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              "FILTER BY FAMILY MEMBERS".text.bold.make(),
              const Divider(),
              RadioListTile(
                groupValue: true,
                contentPadding: EdgeInsets.zero,
                value: false,
                onChanged: (v) {},
                title: "Self".text.xl.make(),
              ),
              RadioListTile(
                groupValue: true,
                contentPadding: EdgeInsets.zero,
                value: false,
                onChanged: (v) {},
                title: "Father".text.xl.make(),
              ),
              RadioListTile(
                groupValue: true,
                contentPadding: EdgeInsets.zero,
                value: false,
                onChanged: (v) {},
                title: "Mother".text.xl.make(),
              ),
              RadioListTile(
                groupValue: true,
                contentPadding: EdgeInsets.zero,
                value: false,
                onChanged: (v) {},
                title: "Wife".text.xl.make(),
              ),
              10.heightBox,
              "FILTER BY ORDER DATE".text.bold.make(),
              const Divider(),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: false,
                groupValue: false,
                onChanged: (v) {},
                title: "Last 30 Days".text.xl.make(),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                groupValue: false,
                onChanged: (v) {},
                title: "Last 3 Months".text.xl.make(),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                groupValue: false,
                onChanged: (v) {},
                title: "2023".text.xl.make(),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                groupValue: false,
                onChanged: (v) {},
                title: "2022".text.xl.make(),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                groupValue: false,
                onChanged: (v) {},
                title: "2021".text.xl.make(),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                groupValue: false,
                onChanged: (v) {},
                title: "2020".text.xl.make(),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                groupValue: false,
                onChanged: (v) {},
                title: "2019".text.xl.make(),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                groupValue: false,
                onChanged: (v) {},
                title: "2018".text.xl.make(),
              ),
              RadioListTile(
                contentPadding: EdgeInsets.zero,
                value: true,
                groupValue: false,
                onChanged: (v) {},
                title: "2017".text.xl.make(),
              ),
              "Apply"
                  .text
                  .white
                  .xl
                  .bold
                  .makeCentered()
                  .box
                  .withRounded()
                  .height(50)
                  .width(
                    double.infinity,
                  )
                  .color(themeColor)
                  .make()
                  .pSymmetric(
                    h: 20,
                    v: 20,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:clear_vikalp_app/app/modules/nearByHospital/view/hospital_nearby_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  int isSelf = 2;
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
          'Self Check Up Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            20.heightBox,
            "You May Have".text.bold.xl.make(),
            ListTile(
                title: "1.Migraine (90%)".text.make(),
                trailing: "Know More"
                    .text
                    .white
                    .make()
                    .pSymmetric(h: 10, v: 5)
                    .box
                    .withRounded(value: 6)
                    .color(themeColor)
                    .make()
                    .onTap(() {
                  Get.to(() => const DiagnosticDetails());
                })),
            Divider(
              color: Colors.grey[300]!,
            ),
            ListTile(
                title: "2.Brain diseases (50%)".text.make(),
                trailing: "Know More"
                    .text
                    .white
                    .make()
                    .pSymmetric(h: 10, v: 5)
                    .box
                    .withRounded(value: 6)
                    .color(themeColor)
                    .make()),
            const Divider(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}

class DiagnosticDetails extends StatelessWidget {
  const DiagnosticDetails({super.key});

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
            'Diagnostic Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              "Migraine".text.bold.xl.make().pSymmetric(h: 20, v: 0),
              "Migraine is a primary headache disorder characterized by recurrent headaches that are moderate to severe. Typically, the headaches affect one half of the head, are pulsating in nature, and last from a few hours to 3 days. Associated symptoms may include nausea, vomiting, and sensitivity to light, sound, or smell. The pain is generally made worse by physical activity. Up to one-third of people have an aura: typically a short period of visual disturbance that signals that the headache will soon occur. Occasionally, an aura can occur with little or no headache following it."
                  .text
                  .make()
                  .pSymmetric(h: 20, v: 10),
              "Symptoms".text.bold.xl.make().pSymmetric(h: 20, v: 10),
              '''1. Moderate to severe pain, usually confined to one side of the head, but switching in successive migraines
2. Pulsating and throbbing head pain
3. Increasing pain during physical activity
4. Inability to perform regular activities due to pain
5. Nausea
      '''
                  .text
                  .make()
                  .pSymmetric(h: 20, v: 0),
              "Causes".text.bold.xl.make().pSymmetric(h: 20, v: 10),
              '''1. Hormonal changes in women. Fluctuations in estrogen, such as before or during menstrual periods, pregnancy and menopause, seem to trigger headaches in many women.
2. Drinks. These include alcohol, especially wine, and too much caffeine, such as coffee.
3. Stress. Stress at work or home can cause migraines.
4. Sensory stimuli. Bright lights and sun glare can induce migraines, as can loud sounds. Strong smells — including perfume, paint thinner, secondhand smoke and others — trigger migraines in some people.
5. Sleep changes. Missing sleep, getting too much sleep or jet lag can trigger migraines in some people.
6. Physical factors. Intense physical exertion, including sexual activity, may provoke migraines.
      '''
                  .text
                  .make()
                  .pSymmetric(h: 20, v: 0),
            ],
          ),
        ),
        bottomSheet: Material(
          color: Colors.white,
          child: "Consult Doctor"
              .text
              .white
              .bold
              .center
              .make()
              .pSymmetric(h: 10, v: 20)
              .box
              .width(
                context.screenWidth,
              )
              .withRounded(value: 12)
              .color(themeColor)
              .make()
              .onTap(() {
            Get.to(() => const HospitalNearbyScreen());
          }).pSymmetric(h: 10, v: 10),
        ));
  }
}

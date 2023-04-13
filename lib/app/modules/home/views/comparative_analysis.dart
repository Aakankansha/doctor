import 'package:clear_vikalp_app/app/modules/home/views/compare_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/app_resources.dart';

class ComparativeAnalysis extends StatefulWidget {
  const ComparativeAnalysis({super.key});

  @override
  State<ComparativeAnalysis> createState() => _ComparativeAnalysisState();
}

class _ComparativeAnalysisState extends State<ComparativeAnalysis> {
  String dropdownValue = 'Doctor';
  String dropdownValue2 = 'Dr.Rahul Singh';
  String dropdownValue3 = 'Dr.Bipin Kumar';
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
        backgroundColor: themeColor2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(
          'Comparative Analysis',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.heightBox,
              "Select Category to Compare".text.xl.bold.make(),
              15.heightBox,
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Doctor',
                    'Lab',
                    'Imagining Center',
                    'Hospital'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
                    .pSymmetric(
                      h: 20,
                    )
                    .box
                    .withRounded(
                      value: 10,
                    )
                    .border(
                      color: Colors.grey,
                      width: 1,
                    )
                    .make(),
              ),
              15.heightBox,
              10.heightBox,
              "Select $dropdownValue to Compare".text.xl.bold.make(),
              15.heightBox,
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton<String>(
                  value: dropdownValue2,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                  },
                  items: <String>[
                    'Dr.Rahul Singh',
                    'Dr.Varun Sharma',
                    'Dr.Rahul Rathod',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
                    .pSymmetric(
                      h: 20,
                    )
                    .box
                    .withRounded(
                      value: 10,
                    )
                    .border(
                      color: Colors.grey,
                      width: 1,
                    )
                    .make(),
              ),
              10.heightBox,
              "Vs".text.xl.bold.makeCentered(),
              10.heightBox,
              Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: Colors.white,
                ),
                child: DropdownButton<String>(
                  value: dropdownValue3,
                  isExpanded: true,
                  underline: Container(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue3 = newValue!;
                    });
                  },
                  items: <String>[
                    'Dr.Bipin Kumar',
                    'Dr.Dipak Sharma',
                    'Dr.Rahul Sharma',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
                    .pSymmetric(
                      h: 20,
                    )
                    .box
                    .withRounded(
                      value: 10,
                    )
                    .border(
                      color: Colors.grey,
                      width: 1,
                    )
                    .make(),
              ),
              40.heightBox,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 55),
                    backgroundColor: themeColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const CompareDataScreen());
                  },
                  child: "Compare".text.bold.white.makeCentered())
            ],
          ),
        ),
      ),
    );
  }
}

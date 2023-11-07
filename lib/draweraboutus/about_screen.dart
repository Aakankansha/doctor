import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

import '../app/core/resources/app_resources.dart';
import 'controller/aboutus_controller_drawer.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/aboutus/controllers/aboutus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutScreen extends StatelessWidget {
   AboutScreen({super.key});
  // Future getAbout() async {
  //   var request = http.MultipartRequest(
  //       'GET',
  //       Uri.parse(
  //           'https://clearviklap.digitalnaman.com/api/index.php/Auth/privacy_policy_fetch'));
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
  @override
  void initState() {
    load();
   // super.initState();
  }

  load() async {
    controller.aboutUs();
  }

  final controller = Get.put(AboutusControllerDrawer());




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
          'About Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:
      FutureBuilder(
        future: controller.aboutUs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              controller.aboutUsModel == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HtmlWidget(
                          '''${controller.aboutUsModel!.aboutContent}'''),
                      30.heightBox,
                      const Divider(),
                      ListTile(
                        onTap: () {
                          launchUrlString(
                              "tel:${controller.aboutUsModel!.mobileNo}");
                        },
                        leading: const Icon(Icons.phone),
                        title: Text(controller.aboutUsModel!.mobileNo!),
                      ),
                      ListTile(
                        onTap: () {
                          launchUrlString(
                              "mailto:${controller.aboutUsModel!.email}");
                        },
                        leading: const Icon(Icons.email),
                        title: Text(controller.aboutUsModel!.email!),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

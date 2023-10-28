import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/aboutus/controllers/aboutus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutusView extends StatefulWidget {
  const AboutusView({Key? key}) : super(key: key);

  @override
  State<AboutusView> createState() => _AboutusViewState();
}

class _AboutusViewState extends State<AboutusView> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    controller.aboutUs();
  }

  final controller = Get.put(AboutusController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("About Us"),
      body: FutureBuilder(
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

import 'package:clear_vikalp_app/app/modules/privacy/controllers/privacy_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_widgets.dart';

class PrivacyView extends StatefulWidget {
  const PrivacyView({Key? key}) : super(key: key);

  @override
  State<PrivacyView> createState() => _PrivacyViewState();
}

class _PrivacyViewState extends State<PrivacyView> {
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    controller.privacyNote();
  }

  final controller = Get.put(PrivacyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Privacy Policy"),
      body: FutureBuilder(
        future: controller.privacyNote(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              controller.privacyModel == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: HtmlWidget('''${controller.privacyModel}'''),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

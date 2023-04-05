import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';
import 'package:clear_vikalp_app/app/modules/university_details/views/course_overview_tab.dart';
import 'package:clear_vikalp_app/app/modules/university_details/views/similar_course_tab.dart';
import 'package:clear_vikalp_app/gen/assets.gen.dart';

import '../controllers/university_details_controller.dart';

class UniversityDetailsView extends GetView<UniversityDetailsController> {
  const UniversityDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Course details"),
      body: Column(
        children: [
          20.heightBox,
          buildUniversityProfile(),
          SizedBox(
            height: 60,
            child: TabBar(
              tabs: [
                'Course Overview'.text.size(12).make(),
                'Similar course'.text.size(12).make(),
              ],
              unselectedLabelColor: const Color(0xffacb3bf),
              indicatorColor: themeColor,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3.0,
              indicatorPadding: const EdgeInsets.all(10),
              isScrollable: false,
              controller: controller.tabController,
            ),
          ),
          TabBarView(controller: controller.tabController, children: const [
            CourseOverviewTab(),
            SimilarCourseTab(),
          ]).expand(),
        ],
      ),
    );
  }

  Row buildUniversityProfile() {
    return Row(
      children: [
        10.widthBox,
        Image.asset(
          Assets.images.university.path,
          width: 80,
          height: 80,
        ),
        10.widthBox,
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          "Cornell details".text.make(),
          5.heightBox,
          "MS in Data Science".text.gray400.make(),
          5.heightBox,
          "New york, United States".text.gray400.make(),
        ]).expand(),
        Column(
          children: [
            const Icon(
              Icons.favorite,
              color: themeColor,
            ),
            10.heightBox,
            const Icon(
              Icons.share,
              color: themeColor,
            )
          ],
        ),
        10.widthBox
      ],
    );
  }
}

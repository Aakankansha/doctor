import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/widgets/app_widgets.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/resources/app_resources.dart';
import '../../../routes/app_pages.dart';
import '../controllers/consultation_controller.dart';

class ConsultationView extends GetView<ConsultationController> {
  const ConsultationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Consultation"),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            const SliverToBoxAdapter(child: BuildConsultationItem()),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            "Trainer's recommendation".text.bold.make(),
            SizedBox(
              height: 60,
              child: TabBar(
                tabs: [
                  'All trainer'.text.size(12).make(),
                  'Local trainer'.text.size(12).make(),
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
            TabBarView(controller: controller.tabController, children: [
              ListView.builder(
                  itemCount: 4,
                  itemBuilder: (ctx, index) {
                    return const BuildTrainer();
                  }),
              ListView.builder(
                  itemCount: 4,
                  itemBuilder: (ctx, index) {
                    return const BuildTrainer();
                  }),
            ]).expand()
          ],
        ).marginAll(10),
      ),
    );
  }
}

class BuildConsultationItem extends StatelessWidget {
  const BuildConsultationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "From INR 0".text.bold.size(18).make(),
        10.heightBox,
        "Free Counselling Session".text.gray500.make(),
        10.heightBox,
        Faker().lorem.sentences(2).join(" ").text.make(),
        10.heightBox,
        Faker().lorem.sentences(2).join(" ").text.make(),
        10.heightBox,
        ButtonPrimary(
            onPressed: () {
              Get.toNamed(Routes.CONSULTATION_DETAILS);
            },
            title: "Apply")
      ],
    )
        .p(10)
        .box
        .border(color: Vx.gray400)
        .roundedSM
        .margin(const EdgeInsets.all(10))
        .make();
  }
}

class BuildTrainer extends StatelessWidget {
  const BuildTrainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Assets.images.person.path),
            10.widthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Kristin Watson".text.size(15).bold.make(),
                10.heightBox,
                Faker()
                    .lorem
                    .sentences(3)
                    .join(" ")
                    .text
                    .maxLines(3)
                    .gray400
                    .make()
              ],
            ).expand()
          ],
        ).p(10),
        const VxDivider(
          color: Vx.gray300,
        ).marginOnly(top: 10, bottom: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            "12+ Yr Exp".text.gray500.make(),
            "4+ Rating".text.gray500.make()
          ],
        ),
        10.heightBox,
      ],
    )
        .box
        .width(240)
        .border(color: Vx.gray300)
        .roundedSM
        .margin(const EdgeInsets.all(10))
        .make()
        .onInkTap(() {});
  }
}

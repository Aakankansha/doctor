import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniversityDetailsController extends GetxController  with GetSingleTickerProviderStateMixin {
  //TODO: Implement UniversityDetailsController

  final count = 0.obs;
   late final TabController tabController =
      TabController(length: 2, vsync: this);
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

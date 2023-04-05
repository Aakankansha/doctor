import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/community/controllers/community_controller.dart';
import 'package:clear_vikalp_app/app/modules/community/views/health_record.dart';
import 'package:clear_vikalp_app/app/modules/notification/views/notification_view.dart';
import 'package:clear_vikalp_app/app/modules/profile/views/profile_view.dart';

import '../../home/views/home_view.dart';
import '../../notification/controllers/notification_controller.dart';
import '../controllers/main_controller.dart';

// class MainView extends GetView<MainController> {
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final notificationController = Get.put(NotificationController());
  final communityController = Get.put(CommunityController());
  final controller = Get.put(MainController());

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  Future loadingData() async {
    await controller.getUserInfo();
    await communityController.getCommunities();
    await communityController.getCommunityMessages();
    await notificationController.callNotifications();
  }

  List<Widget> _buildScreen() {
    return [
      const ProfileView(),
      const HealthRecord(),
      const HealthRecord(),
      const NotificationView(),
      HomeView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItem() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_rounded),
        activeColorPrimary: themeColor,
        title: "Profile",
        inactiveColorPrimary: Vx.gray400,
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.note_add),
          title: "Health Record",
          activeColorPrimary: themeColor,
          inactiveColorPrimary: Vx.gray400),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_bag_outlined,
              color: Colors.transparent),
          title: ".",
          activeColorPrimary: themeColor,
          inactiveColorPrimary: Colors.transparent),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.notifications_rounded),
          title: "Notification",
          activeColorPrimary: themeColor,
          inactiveColorPrimary: Vx.gray400),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_rounded),
          title: "Home",
          activeColorPrimary: themeColor,
          inactiveColorPrimary: Vx.gray400),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.health_and_safety,
          color: Colors.white,
        ),
      ),
      body: FutureBuilder(
        future: loadingData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return PersistentTabView(
              context,

              controller: controller.persistentTabController,
              screens: _buildScreen(),
              items: _navBarsItem(),

              confineInSafeArea: true,
              backgroundColor: Vx.white, // Default is Colors.white.
              handleAndroidBackButtonPress: true, // Default is true.
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
              stateManagement: true, // Default is true.
              hideNavigationBarWhenKeyboardShows:
                  true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.

              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties(
                // Navigation Bar's items animation properties.
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              onItemSelected: (index) {
                controller.currentIndex.value = index;
              },
              navBarStyle: NavBarStyle
                  .style2, // Choose the nav bar style with this property.
            );
          }
        },
      ),
    );
  }
}

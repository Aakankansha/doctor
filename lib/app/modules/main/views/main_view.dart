import 'package:clear_vikalp_app/app/core/resources/app_resources.dart';
import 'package:clear_vikalp_app/app/modules/notification/views/notification_view.dart';
import 'package:clear_vikalp_app/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../health_record/views/health_record.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';

// class MainView extends GetView<MainController> {
class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // final notificationController = Get.put(NotificationController());
  // final communityController = Get.put(CommunityController());
  final controller = Get.put(MainController());
  bool showEmergencyColor = false;

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
      floatingActionButton: GestureDetector(
        onLongPressCancel: () {
          setState(() {
            showEmergencyColor = false;
          });
        },
        onLongPress: () {
          Future.delayed(
            const Duration(seconds: 3),
            () {
              if (showEmergencyColor) {
                Get.dialog(
                  Theme(
                    data: ThemeData(
                      canvasColor: Colors.white,
                    ),
                    child: AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      title: const Text('Emergency'),
                      content: const Text(
                          'Are you sure you want to call emergency?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                            launchUrl(Uri.parse('tel:102'));
                          },
                          child: const Text(
                            'Call',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Cancel'),
                        ),
                      ],
                    ),
                  ),
                );
              }
              setState(() {
                showEmergencyColor = false;
              });
            },
          );
        },
        onLongPressStart: (s) {
          setState(() {
            showEmergencyColor = true;
          });
        },
        child: Stack(
          children: [
            if (showEmergencyColor)
              const Positioned(
                bottom: 0,
                right: 0,
                top: 0,
                left: 0,
                child: RippleAnimation(
                  color: themeColor,
                  delay: Duration(milliseconds: 300),
                  repeat: true,
                  minRadius: 35,
                  ripplesCount: 6,
                  duration: Duration(milliseconds: 6 * 300),
                  child: CircleAvatar(
                    minRadius: 15,
                    maxRadius: 15,
                  ),
                ),
              ),
            FloatingActionButton(
              onPressed: () {
                //on long press
              },
              child: const Icon(
                Icons.health_and_safety,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        //   future: loadingData(),
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

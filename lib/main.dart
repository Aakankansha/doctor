import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import 'app/core/resources/app_resources.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.black),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Sizer(
        builder: ((context, orientation, deviceType) {
          return GetMaterialApp(
            title: "Clear Vikalp",
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIAL,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: MaterialColor(themeColor.value, mapcolor)),
              appBarTheme: const AppBarTheme(
                  color: Vx.white,
                  systemOverlayStyle: SystemUiOverlayStyle.dark),
              fontFamily: 'poppins',
              scaffoldBackgroundColor: Vx.white,
            ),
            getPages: AppPages.routes,
          );
        }),
      ),
    ),
  );
}

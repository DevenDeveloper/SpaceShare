import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'res/theme/theme.dart';
import 'routers/my_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        return GetMaterialApp(
          darkTheme: ThemeData.light(),
          defaultTransition: Transition.rightToLeft,
          debugShowCheckedModeBanner: false,
          initialRoute: MyRouter.homeScreen,
          getPages: MyRouter.route,
          theme: ThemeData(
              fontFamily: 'OpenSans',
              primaryColor: AppTheme.primaryColor,
              highlightColor: AppTheme.primaryColor,
              scrollbarTheme: const ScrollbarThemeData().copyWith(
                thumbColor: MaterialStateProperty.all(AppTheme.primaryColor),
              ),
              colorScheme: ColorScheme.fromSwatch()
                  .copyWith(secondary: AppTheme.primaryColor)
                  .copyWith(secondary: AppTheme.primaryColor)),
        );
      });
    });
  }
}
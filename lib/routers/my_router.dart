
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/home_screen.dart';

class MyRouter {
  static var homeScreen = "/homeScreen";
  static var splashScreen = "/splashScreen";

  static var route = [
    GetPage(name: '/', page: () => const HomeScreen()),
    GetPage(name: MyRouter.homeScreen, page: () => HomeScreen()),

  ];
}

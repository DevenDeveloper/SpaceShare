import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HotelSearchResultController extends GetxController {
  int number = 10;
  String? latitude;
  String? longitude;
  String? checkInDate;
  String? checkOutDate;
  String? adultCount;
  String? childCount;
  String? locationName;
  increment() {
    number += 10;
  }
}

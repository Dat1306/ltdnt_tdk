import 'package:calculator_project/Controller/calculate_controller.dart';
import 'package:get/get.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculateController());
  }
}
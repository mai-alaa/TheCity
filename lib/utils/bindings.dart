import 'package:city_app/controller/controller.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Controller());
  }
}

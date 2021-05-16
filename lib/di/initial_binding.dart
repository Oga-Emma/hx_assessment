import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hagglex/controller/app_controller.dart';
import 'package:hagglex/controller/app_router.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
    Get.put<AppRouter>(AppRouter(), permanent: true);
  }
}

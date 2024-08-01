import 'package:get/get.dart';

import '../controllers/roottab_controller.dart';

class RoottabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoottabController>(
      () => RoottabController(),
    );
  }
}

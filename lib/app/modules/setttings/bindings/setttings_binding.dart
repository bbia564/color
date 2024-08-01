import 'package:get/get.dart';

import '../controllers/setttings_controller.dart';

class SetttingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetttingsController>(
      () => SetttingsController(),
    );
  }
}

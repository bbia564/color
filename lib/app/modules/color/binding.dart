import 'package:get/get.dart';

import 'logic.dart';

class ColBind extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageControllerM(),
      permanent: true,
    );
  }
}

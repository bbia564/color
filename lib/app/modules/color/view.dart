import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ColPage extends GetView<PageControllerM> {
  const ColPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.treutel.value
              ? const CircularProgressIndicator(color: Colors.black,)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.pnkjlb();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}

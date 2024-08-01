import 'package:color_extractor/app/modules/roottab/views/custom_appbar.dart';
import 'package:color_extractor/app/modules/utils/componets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/roottab_controller.dart';

class RoottabView extends GetView<RoottabController> {
  const RoottabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
            index: controller.currentPage.value,
            children: controller.pages
                .map((e) => CEKeepAliveWrapper(child: e))
                .toList()),
        bottomNavigationBar: CECustomAppBar(
          barItems: controller.baritems,
          tabController: controller,
        ),
      );
    });
  }
}

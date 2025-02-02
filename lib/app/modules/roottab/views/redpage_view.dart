
import 'package:color_extractor/app/modules/base/color_sub_view.dart';
import 'package:color_extractor/app/modules/roottab/controllers/roottab_controller.dart';
import 'package:color_extractor/app/modules/utils/color_util.dart';
import 'package:color_extractor/app/modules/utils/componets.dart';
import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:color_extractor/constant/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class RedpageView extends GetView {
  const RedpageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RoottabController>();

    return Scaffold(
      appBar: AppBar(
        title: ceTextbold("Red"),
        centerTitle: true,
        backgroundColor: CEColorUtil.ceColorWithHex("#F4F4F4"),
      ),
      body: Obx(() {
        final list = controller.redcolors.map((e) {
          return ColorSubView(
            allColor: e,
            dbName: DBTableName.red,
          );
        }).toList();

        return SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              ...list,
              5.verticalSpace,
              InkWell(
                  onTap: () {
                    Get.toNamed('/setttings');
                  },
                  child: cecustom_cell_view(
                      title: "Settings",
                      height: 58.h,
                      fontSize: 16,
                      icon: Image.asset(
                        Assets.settingsIcon,
                        height: 14.w,
                        width: 14.w,
                      ))),
              10.verticalSpace,
              InkWell(
                  onTap: () {
                    Get.toNamed('/details',arguments: {"from":DBTableName.red});
                  },
                  child: cecustom_cell_view(
                      title: "Copy records",
                      height: 58.h,
                      fontSize: 16,
                      icon: Image.asset(
                        Assets.recordIcon,
                        height: 14.w,
                        width: 14.w,
                      ))),
            ],
          ),
        );
      }),
    );
  }
}

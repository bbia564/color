import 'package:color_extractor/app/modules/utils/componets.dart';
import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/setttings_controller.dart';

class SetttingsView extends GetView<SetttingsController> {
  const SetttingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: black_title_color),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            12.verticalSpace,
            ceContainer(
                radius: 8.w,
                height: 58.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Copy shake",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: black_title_color,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Obx(() => Switch(
                        value: controller.isOn.value,
                        onChanged: controller.change))
                  ],
                )),
            10.verticalSpace,
            InkWell(
              onTap: controller.cleanData,
              child: cecustom_cell_view(
                title: "Clear records",
              ),
            ),
            10.verticalSpace,
            InkWell(
                onTap: controller.share,
                child: cecustom_cell_view(
                  title: "Share",
                ))
          ],
        ),
      ),
    );
  }
}

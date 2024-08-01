import 'package:color_extractor/app/modules/utils/color_util.dart';
import 'package:color_extractor/app/modules/utils/componets.dart';
import 'package:color_extractor/constant/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ceTextbold("Copy Record"),
        centerTitle: true,
      ),
      body: Obx(() => controller.allDetails.isEmpty
          ? Center(
              child: ceTextbold("no data yet",
                  textColor: CEColorUtil.ceColorWithHex("#999999"),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            )
          : ListView.builder(
            itemCount: controller.allDetails.length,
              padding: EdgeInsets.all(16.w),
              itemBuilder: (context, index) {
                final model = controller.allDetails[index];

              return  cecustom_cell_view(
                    title: model.colorName ?? "-",
                    titleColor: CEColorUtil.ceColorWithHex(model.colorName!),
                    rightIconName: Assets.copyIcon,
                    margin: EdgeInsets.only(bottom: 10.h)
                    );
              },
            )),
    );
  }
}

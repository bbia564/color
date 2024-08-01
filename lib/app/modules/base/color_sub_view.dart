import 'package:color_extractor/app/data/colors_model.dart';
import 'package:color_extractor/app/modules/UI/ce_dialog.dart';
import 'package:color_extractor/app/modules/utils/color_util.dart';
import 'package:color_extractor/app/modules/utils/componets.dart';
import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:color_extractor/app/modules/utils/copy_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ColorSubView extends StatelessWidget with ColorCopyMix, VibrateMix {
  final AllColors allColor;
  final DBTableName dbName;
  const ColorSubView({super.key, required this.allColor,required this.dbName});


  Widget _colorviewItem(String color) {
    return InkWell(
      onTap: () {
        showCopyDialog(color,dbName: dbName);
        ceOnceVibrate();
      },
      child: Container(
        height: 40.h,
        width: 91.w,
        color: CEColorUtil.ceColorWithHex(color),
      ),
    );
  }

  Widget _colors_row(ColorsSubModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        14.verticalSpace,
        ceContainer(
            height: 40.h,
            radius: 20.h,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _colorviewItem("${model.colors?[0]}"),
                _colorviewItem("${model.colors?[1]}"),
                _colorviewItem("${model.colors?[2]}"),
              ],
            )),
        6.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ceTextbold("${model.colors?[0]}",
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                textColor: grey_text_color),
            ceTextbold("${model.colors?[1]}",
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                textColor: grey_text_color),
            ceTextbold("${model.colors?[2]}",
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                textColor: grey_text_color)
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorName = allColor.titleColorName;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ceContainer(
            width: 344.w,
            radius: 20.w,
            color: Colors.white,
            margin: EdgeInsets.only(top: 20.h, bottom: 16.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ceTextbold(allColor.name ?? "- ",
                        fontSize: 16.sp,
                        textColor: CEColorUtil.ceColorWithHex(
                            allColor.titleColorName!)),
                    ceTextbold(colorName ?? "- ",
                        fontSize: 16.sp,
                        textColor: CEColorUtil.ceColorWithHex(colorName!))
                  ],
                ),
                ...allColor.subColors!.map((e) => _colors_row(e))
              ],
            )),
        ceContainer(
            radius: 30.w,
            height: 60.w,
            width: 60.w,
            alignment: Alignment.center,
            color: CEColorUtil.ceColorWithHex(allColor.titleColorName!),
            child: ceContainer(
                radius: 10.w, height: 20.w, width: 20.w, color: Colors.white)),
      ],
    );
  }
}

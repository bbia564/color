import 'package:color_extractor/app/modules/utils/color_util.dart';
import 'package:color_extractor/app/modules/utils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CeDialog extends StatelessWidget {
  final String color;
  final Function() okAction;
  final Function()? cancleAction;
  const CeDialog(
      {super.key,
      this.cancleAction,
      required this.okAction,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: ceContainer(
            radius: 10.w,
            width: 300.w,
            height: 200.h,
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                ceTextbold("Copy Color", fontSize: 14),
                13.verticalSpace,
                ceContainer(
                    radius: 15.h,
                    width: 54.w,
                    height: 30.h,
                    color: CEColorUtil.ceColorWithHex(color)),
                9.verticalSpace,
                ceTextbold(color, fontSize: 16),
                20.verticalSpace,
                Divider(
                  color: CEColorUtil.ceColorWithHex("#EFEFEF"),
                ),
                SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: Get.back,
                          child: Container(
                            alignment: Alignment.center,
                            child: ceTextbold("Cancel",
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      ceContainer(
                        height: 30.h,
                        width: 1,
                        color: CEColorUtil.ceColorWithHex("#EFEFEF"),
                      ),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: okAction,
                            child: Container(
                              alignment: Alignment.center,
                              child: ceTextbold("Copy",
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}

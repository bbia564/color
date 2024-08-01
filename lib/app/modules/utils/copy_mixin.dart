import 'package:bot_toast/bot_toast.dart';
import 'package:color_extractor/app/data/ce_database.dart';
import 'package:color_extractor/app/data/copy_details_model.dart';
import 'package:color_extractor/app/modules/UI/ce_dialog.dart';
import 'package:color_extractor/app/modules/utils/app_util.dart';
import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

bool vibrate = true;
mixin ColorCopyMix {
  void showCopyDialog(String color, {required DBTableName dbName}) {
    Get.dialog(
      Center(
        child: CeDialog(
          color: color,
          okAction: () {
            save(dbName, color);
          },
        ),
      ),
    );
  }

  void save(DBTableName dbName, String color) async {
    Get.back();
    final copyModel = CopyDetailsModel();
    copyModel.colorName = color;
    copyModel.time = "";
    await CEDatabaseService().insertModel(copyModel, dbTableName: dbName);
    await AppUtil.copyToClipboard(text: color);
    BotToast.showText(text: "Copy Success");
  }
}

mixin VibrateMix {
  void ceOnceVibrate() async {
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator != null && hasVibrator && vibrate) {
      Vibration.vibrate();
    } else {}
  }
}

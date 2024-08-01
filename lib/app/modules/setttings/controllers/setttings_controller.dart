import 'package:bot_toast/bot_toast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:color_extractor/app/data/ce_database.dart';
import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:color_extractor/app/modules/utils/copy_mixin.dart';
import 'package:get/get.dart';

class SetttingsController extends GetxController with VibrateMix {
  final isOn = true.obs;

  @override
  void onInit() {
    super.onInit();
    isOn.value = vibrate;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void share(){
    Share.share('check out my website https://baidu.com', subject: 'Look I am color-copyer');
  }

  void cleanData() async {
    await CEDatabaseService().cleanAll(dbTableName: DBTableName.red);
    await CEDatabaseService().cleanAll(dbTableName: DBTableName.blue);
    await CEDatabaseService().cleanAll(dbTableName: DBTableName.green);
    BotToast.showText(text: "Clear Success");
  }

  void change(bool value) async {
    isOn.value = value;
    vibrate = value;
    if (value) {
      ceOnceVibrate();
    }
  }
}

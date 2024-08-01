import 'package:color_extractor/app/data/ce_database.dart';
import 'package:color_extractor/app/data/copy_details_model.dart';
import 'package:color_extractor/app/modules/utils/constant.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final allDetails = <CopyDetailsModel>[].obs;
  final DBTableName dbName = Get.arguments["from"];
  @override
  void onInit() {
    super.onInit();
    getAllDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllDetails() async {
    allDetails.value =
        await CEDatabaseService().getAllDetails(dbTableName: dbName);
  }
}

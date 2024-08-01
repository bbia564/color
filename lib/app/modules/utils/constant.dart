import 'dart:ui';
import 'package:color_extractor/app/modules/utils/color_util.dart';

Color black_title_color = CEColorUtil.ceColorWithHex("#222222");
Color grey_text_color = CEColorUtil.ceColorWithHex("#8B8B8B");

enum DBTableName {
  red(dbName: 'copy_details_red'),
  blue(dbName: 'copy_details_blue'),
  green(dbName: 'copy_details_green');

  const DBTableName({
    required this.dbName,
  });

  final String dbName;
}

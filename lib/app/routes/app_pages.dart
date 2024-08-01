import 'package:get/get.dart';

import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/roottab/bindings/roottab_binding.dart';
import '../modules/roottab/views/roottab_view.dart';
import '../modules/setttings/bindings/setttings_binding.dart';
import '../modules/setttings/views/setttings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ROOTTAB;

  static final routes = [
    GetPage(
      name: _Paths.ROOTTAB,
      page: () => const RoottabView(),
      binding: RoottabBinding(),
    ),
    GetPage(
      name: _Paths.SETTTINGS,
      page: () => const SetttingsView(),
      binding: SetttingsBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => const DetailsView(),
      binding: DetailsBinding(),
    ),
  ];
}

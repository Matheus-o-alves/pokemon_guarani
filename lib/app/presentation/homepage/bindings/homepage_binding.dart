import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomePageController(),
    );
  }
}

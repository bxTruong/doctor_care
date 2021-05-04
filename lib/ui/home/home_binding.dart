import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  Future<void> dependencies() async{

    Get.lazyPut<HomeController>(() => HomeController());
  }
}

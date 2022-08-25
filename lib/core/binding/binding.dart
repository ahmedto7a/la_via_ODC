import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:la_via_hacthon/viwe_screen/contrrol_screen.dart';

import '../controller/cart_controller.dart';
import '../controller/home_controller.dart';
import '../controller/login_siginup_controller.dart';
import '../service/local_storge_user.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => LocalStorageUser());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ControlScreen());



  }
}
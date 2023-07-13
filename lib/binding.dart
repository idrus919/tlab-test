import 'package:get/get.dart';
import 'package:tlab_test/controller.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyController(), permanent: true);
  }
}

import 'package:get/get.dart';
import 'package:tlab_test/binding.dart';
import 'package:tlab_test/index.dart';

const myRoute = '/';

class MyRoutes {
  static final routes = [
    GetPage(
      name: myRoute,
      page: () => const MyPage(),
      binding: MyBinding(),
    ),
  ];
}

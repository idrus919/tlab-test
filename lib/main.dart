import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tlab_test/binding.dart';
import 'package:tlab_test/constans/theme.dart';
import 'package:tlab_test/route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IMDB Popular Films',
      theme: themeData,
      initialRoute: myRoute,
      initialBinding: MyBinding(),
      getPages: MyRoutes.routes,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child ?? const SizedBox(),
        );
      },
    );
  }
}

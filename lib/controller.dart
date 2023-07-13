import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tlab_test/model.dart';

class MyController extends GetxController {
  static MyController get find => Get.find();

  final movies = Rxn<List<FilmModel?>>();

  @override
  void onInit() {
    super.onInit();
    get();
  }

  Future<void> get() async {
    final response = await rootBundle.loadString('assets/movies.json');
    final data = await json.decode(response);

    List<FilmModel?> result = [];
    if (isList(data['items'])) {
      final attemp = data['items'] as List;
      result = attemp.map((f) => FilmModel.fromJson(f)).toList();
    }

    movies(result);
    movies.refresh();
  }

  static bool isList(dynamic data) {
    return (data as List?) != null && (data as List).isNotEmpty;
  }
}

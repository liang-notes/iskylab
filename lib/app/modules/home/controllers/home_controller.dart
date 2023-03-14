import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../course_gps_vector_details_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final _vectors = CourseGpsVectorDetails().obs;
  CourseGpsVectorDetails? get vectors => _vectors.value;
  @override
  void onInit() {
    super.onInit();
    loadJson();
  }

  void loadJson() async {
    log('xxxxxx====');
    String jsonData = await rootBundle.loadString('assets/models/course-gps-vector-details.json');
    Map<String, dynamic> data = json.decode(jsonData);
    _vectors.value = CourseGpsVectorDetails.fromJson(data);
    update();
    log(vectors.toString());
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

import 'package:get/get.dart';

import '../course_gps_vector_details_model.dart';

class CourseGpsVectorDetailsProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return CourseGpsVectorDetails.fromJson(map);
      if (map is List) return map.map((item) => CourseGpsVectorDetails.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<CourseGpsVectorDetails?> getCourseGpsVectorDetails(int id) async {
    final response = await get('coursegpsvectordetails/$id');
    return response.body;
  }

  Future<Response<CourseGpsVectorDetails>> postCourseGpsVectorDetails(
          CourseGpsVectorDetails coursegpsvectordetails) async =>
      await post('coursegpsvectordetails', coursegpsvectordetails);
  Future<Response> deleteCourseGpsVectorDetails(int id) async => await delete('coursegpsvectordetails/$id');
}

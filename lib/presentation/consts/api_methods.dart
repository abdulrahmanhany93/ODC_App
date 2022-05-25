import 'package:dio/dio.dart';
import 'package:odc_app/helpers/util/dio_helper.dart';

class ApiHelper {
  static Future<Response<dynamic>> enrollInCourse(int courseId, String token) {
    return DioHelper.post('courses/$courseId/enroll', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    /// method to enroll in course
  }

  static Future<Response<dynamic>> examSubmitRequest(
      int examCode, String token, List<String> answers) async {
    return DioHelper.post('exams/$examCode/submit', body: {
      'answers': answers
    }, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    /// method to submit exam
  }

  static Future<Response<dynamic>> getCategoriesRequest(String? token) {
    return DioHelper.get('categories', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    /// method to get categories
  }

  static Future<Response<dynamic>> getCoursesRequest(String? token) {
    return DioHelper.get('courses', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    /// method to get courses
  }

  static Future<Response<dynamic>> getExamRequest(
      String examCode, String token) {
    return DioHelper.get('exams/$examCode', headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    /// method to get exam
  }

  static Future<Response<dynamic>> getUserRequest(String token) {
    return DioHelper.get(
      'me',
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
    );

    /// method to get user info
  }
}

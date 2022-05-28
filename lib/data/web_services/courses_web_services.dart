import 'dart:collection';

import 'package:dio/dio.dart';
import '../../presentation/consts/api_methods.dart';
import '../../helpers/util/cach_manager.dart';

class CoursesWebServices {
  Future<LinkedHashMap<String, dynamic>> getCourses() async {
    final token = CachManager.getString('token');
    Response<dynamic> data = await ApiHelper.getCoursesRequest(token);
    return data.data;
  }
}

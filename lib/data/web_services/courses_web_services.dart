import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:odc_app/presentation/consts/api_methods.dart';
import '../../helpers/util/dio_helper.dart';
import '../../helpers/util/shared_pref.dart';

class CoursesWebServices {
  Future<LinkedHashMap<String, dynamic>> getCourses() async {
    final token = CachManager.getString('token');
    Response<dynamic> data = await ApiHelper.getCoursesRequest(token);
    return data.data;
  }
}

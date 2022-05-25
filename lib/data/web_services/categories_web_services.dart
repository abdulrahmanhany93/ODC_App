import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:odc_app/presentation/consts/api_methods.dart';
import '../../helpers/util/shared_pref.dart';

class CategoriesWebServices {
  Future<LinkedHashMap<String, dynamic>> getCategories() async {
    final token = CachManager.getString('token');
    Response<dynamic> data = await ApiHelper.getCategoriesRequest(token);
    return data.data;
  }
}

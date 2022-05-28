import 'package:dio/dio.dart';
import '../../presentation/consts/api_methods.dart';

class ExamWebServices {
  Future<dynamic> getExam(String examCode, String token) async {
    Response state = await ApiHelper.getExamRequest(examCode, token);
    return state.data;
  }
}

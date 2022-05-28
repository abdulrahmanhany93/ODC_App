import 'package:odc_app/helpers/util/cach_manager.dart';

import '../models/exam_model.dart';
import '../web_services/exam_web_services.dart';

class ExamRepository {
  final ExamWebServices examWebServices;
  List<Question> exam = [];
  ExamRepository(this.examWebServices);

  Future<List<Question>> getExam(String examCode) async {
    exam = [];
    final token = CachManager.getString('token');
    final data = await examWebServices.getExam(examCode, token.toString());
    for (var element in data['data']) {
      exam.add(Question.fromMap(element));
    }

    return exam;
  }
}

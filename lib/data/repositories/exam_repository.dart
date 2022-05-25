import '../models/exam_model.dart';
import '../web_services/exam_web_services.dart';

class ExamRepository {
  final ExamWebServices examWebServices;
  List<Question> exam = [];
  ExamRepository(this.examWebServices);

  Future<List<Question>> getExam(String examCode, String token) async {
    exam = [];
    final data = await examWebServices.getExam(examCode, token);
    for (var element in data['data']) {
      exam.add(Question.fromMap(element));
    }

    return exam;
  }
}

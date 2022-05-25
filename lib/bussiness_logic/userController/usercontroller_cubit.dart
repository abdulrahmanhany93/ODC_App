import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:odc_app/data/models/user_model.dart';
import 'package:odc_app/data/repositories/user_repository.dart';
import 'package:odc_app/presentation/consts/api_methods.dart';
import '../../data/models/exam_model.dart';
import '../../data/repositories/exam_repository.dart';
import '../../helpers/util/shared_pref.dart';

part 'usercontroller_state.dart';

class UsercontrollerCubit extends Cubit<UsercontrollerState> {
  UsercontrollerCubit(this.examRepository, this.userRepository)
      : super(UsercontrollerInitial());
  final ExamRepository examRepository;
  final UserRepository userRepository;
  String? token = CachManager.getString('token');
  User? user;
  List<Question> questions = [];
  List<String> answers = [];

  void fetchUserData() async {
    emit(FetchingUser());
    try {
      user = await userRepository.getUser(token!);
      emit(FetchedUserData());
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void enrollCourse(int courseId) async {
    emit(CourseEnrollCodeSent());
    Response state = await ApiHelper.enrollInCourse(courseId, token!);

    if (state.data['success'] == false) {
      emit(Error(state.data['message']));
    }
  }

  void fetchCourseExam(String examCode) async {
    emit(FetchingExamQuestions());
    try {
      questions = await examRepository.getExam(examCode, token!);
      emit(ExamQuestionsFetched(questions));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void submitExam(int examCode) async {
    emit(SubmitExamAnswers());
    try {
      Response state =
          await ApiHelper.examSubmitRequest(examCode, token!, answers);

      if (state.data['success'] == false) {
        emit(Error(state.data['message']));
      } else {
        emit(PassExam());
      }
    } catch (e) {
      emit(Error(e.toString()));
    }
  }
}

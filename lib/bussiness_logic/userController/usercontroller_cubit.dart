import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:odc_app/main.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/user_repository.dart';
import '../../presentation/consts/api_methods.dart';
import '../../data/models/exam_model.dart';
import '../../data/repositories/exam_repository.dart';

part 'usercontroller_state.dart';

class UsercontrollerCubit extends Cubit<UsercontrollerState> {
  UsercontrollerCubit(this.examRepository, this.userRepository)
      : super(UsercontrollerInitial());
  final ExamRepository examRepository;
  final UserRepository userRepository;
  late User user;
  List<Question> questions = [];
  List<String> answers = [];

  void fetchUserData() async {
    emit(FetchingUser());
    try {
      user = await userRepository.getUser();
      emit(FetchedUserData());
    } on DioError catch (e) {
      emit(Error(e.toString()));
    }
  }

  void enrollCourse(int courseId) async {
    emit(CourseEnrollCodeSent());
    Response state = await ApiHelper.enrollInCourse(courseId);

    if (state.data['success'] == false) {
      emit(Error(state.data['message']));
    }
  }

  void fetchCourseExam(String examCode) async {
    emit(FetchingExamQuestions());
    try {
      questions = await examRepository.getExam(examCode);
      emit(ExamQuestionsFetched(questions));
    } catch (e) {
      emit(Error(e.toString()));
    }
  }

  void submitExam(int examCode) async {
    emit(SubmitExamAnswers());
    try {
      Response state = await ApiHelper.examSubmitRequest(examCode, answers);

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

part of 'usercontroller_cubit.dart';

@immutable
abstract class UsercontrollerState {}

class UsercontrollerInitial extends UsercontrollerState {}
class FetchingUser extends UsercontrollerState {}
class FetchedUserData extends UsercontrollerState {}

class CourseEnrollCodeSent extends UsercontrollerState {}

class Error extends UsercontrollerState {
  final String msg;

  Error(this.msg);
}

class CourseEnrollCodeVerified extends UsercontrollerState {}

class FetchingExamQuestions extends UsercontrollerState {}

class ExamQuestionsFetched extends UsercontrollerState {
  final List<Question> questions;

  ExamQuestionsFetched(this.questions);
}

class SubmitExamAnswers extends UsercontrollerState {}

class PassExam extends UsercontrollerState {}

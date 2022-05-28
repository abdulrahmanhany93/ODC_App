import 'user_repository.dart';
import '../web_services/user_web_services.dart';

import 'categories_repository.dart';
import 'courses_repository.dart';
import 'exam_repository.dart';
import '../web_services/categories_web_services.dart';
import '../web_services/courses_web_services.dart';
import '../web_services/exam_web_services.dart';

class Repositories {
  static final CategoriesRepository categoriesRepository =
      CategoriesRepository(categoriesWebServices: CategoriesWebServices());
  static final CoursesRepository coursesRepository =
      CoursesRepository(coursesWebServices: CoursesWebServices());
  static final ExamRepository examRepository =
      ExamRepository(ExamWebServices());
  static final UserRepository userRepository =
      UserRepository(UserWebServices());
}

import '../models/course_model.dart';
import '../web_services/courses_web_services.dart';

class CoursesRepository {
  final CoursesWebServices coursesWebServices;
  List<CourseModel> courses = [];
  CoursesRepository({
    required this.coursesWebServices,
  });
  Future<List<CourseModel>> getCategories() async {
    final data = await coursesWebServices.getCourses();
    courses = [];
    for (var course in data['data']) {
      courses.add(CourseModel.fromMap(course));
    }
    return courses;
  }
}

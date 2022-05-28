
import 'package:odc_app/data/models/courses_model.dart';

import '../web_services/courses_web_services.dart';

class CoursesRepository {
  final CoursesWebServices coursesWebServices;
  List<CoursesModel> courses = [];
  CoursesRepository({
    required this.coursesWebServices,
  });
  Future<List<CoursesModel>> getCategories() async {
    final data = await coursesWebServices.getCourses();
    courses = [];
    for (var course in data['data']) {
      courses.add(CoursesModel.fromMap(course));
    }
    return courses;
  }
}

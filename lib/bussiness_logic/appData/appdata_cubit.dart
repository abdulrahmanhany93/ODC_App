import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/category_model.dart';
import '../../data/models/course_model.dart';
import '../../data/repositories/categories_repository.dart';
import '../../data/repositories/courses_repository.dart';

part 'appdata_state.dart';

class AppdataCubit extends Cubit<AppdataState> {
  AppdataCubit(this.categoriesRepository, this.coursesRepository)
      : super(AppdataInitial());
  List<CategoryModel> categories = [];
  List<CourseModel> courses = [];
  final CategoriesRepository categoriesRepository;
  final CoursesRepository coursesRepository;
  void fetchData() async {
    emit(FetchingData());
    try {
      categories = await categoriesRepository.getCategories();
      courses = await coursesRepository.getCategories();
      emit(DataFetched());
    } catch (e) {
      emit(DataFetchError());
    }
  }
}

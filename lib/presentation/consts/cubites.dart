import '../../bussiness_logic/appData/appdata_cubit.dart';
import '../../bussiness_logic/authentication/auth_cubit.dart';
import '../../bussiness_logic/userController/usercontroller_cubit.dart';
import '../../data/repositories/const.dart';

final AuthCubit authCubit = AuthCubit();
final AppdataCubit appdataCubit = AppdataCubit(
    Repositories.categoriesRepository, Repositories.coursesRepository);

final UsercontrollerCubit usercontrollerCubit = UsercontrollerCubit(
    Repositories.examRepository, Repositories.userRepository);

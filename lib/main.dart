import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app_router.dart';
import 'bussiness_logic/observer/bloc_observer.dart';
import 'helpers/util/shared_pref.dart';
import 'presentation/consts/cubites.dart';
import 'package:sizer/sizer.dart';

String? userToken;
String? userRefreshToken;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachManager.initialize();
  buildRunZone();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) => MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.generateRoute));
  }
}

buildRunZone() {
  return BlocOverrides.runZoned(() {
    authCubit;
    appdataCubit;
    usercontrollerCubit;
  }, blocObserver: MyBlocObserver());
}

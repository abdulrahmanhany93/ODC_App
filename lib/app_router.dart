import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/data/models/course_Model.dart';
import 'data/models/args_model.dart';
import 'data/models/category_model.dart';

import 'helpers/transitions/fade_transition.dart';
import 'presentation/consts/cubites.dart';
import 'presentation/consts/routes.dart';
import 'presentation/pages/accessPages/forget_password_page.dart';
import 'presentation/pages/accessPages/login_page.dart';
import 'presentation/pages/accessPages/new_password_page.dart';
import 'presentation/pages/accessPages/onboarding_page.dart';
import 'presentation/pages/accessPages/privacy_policy_page.dart';
import 'presentation/pages/accessPages/signup_page.dart';
import 'presentation/pages/accessPages/verify_email_page.dart';
import 'presentation/pages/mainPages/home/categorie_page.dart';
import 'presentation/pages/mainPages/home/categories_page.dart';
import 'presentation/pages/mainPages/home/courses_page.dart';
import 'presentation/pages/mainPages/myCourses/coruse_question_page.dart';
import 'presentation/pages/mainPages/myCourses/course_exam_page.dart';
import 'presentation/pages/mainPages/myCourses/my_course_details_page.dart';
import 'presentation/pages/mainPages/navigation_center.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingPage:
        return MaterialPageRoute(builder: (__) => const OnBoardingPage());
      case logInPage:
        return PageTransition.fade(
            widget: BlocProvider.value(
          value: authCubit,
          child: const LogInPage(),
        ));
      case privacyPolicyPage:
        return PageTransition.fade(widget: const PrivacyPolicyPage());
      case forgotPasswordPage:
        return MaterialPageRoute(
            builder: (__) => BlocProvider(
                  create: (context) => authCubit,
                  child: const ForgetPasswordPage(),
                ));
      case newPasswordPage:
        return MaterialPageRoute(
            builder: (__) => BlocProvider(
                  create: (context) => authCubit,
                  child: const NewPasswordPage(),
                ));
      case verifyEmailPage:
        return MaterialPageRoute(
            builder: (__) => BlocProvider(
                  create: (context) => authCubit,
                  child: const VerifyEmailPage(),
                ));
      case signUpPage:
        return MaterialPageRoute(
            builder: (__) => BlocProvider(
                  create: (context) => authCubit,
                  child: const SignUpPage(),
                ));
      case navigationCenter:
        return MaterialPageRoute(
            builder: (__) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: appdataCubit..fetchData(),
                    ),
                    BlocProvider.value(
                      value: usercontrollerCubit,
                    ),
                  ],
                  child: const NavigationCenter(),
                ));
      case allCategoriesPage:
        return MaterialPageRoute(
            builder: (__) => CategoriesPage(
                  categories: settings.arguments as List<CategoryModel>,
                ));
      case categoryPage:
        return MaterialPageRoute(
            builder: (__) => CategoryPage(
                  category: settings.arguments as CategoryModel,
                ));
      case coursesPage:
        return MaterialPageRoute(builder: (__) => const CoursesPage());
      case courseDetailsPage:
        return MaterialPageRoute(
            builder: (__) => CourseDetailsPage(
                  course: settings.arguments as CourseModel,
                ));
      case courseExamPage:
        return MaterialPageRoute(
            builder: (__) => BlocProvider.value(
                  value: usercontrollerCubit,
                  child: const CourseExamPage(),
                ));
      case courseQuestionPage:
        return MaterialPageRoute(
            builder: (__) =>
                CourseQuestionPage(args: settings.arguments as ArgsModel));

      default:
        return MaterialPageRoute(builder: (__) => const OnBoardingPage());
    }
  }
}

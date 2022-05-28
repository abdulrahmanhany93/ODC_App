import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_app/main.dart';
import '../../widgets/main_widgets/my_button.dart';
import '../../widgets/main_widgets/my_form.dart';
import '../../widgets/main_widgets/my_text.dart';
import '../../../bussiness_logic/authentication/auth_cubit.dart';
import '../../../helpers/util/cach_manager.dart';
import '../../consts/colors.dart';
import '../../consts/controllers.dart';
import '../../consts/cubites.dart';
import '../../consts/fixed_variables.dart';
import '../../consts/methods.dart';
import '../../consts/routes.dart';
import '../../consts/strings.dart';

import 'package:sizer/sizer.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        if (state is LogInAuthenticated) {
          await assignTokenToCache(state, context);
        } else if (state is AuthenticationError) {
          showErrorMsg(state.message);
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            buildOrangeCorner(isTop: true),
            buildOrangeCorner(isTop: false),
            buildLogo(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 2.h),
                  buildAccessTitle(title1: 'Welcome, ', title2: 'Back!'),
                  MyText('Log In',
                      fontSize: 15.sp,
                      height: -0.02.h,
                      fontWeight: FontWeight.bold,
                      color: MyColors.lightBlack),
                  ...buildLogInForms(context),
                  buildLogInButton(),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, signUpPage),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          2,
                          (index) => MyText(
                            isFirstItem(index)
                                ? 'Don’t Have an Account?  '
                                : 'Sign Up',
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: isFirstItem(index)
                                ? Colors.black
                                : MyColors.orange,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> assignTokenToCache(
      LogInAuthenticated state, BuildContext context) async {
    userToken = state.data['data']['access_token'];
    userRefreshToken = state.data['data']['refresh_token'];
    await CachManager.setString('token', userToken.toString());
    await CachManager.setString('refreshToken', userRefreshToken.toString())
        .then((value) => Navigator.pushNamed(context, navigationCenter));
  }

  MyButton buildLogInButton() {
    return MyButton(
      color: MyColors.orange,
      title: 'Log In',
      onTap: () => authCubit.basicLogIn({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );
  }

  List<Widget> buildLogInForms(BuildContext context) {
    return List.generate(
        2,
        (index) => MyForm(
              title: FixedVariables.logInRequirments.keys.elementAt(index + 1),
              color: MyColors.hardGrey,
              hasIcon: false,
              additionalText: !isFirstItem(index) ? 'Forget Password ?' : '',
              onTap: () => Navigator.pushNamed(context, forgotPasswordPage),
              controller:
                  FixedVariables.logInRequirments.values.elementAt(index + 1),
            ));
  }

  Positioned buildLogo() {
    return Positioned(
      top: 10.h,
      width: 20.w,
      left: 10.w,
      child: Image.asset(
        odcLogo1,
        alignment: Alignment.centerLeft,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_button.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_form.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_text.dart';
import '../../../bussiness_logic/authentication/auth_cubit.dart';
import '../../../helpers/util/shared_pref.dart';
import '../../consts/colors.dart';
import '../../consts/controllers.dart';
import '../../consts/cubites.dart';
import '../../consts/methods.dart';
import '../../consts/routes.dart';
import '../../consts/strings.dart';

import 'package:sizer/sizer.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthenticationError) {
          Fluttertoast.showToast(
              msg: state.message, backgroundColor: MyColors.orange);
        } else if (state is PasswordReset) {
          CachManager.setString('token', state.data['data']['access_token']);
          CachManager.setString(
              'refreshToken', state.data['data']['refresh_token']);
          Navigator.pushReplacementNamed(context, logInPage);
        }
      },
      child: Scaffold(
        appBar: basicAppBar(context, 'Create New Password'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Image.asset(
                  newPasswordImage,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 3.h),
                title: MyText(
                  'Enter your new Password',
                  fontSize: 11.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              MyForm(
                controller: newPasswordController,
                title: 'New Password',
                color: MyColors.hardGrey,
                hasIcon: false,
              ),
              SizedBox(
                height: 3.h,
              ),
              MyForm(
                controller: confirmPasswordController,
                title: 'Confirm Password',
                color: MyColors.hardGrey,
                hasIcon: false,
              ),
              SizedBox(
                height: 3.h,
              ),
              MyButton(
                color: MyColors.orange,
                title: 'Submit',
                width: 20.w,
                onTap: () {
                  // Navigator.pushNamed(context, newPasswordPage);
                  if (newPasswordController.text ==
                      confirmPasswordController.text) {
                    authCubit.setNewPassword(emailController.text,
                        pinCodeController.text, newPasswordController.text);
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Passwords do not match',
                        backgroundColor: MyColors.orange);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

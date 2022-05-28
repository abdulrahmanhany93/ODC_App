import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bussiness_logic/authentication/auth_cubit.dart';
import '../../consts/colors.dart';
import '../../consts/cubites.dart';
import '../../consts/routes.dart';
import '../../widgets/main_widgets/my_button.dart';
import '../../widgets/main_widgets/my_text.dart';
import '../../widgets/main_widgets/my_button.dart';
import '../../widgets/main_widgets/my_text.dart';
import '../../widgets/main_widgets/my_form.dart';
import '../../consts/controllers.dart';
import '../../consts/strings.dart';

import 'package:sizer/sizer.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is EmailSent) {
          Navigator.of(context).pushNamed(verifyEmailPage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 15.sp,
                color: Colors.black,
              ),
            ),
          ),
          title: MyText(
            'Forget Password',
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Image.asset(
                  forgotPasswordImage,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 3.h),
                title: MyText(
                  'Please enter your email address to\n recieve vervication code',
                  fontSize: 11.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              MyForm(
                controller: emailController,
                title: 'E-mail',
                color: MyColors.hardGrey,
                hasIcon: false,
              ),
              SizedBox(
                height: 3.h,
              ),
              MyButton(
                color: MyColors.orange,
                title: 'Send',
                onTap: () => authCubit.forgetPassword(emailController.text),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_app/presentation/widgets/main_widgets/pin_code_widget.dart';
import '../../../bussiness_logic/authentication/auth_cubit.dart';
import '../../consts/colors.dart';
import '../../consts/cubites.dart';
import '../../consts/methods.dart';
import '../../consts/routes.dart';
import '../../widgets/main_widgets/my_button.dart';
import '../../widgets/main_widgets/my_text.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_button.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_text.dart';
import '../../consts/controllers.dart';
import '../../consts/strings.dart';

import 'package:sizer/sizer.dart';

class VerifyEmailPage extends StatelessWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is OtpVerified) {
          Navigator.pushNamed(context, newPasswordPage);
        } else if (state is AuthenticationError) {
          Fluttertoast.showToast(
              msg: state.message, backgroundColor: MyColors.orange);
        }
      },
      child: Scaffold(
        appBar: basicAppBar(context, 'Verify Your Email'),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Image.asset(
                  verifyEmailImage,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 3.h),
                title: MyText(
                  'please enter the 4-digit code sent to',
                  fontSize: 11.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  height: 0.3.h,
                ),
                subtitle: MyText(
                  emailController.text,
                  fontSize: 11.sp,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w700,
                  color: MyColors.orange,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                child: PinCodeWidget(controller: pinCodeController),
              ),
              MyButton(
                color: MyColors.orange,
                title: 'Verify',
                width: 20.w,
                onTap: () {
                  // Navigator.pushNamed(context, newPasswordPage);
                  authCubit.otpCheck(
                      emailController.text, pinCodeController.text);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

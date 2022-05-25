import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:odc_app/presentation/widgets/main_widgets/signup_forms.dart';
import '../../../bussiness_logic/authentication/auth_cubit.dart';
import '../../../data/models/register_model.dart';
import '../../consts/colors.dart';
import '../../consts/cubites.dart';
import '../../consts/methods.dart';
import '../../consts/routes.dart';
import '../../widgets/main_widgets/my_button.dart';
import '../../widgets/main_widgets/my_check_box_title.dart';
import '../../widgets/main_widgets/my_text.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_button.dart';
import 'package:odc_app/presentation/widgets/main_widgets/my_text.dart';

import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

bool privacyChecked = false;

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildOrangeCorner(isTop: true),
          buildOrangeCorner(isTop: false),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildAccessTitle(title1: 'Hello, ', title2: 'Friend!'),
                MyText('Sign Up',
                    fontSize: 15.sp,
                    height: 0.2.h,
                    fontWeight: FontWeight.bold,
                    color: MyColors.lightBlack),
                buildSignUpForms(),
                MyCheckBoxTitle(
                  privacyChecked: privacyChecked,
                  title1: 'Do you agree to our ',
                  title2: 'Privacy Policy',
                  ontap: (value) {
                    setState(() {
                      privacyChecked = value!;
                    });
                  },
                ),
                buildsignUpButton(),
                buildLoginText(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildLoginText(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, logInPage),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            2,
            (index) => MyText(
              isFirstItem(index) ? 'Already Have an Account?  ' : 'Login',
              height: 0.2.h,
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: isFirstItem(index) ? Colors.black : MyColors.orange,
            ),
          )
        ],
      ),
    );
  }

  BlocListener buildsignUpButton() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.pushReplacementNamed(context, logInPage);
        } else if (state is AuthenticationError) {
          Fluttertoast.showToast(
              msg: state.message, backgroundColor: MyColors.orange);
        }
      },
      child: MyButton(
        color: MyColors.orange,
        width: 20.w,
        title: 'Sign Up',
        onTap: () => authCubit.signUp(RegisterModel.createNewUser().toMap()),
      ),
    );
  }

  Expanded buildSignUpForms() {
    return const Expanded(
      child: SignUpForms(),
    );
  }
}

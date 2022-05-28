import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../helpers/util/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp(Map<String, dynamic>? registerDetails) async {
    emit(Authenticating());
    Response<dynamic> auth =
        await DioHelper.post('registernew', body: registerDetails);
    if (auth.data['success'] == true) {
      emit(SignUpSuccess());
    } else {
      emit(AuthenticationError(auth.data.toString()));
    }
  }

  void basicLogIn(Map<String, dynamic>? registerDetails) async {
    emit(Authenticating());
    Response<dynamic> auth =
        await DioHelper.post('login', body: registerDetails);
    if (auth.data['success'] == true) {
      emit(LogInAuthenticated(auth.data));
    } else {
      emit(AuthenticationError(auth.data['message'].toString()));
    }
  }

  void forgetPassword(String email) async {
    emit(Authenticating());
    Response<dynamic> auth =
        await DioHelper.post('forgetPassword', body: {'email': email});
    if (auth.data['success'] == false) {
      emit(AuthenticationError(auth.data['message'].toString()));
    } else {
      emit(EmailSent());
    }
  }

  void otpCheck(String email, String otp) async {
    emit(Authenticating());
    Response<dynamic> auth =
        await DioHelper.post('verifyOtp', body: {'email': email, 'otp': otp});
    if (auth.data['success'] == false) {
      emit(AuthenticationError(auth.data['message'].toString()));
    } else {
      emit(OtpVerified());
    }
  }

  void setNewPassword(String email, String otp, String password) async {
    emit(Authenticating());
    Response<dynamic> auth = await DioHelper.post('resetPassword',
        body: {'email': email, 'otp': otp, 'password': password});
    if (auth.data['success'] == false) {
      emit(AuthenticationError(auth.data['message'].toString()));
    } else {
      emit(PasswordReset(auth.data));
    }
  }

  // void logInViaToken(String token, String refreshToken) async {
  //   Response<dynamic> auth = await DioHelper.post(
  //     'login',

  //   );
  // }
}

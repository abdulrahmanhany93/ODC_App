import '../../presentation/consts/api_methods.dart';

class UserWebServices {
  Future<dynamic> getUser(String token) async {
    final response = await ApiHelper.getUserRequest(token);
    print(response);
    return response.data;
  }
}

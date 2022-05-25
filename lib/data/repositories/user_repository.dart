import 'package:odc_app/data/models/user_model.dart';
import 'package:odc_app/data/web_services/user_web_services.dart';

class UserRepository {
  final UserWebServices userWebServices;

  UserRepository(this.userWebServices);
  Future<User> getUser(String token) async {
    final user = await userWebServices.getUser(token);
   
    return User.fromMap(user['data']['student']);
  }
}

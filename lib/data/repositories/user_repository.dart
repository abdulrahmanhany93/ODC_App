import 'package:odc_app/helpers/util/cach_manager.dart';

import '../models/user_model.dart';
import '../web_services/user_web_services.dart';

class UserRepository {
  final UserWebServices userWebServices;

  UserRepository(this.userWebServices);
  Future<User> getUser() async {
    final token = CachManager.getString('token');
    final user = await userWebServices.getUser(token.toString());

    return User.fromMap(user['data']['student']);
  }
}

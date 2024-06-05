import 'package:flutter_application_diamond_shop_final/data/models/home.dart';
import 'package:flutter_application_diamond_shop_final/data/models/user.dart';
import 'package:flutter_application_diamond_shop_final/utils/http_client.dart';

class HomeService {
  Future<HomeModel> getGeneralInfo() async {
    var response = await httpClient.get('home');
    return HomeModel.fromJson(response.data);
  }

  Future<User> getUserInfo() async {
    var response = await httpClient.get('users/me');
    return User.fromJson(response.data);
  }
}

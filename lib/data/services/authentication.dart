import 'package:flutter_application_diamond_shop_final/data/models/authentication.dart';
import 'package:flutter_application_diamond_shop_final/utils/http_client.dart';

class AuthenticationServise {
  Future<void> register(Authentication authentication) async {
    await httpClient.post('accounts/signup', data: authentication.toJson());
  }

  Future<Authentication> Login(Authentication authentication) async {
    var response =
        await httpClient.post('accounts/login', data: authentication.toJson());
    return Authentication.fromJson(response.data);
  }
}

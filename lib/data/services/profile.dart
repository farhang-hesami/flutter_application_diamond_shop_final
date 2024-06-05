import 'package:flutter_application_diamond_shop_final/data/models/user.dart';
import 'package:flutter_application_diamond_shop_final/utils/http_client.dart';

class ProfileService {
  Future<List<UserComments>> getUserComments() async {
    List<UserComments> userComments = [];

    var response = await httpClient.get('users/me/comments');
    for (var comment in response.data) {
      userComments.add(UserComments.fromJson(comment));
    }
    return userComments;
  }
}

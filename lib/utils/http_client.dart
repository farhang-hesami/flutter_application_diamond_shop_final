import 'package:dio/dio.dart';
import 'package:flutter_application_diamond_shop_final/main.dart';
import 'package:flutter_application_diamond_shop_final/screens/authentication/authentication.dart';
import 'package:flutter_application_diamond_shop_final/utils/navigator.dart';
import 'package:flutter_application_diamond_shop_final/utils/snackbar.dart';

Dio httpClient = Dio(
  BaseOptions(
    baseUrl: 'https://flutter.vesam24.com/api/',
  ),
)..interceptors.add(InterceptorsWrapper(
    onError: (error, handler) async {
      if (error.response!.statusCode == 401) {
        await prefs.remove('token');
        isLogin.value = false;
        goScreen(
          context: navigatorKey.currentContext!,
          screen: const AuthenticationScreen(),
          fullScreen: true,
        );
      } else if (error.response?.data['errors']) {
        var errors = error.response?.data['errors'] as Map<String, dynamic>;
        if (errors.isNotEmpty) {
          showCustomAlert(
            navigatorKey.currentContext!,
            errors.values.first[0].toString(),
            AlertType.error,
          );
        }
      } else {
        showCustomAlert(
          navigatorKey.currentContext!,
          'Error...!',
          AlertType.error,
        );
      }
      throw Exception();
    },
    onRequest: (options, handler) {
      String? userToken = prefs.getString('token');
      if (userToken != null) {
        options.headers['Authorization'] = 'Bearer $userToken';
      }
      handler.next(options);
    },
  ));

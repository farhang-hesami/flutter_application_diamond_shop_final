import 'package:bloc/bloc.dart';
import 'package:flutter_application_diamond_shop_final/data/models/authentication.dart';
import 'package:flutter_application_diamond_shop_final/data/services/authentication.dart';
import 'package:flutter_application_diamond_shop_final/data/services/home.dart';
import 'package:flutter_application_diamond_shop_final/main.dart';
import 'package:flutter_application_diamond_shop_final/screens/home/bloc/home_bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationServise authenticationServise;
  final HomeService homeService;
  AuthenticationBloc(this.authenticationServise, this.homeService)
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      ////LOGIN
      if (event is LoginButtonClicked) {
        emit(LoginLoading());
        try {
          var response =
              await authenticationServise.Login(event.authentication);

          if (response.accessToken != null) {
            await prefs.setString('token', response.accessToken!);
            currentUser = await homeService.getUserInfo();
            isLogin.value = true;
          }
          emit(LoginSuccess(response.accessToken!));
        } catch (e) {
          emit(LoginError('Error...!'));
        }
      }
      ////REGISTER
      if (event is RegisterButtonClicked) {
        emit(RegisterLoading());

        try {
          await authenticationServise.register(event.authentication);
          emit(RegisterSuccess());
        } catch (e) {
          emit(RegisterError('Error...!'));
        }
      }
    });
  }
}

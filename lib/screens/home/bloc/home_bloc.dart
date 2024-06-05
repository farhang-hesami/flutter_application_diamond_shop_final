import 'package:bloc/bloc.dart';
import 'package:flutter_application_diamond_shop_final/data/models/home.dart';
import 'package:flutter_application_diamond_shop_final/data/models/user.dart';
import 'package:flutter_application_diamond_shop_final/data/services/home.dart';
import 'package:flutter_application_diamond_shop_final/main.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

User? currentUser;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeService homeService;
  HomeBloc(this.homeService) : super(HomeInitial()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is HomeScreenStarted) {
          emit(HomeLoading());
          try {
            var response = await homeService.getGeneralInfo();
            if (isLogin.value) {
              currentUser = await homeService.getUserInfo();
            }
            emit(HomeSuccess(response));
          } catch (e) {
            emit(
              HomeError('Error...!'),
            );
          }
        }
      },
    );
  }
}

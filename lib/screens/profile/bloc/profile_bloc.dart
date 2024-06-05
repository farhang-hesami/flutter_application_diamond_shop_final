import 'package:bloc/bloc.dart';
import 'package:flutter_application_diamond_shop_final/data/models/user.dart';
import 'package:flutter_application_diamond_shop_final/data/services/profile.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileService profileService;
  ProfileBloc(this.profileService) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      ///Comments
      if (event is UserCommentsScreenStarted) {
        emit(UserCommentsLoading());
        try {
          var response = await profileService.getUserComments();
          emit(UserCommentsSuccess(response));
        } catch (e) {
          emit(
            UserCommentsError(error: 'Error...!'),
          );
        }
      }
    });
  }
}

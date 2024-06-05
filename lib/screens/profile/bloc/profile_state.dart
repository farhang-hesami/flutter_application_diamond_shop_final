part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

///comments
class UserCommentsSuccess extends ProfileState {
  final List<UserComments> userComments;
  UserCommentsSuccess(this.userComments);
}

class UserCommentsLoading extends ProfileState {}

class UserCommentsError extends ProfileState {
  final String error;
  UserCommentsError({required this.error});
}

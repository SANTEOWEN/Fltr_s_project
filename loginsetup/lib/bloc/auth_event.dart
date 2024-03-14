part of 'auth_bloc.dart';

//This class holds up all of the events like inputing some text's on input fields or clicks
/*All of the events here are */

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({
    required this.email,
    required this.password,
  });
}

final class AuthLogoutRequested extends AuthEvent {}

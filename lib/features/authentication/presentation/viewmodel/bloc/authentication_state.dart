part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}
final class LoaderState extends AuthenticationState {}
final class RegisterSuccess extends AuthenticationState {}
final class RegisterFailure extends AuthenticationState {
 final String error;

  RegisterFailure({required this.error});

}
final class LoginSuccess extends AuthenticationState {}
final class LoginFailure extends AuthenticationState {
 final String error;

 LoginFailure({required this.error});

}

part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {}
class RegisterEvent extends AuthenticationEvent{
 final UserEntity user;

  RegisterEvent({required this.user});

  @override
  List<Object?> get props => [user];

}
class LoginEvent extends AuthenticationEvent{
 final UserEntity user;

 LoginEvent({required this.user});

 @override
 List<Object?> get props => [user];

}
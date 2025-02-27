import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid,name, email, password;

  const UserEntity( {required this.uid,required this.name, required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [name, email, password];
}

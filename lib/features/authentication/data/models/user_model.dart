import 'package:hive_flutter/adapters.dart';

import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart'; // الربط مع الملف المولد تلقائياً

@HiveType(typeId: 0)
class UserModel extends UserEntity {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String uid;

  const UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.uid,
  }) : super(name: name, email: email, password: password, uid: uid);
  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
    );
  }
  @override
  String toString() {
    return 'UserModel{name: $name, email: $email, password: $password, uid: $uid}';
  }
}
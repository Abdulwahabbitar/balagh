import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/user_entity.dart';

abstract class LoginContract {
  Future<Either<Failure, void>> login(UserEntity user);
}
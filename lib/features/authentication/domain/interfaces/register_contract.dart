import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../entities/user_entity.dart';

abstract class RegisterContract {
  Future<Either<Failure, void>> register(UserEntity user);
}
import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/interfaces/login_contract.dart';
import '../datasources/login_datasource.dart';
import '../models/user_model.dart';

class LoginRepository extends LoginContract {
  final LoginDatasource loginDatasource;

  LoginRepository({required this.loginDatasource});

  @override
  Future<Either<Failure, void>> login(UserEntity user) async {
    try {
      UserModel userModel = UserModel(
        email: user.email,
        password: user.password,
        name: user.name,
        uid: user.uid,
      );

      // استخدام الداتا سورس مع UserModel ومعالجة الـ Either
      final result = await loginDatasource.login(userModel);

      // معالجة النتيجة باستخدام fold
      return result.fold(
            (failure) => Left(failure), // إذا كان Left، أعد الفشل
            (_) => Right(null),         // إذا كان Right، أعد النجاح
      );
    } catch (error) {
      return Left(FailureError(error: error.toString())); // فشل مع رسالة الخطأ
    }
  }
}

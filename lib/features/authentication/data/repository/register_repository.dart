import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/interfaces/register_contract.dart';
import '../datasources/register_datasource.dart';
import '../models/user_model.dart';

class RegisterRepository extends RegisterContract {
  final RegisterDatasource registerDatasource;

  RegisterRepository({required this.registerDatasource});

  @override
  Future<Either<Failure, void>> register(UserEntity user) async {
    try {
      UserModel userModel = UserModel(
        email: user.email,
        password: user.password,
        name: user.name,
        uid: user.uid,
      );

      // استخدام الداتا سورس مع UserModel ومعالجة الـ Either
      final result = await registerDatasource.register(userModel);

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

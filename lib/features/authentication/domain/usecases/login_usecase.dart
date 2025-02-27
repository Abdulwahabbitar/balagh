import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../interfaces/login_contract.dart';

class LoginUseCase extends UseCase<void,UserEntity> {
  final LoginContract loginContract;

  LoginUseCase({required this.loginContract});
  @override
  Future<Either<Failure, void>> call(UserEntity params) async{
    return await loginContract.login(params);


  }

}
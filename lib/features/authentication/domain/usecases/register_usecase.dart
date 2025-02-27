import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../interfaces/register_contract.dart';

class RegisterUseCase extends UseCase<void,UserEntity> {
  final RegisterContract registerContract;

  RegisterUseCase({required this.registerContract});
  @override
  Future<Either<Failure, void>> call(UserEntity params) async{
    return await registerContract.register(params);


  }
  
}
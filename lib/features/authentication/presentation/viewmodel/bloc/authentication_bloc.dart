import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../domain/usecases/register_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  AuthenticationBloc(this.registerUseCase,this.loginUseCase) : super(AuthenticationInitial()) {
    on<RegisterEvent>(onRegister);
    on<LoginEvent>(onLogin);
  }
   onRegister(RegisterEvent event, Emitter<AuthenticationState> emit)async{
     emit(LoaderState());

     final result = await registerUseCase(event.user);
     result.fold(
             (failure) {
           // في حالة الفشل
           emit(RegisterFailure(error:  failure.error));
         },
     (_) {
       // في حالة النجاح
       emit(RegisterSuccess());
     });

  }
  onLogin(LoginEvent event, Emitter<AuthenticationState> emit)async{
    emit(LoaderState());

    final result = await loginUseCase(event.user);
    result.fold(
            (failure) {
          // في حالة الفشل
          emit(LoginFailure(error:  failure.error));
        },
            (_) {
          // في حالة النجاح
          emit(LoginSuccess());
        });

  }
}

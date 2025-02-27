import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/authentication/presentation/view/register_screen.dart';

import '../../../../core/utils/theme/theme_widgets/gradient_background.dart';
import '../../domain/entities/user_entity.dart';
import '../viewmodel/bloc/authentication_bloc.dart';
import '../widgets/background_curve_painter.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/foreground_curve_painter.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static String route = 'LoginScreen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if(state is LoginSuccess){
        }
        if(state is LoginFailure){
          print('************************');
          print(state.error);
        }      },
      child: GradientBackground(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Image.asset(
                    'assets/images/balagh.png',
                    height: 150,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                      child: Text("رقم الموبايل",style: Theme.of(context).textTheme.bodyMedium,)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomTextField(
                        controller: emailController,
                        hintText: '9639876543210+',
                        icon: Icons.email_outlined),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text("كلمة المرور",style: Theme.of(context).textTheme.bodyMedium,)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: CustomTextField(
                        controller: passwordController,
                        hintText: '********',
                        icon: Icons.lock_outline_rounded),
                  ),


                  SizedBox(
                    height: 4,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'هل نسيت كلمة المرور؟',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(text: 'تسجيل الدخول ', onTap: (){}),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(text: 'تسجيل حساب جديد ', onTap: (){},backgroundColor: Theme.of(context).scaffoldBackgroundColor,textColor: Theme.of(context).textTheme.titleMedium?.color),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

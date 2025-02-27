import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/features/authentication/presentation/view/register_screen.dart';

import '../../domain/entities/user_entity.dart';
import '../viewmodel/bloc/authentication_bloc.dart';
import '../widgets/background_curve_painter.dart';
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
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomPaint(
                painter: BackgroundCurvePainter(),
                child: CustomPaint(
                  painter: ForegroundCurvePainter(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      Image.asset('assets/images/Preview.png', height: 150),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CustomTextField(
                            controller: emailController,
                            labelText: 'Email',
                            icon: Icons.email_outlined),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CustomTextField(
                            controller: passwordController,
                            labelText: 'Password',
                            icon: Icons.lock_outline_rounded),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          // (confirmPasswordController.text ==
                          //     passwordController.text)
                          //     &&
                          //     (state is AuthenticationInitial) ||
                          //     (state is RegisterFailure)
                          BlocProvider.of<AuthenticationBloc>(context).add(
                              LoginEvent(
                                  user: UserEntity(
                                      name: '',
                                      email: emailController.text,
                                      password: passwordController.text,
                                      uid: '')));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 60,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Theme.of(context).colorScheme.secondary
                                ],
                                // الألوان التي تريد استخدامها في التدرج
                                begin: Alignment.topLeft,
                                // نقطة البداية للتدرج
                                end: Alignment
                                    .bottomRight, // نقطة النهاية للتدرج
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              'Login',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Spacer(
                            flex: 3,
                          ),
                          Text(
                            'New user?',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          BlocBuilder<AuthenticationBloc,
                              AuthenticationState>(
                            builder: (context, state) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(RegisterScreen.route);
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium,
                                  ));
                            },
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        children: [
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Divider(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                              )),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'or',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Divider(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withOpacity(0.5),
                              )),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Image.asset(
                            'assets/images/facebook.png',
                            width: 50,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Image.asset(
                            'assets/images/google.png',
                            width: 50,
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

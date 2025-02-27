import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_entity.dart';
import '../viewmodel/bloc/authentication_bloc.dart';
import '../widgets/background_curve_painter.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/foreground_curve_painter.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  static String route = 'RegisterScreen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        print('000000000$state');
        if (state is RegisterFailure) {
          print('message ${state.error}');
        }
      },
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
                      Image.asset(
                        'assets/images/Preview.png',
                        height: 150,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CustomTextField(
                            controller: nameController,
                            hintText: 'Name',
                            icon: Icons.person_2_outlined),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CustomTextField(
                            controller: emailController,
                            hintText: 'Email',
                            icon: Icons.email_outlined),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CustomTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            icon: Icons.lock_outline_rounded),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: CustomTextField(
                            controller: confirmPasswordController,
                            hintText: 'Confirm Password',
                            icon: Icons.lock_outline_rounded),
                      ),
                      SizedBox(
                        height: 26,
                      ),
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              if (
                                  // (confirmPasswordController.text ==
                                  //     passwordController.text)
                                  //     &&
                                  //     (state is AuthenticationInitial) ||
                                  //     (state is RegisterFailure)
                                  true) {
                                print(nameController.text);
                                BlocProvider.of<AuthenticationBloc>(context)
                                    .add(RegisterEvent(
                                        user: UserEntity(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            uid: '')));
                              } else {
                                print('not match password');
                              }
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
                                child: state is LoaderState
                                    ? CircularProgressIndicator(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      )
                                    : Text(
                                        'Sign up',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                              ),
                            ),
                          );
                        },
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
                            'Do you already have an account?',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(LoginScreen.route);
                              },
                              child: Text(
                                'Sign in',
                                style: Theme.of(context).textTheme.bodyMedium,
                              )),
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

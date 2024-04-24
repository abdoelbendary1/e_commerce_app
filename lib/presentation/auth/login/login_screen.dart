import 'package:e_commerce_app/presentation/auth/login/widgets/login_body.dart';
import 'package:e_commerce_app/presentation/auth/signUp/sign_up._screen.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String routeName = "login_screen";
  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: LoginBody(
          emailController: emailController,
          passwordController: passwordController,
          formKey: formKey,
          buttonFunction: () {
            Navigator.of(context).pushNamed(SignUpScreen.routeName);
          },
        ));
  }
}

import 'package:e_commerce_app/presentation/auth/signUp/cubit/signup_view_model.dart';
import 'package:e_commerce_app/presentation/auth/signUp/widgets/signup_body.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const String routeName = "signup_screen";
  SignUpViewModel signUpViewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SignUpBody(
          formKey: signUpViewModel.formKey,
          fullnameController: signUpViewModel.fullnameController,
          mobileNoController: signUpViewModel.mobileNoController,
          emailController: signUpViewModel.emailController,
          passwordController: signUpViewModel.passwordController,
          confirPasswordController: signUpViewModel.confirmPasswordController,
          isObsecure: signUpViewModel.isObsecure,
          buttonFunction: signUpViewModel.signUp,
        ));
  }
}

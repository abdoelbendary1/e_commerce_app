import 'package:e_commerce_app/presentation/auth/login/cubit/login_state.dart';
import 'package:e_commerce_app/presentation/auth/login/cubit/login_view_model.dart';
import 'package:e_commerce_app/presentation/auth/login/widgets/login_body.dart';
import 'package:e_commerce_app/presentation/auth/signUp/sign_up._screen.dart';
import 'package:e_commerce_app/presentation/utils/dialogUtils.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/domain/di.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String routeName = "login_screen";
  LoginViewModel loginViewModel =
      LoginViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      bloc: loginViewModel,
      listener: (context, state) {
        if (state is LoginLoadinState) {
          DialogUtils.showLoading(
              context: context, message: state.loadingMessege);
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context, message: state.errorMessege!);
        } else if (state is LoginSuccesState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.loginRepositoryEntity.message ?? "");
        }
      },
      child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: LoginBody(
            emailController: loginViewModel.emailController,
            passwordController: loginViewModel.passwordController,
            formKey: loginViewModel.formKey,
            buttonFunction: () {
              loginViewModel.login();
            },
            navigateToSignUp: () {
              loginViewModel.navigateToSignUpScreen(context);
            },
          )),
    );
  }
}

import 'package:e_commerce_app/presentation/auth/signUp/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewModel extends Cubit<SignUpState> {
  SignUpViewModel() : super(SignInitialState());

  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  late bool isObsecure = true;

  void signUp() {}
}

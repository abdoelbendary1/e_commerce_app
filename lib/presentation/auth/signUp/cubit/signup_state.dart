// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/domain/entities/sign_up_repository_entitiy/sign_up_repository_entitiy.dart';

abstract class SignUpState {}

class SignInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {
  String loadingMessege = "Loading...";
}

class SignUpSuccessState extends SignUpState {
  SignUpRepositoryEntitiy? signUpRepositoryEntitiy;
  SignUpSuccessState({
    required this.signUpRepositoryEntitiy,
  });
}

class SignUpErrorState extends SignUpState {
  String? errorMessege;
  SignUpErrorState({
    required this.errorMessege,
  });
}

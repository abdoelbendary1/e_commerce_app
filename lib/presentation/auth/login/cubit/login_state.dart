// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/domain/entities/login_repository_entity/login_repository_entity.dart';

abstract class LoginState {}

class LoginLoadinState extends LoginState {
  String loadingMessege = "Loading...";
}

class LoginErrorState extends LoginState {
  String? errorMessege;
  LoginErrorState({
    required this.errorMessege,
  });
}

class LoginSuccesState extends LoginState {
  LoginRepositoryEntity loginRepositoryEntity;
  LoginSuccesState({
    required this.loginRepositoryEntity,
  });
}

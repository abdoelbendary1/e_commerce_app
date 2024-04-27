import 'package:e_commerce_app/domain/entities/sign_up_repository_entitiy/user_entity.dart';

class LoginRepositoryEntity {
  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;

  LoginRepositoryEntity({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
  });
}

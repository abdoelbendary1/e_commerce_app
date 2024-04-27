import 'package:e_commerce_app/data/model/response/sign_up_response_dm/user_Dm.dart';
import 'package:e_commerce_app/domain/entities/login_repository_entity/login_repository_entity.dart';

class LoginResponseDM {
  String? message;
  UserDM? user;
  String? token;
  String? statusMsg;

  LoginResponseDM({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
  });

  factory LoginResponseDM.fromJson(Map<String, dynamic> json) =>
      LoginResponseDM(
        message: json['message'] as String?,
        user: json['user'] == null
            ? null
            : UserDM.fromJson(json['user'] as Map<String, dynamic>),
        token: json['token'] as String?,
        statusMsg: json['statusMsg'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
        'statusMsg': statusMsg,
      };

  LoginRepositoryEntity toLoginRepositoryEntity() {
    return LoginRepositoryEntity(
      message: message,
      statusMsg: statusMsg,
      token: token,
      user: user?.toUserEntity(),
    );
  }
}

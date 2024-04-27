import 'package:e_commerce_app/data/model/response/sign_up_response_dm/response_error.dart';

import 'user_Dm.dart';

class SignUpResponseDm {
  String? message;
  UserDM? user;
  String? token;
  Errors? errors;

  SignUpResponseDm({this.message, this.user, this.token, this.errors});

  factory SignUpResponseDm.fromJson(Map<String, dynamic> json) {
    return SignUpResponseDm(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : UserDM.fromJson(json['user'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'user': user?.toJson(),
        'token': token,
        'errors': errors,
      };
}

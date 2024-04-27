import 'package:e_commerce_app/domain/entities/sign_up_repository_entitiy/user_entity.dart';

class UserDM {
  String? name;
  String? email;
  String? role;

  UserDM({this.name, this.email, this.role});

  factory UserDM.fromJson(Map<String, dynamic> json) => UserDM(
        name: json['name'] as String?,
        email: json['email'] as String?,
        role: json['role'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'role': role,
      };

  UserEntity toUserEntity() {
    return UserEntity(email: email, name: name);
  }
}

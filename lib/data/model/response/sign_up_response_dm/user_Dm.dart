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
}

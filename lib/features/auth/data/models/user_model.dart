import 'package:jop_task/features/auth/domain/entities/user_auth.dart';

class UserModel extends UserAuth {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt:
          DateTime.tryParse(json['email_verified_at']) ?? DateTime(0),
      createdAt: DateTime.tryParse(json['created_at']) ?? DateTime(0),
      updatedAt: DateTime.tryParse(json['updated_at']) ?? DateTime(0),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

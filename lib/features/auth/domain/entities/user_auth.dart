
import 'package:equatable/equatable.dart';

class UserAuth extends Equatable {
  final int id;
  final String name;
  final String email;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserAuth({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        emailVerifiedAt,
        createdAt,
        updatedAt,
      ];
}

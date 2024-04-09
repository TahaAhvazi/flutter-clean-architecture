import 'package:flutter_json_clean/features/users/domain/entities/users.dart';

class UsersModel extends UsersEntities {
  const UsersModel({
    required super.id,
    required super.name,
    required super.username,
    required super.email,
    required super.address,
    required super.phone,
    required super.website,
    required super.company,
  });
  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      address: Address.fromJson(json["address"]),
      phone: json["phone"],
      website: json["website"],
      company: Company.fromJson(json["company"]),
    );
  }
}

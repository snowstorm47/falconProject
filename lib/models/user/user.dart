import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  @JsonKey(required: true)
  final String id;
  final String? phone;
  final String? name;
  final String? username;
  final String? email;


  User({
    required this.id,
    this.phone,
    this.name,
    this.username,
    this.email,
   
  });
  factory User.fromJson(Map<String, dynamic> responseData){
    return User(
      id: responseData['id'],
      name: responseData['name'],
      phone: responseData['phone'],
      username: responseData['username'],
      email: responseData['email']
    );
  }
}

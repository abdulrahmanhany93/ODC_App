import 'dart:convert';

import '../../presentation/consts/controllers.dart';

class RegisterModel {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String address;
  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
  });

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? address,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic>? toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Register(name: $name, email: $email, password: $password, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterModel &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.phone == phone &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        address.hashCode;
  }

  static RegisterModel createNewUser() {
    return RegisterModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        address: addressController.text);
  }
}

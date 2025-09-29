import 'dart:convert';
import 'package:crypto/crypto.dart';

class User {
  final String username;
  final String passwordHash; // Store hashed password
  double balance;

  User({
    required this.username,
    required this.passwordHash,
    this.balance = 0.0,
  });

  // Hash password using SHA256
  static String hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  Map<String, dynamic> toJson() => {
    'username': username,
    'passwordHash': passwordHash,
    'balance': balance,
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json['username'],
    passwordHash: json['passwordHash'],
    balance: (json['balance'] ?? 0.0).toDouble(),
  );
}

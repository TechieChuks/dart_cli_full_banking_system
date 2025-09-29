import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'transaction.dart';

class User {
  final String username;
  final String passwordHash; // Store hashed password
  double balance;
  List<Transaction> transactions;

  User({
    required this.username,
    required this.passwordHash,
    this.balance = 0.0,
    List<Transaction>? transactions,
  }) : transactions = transactions ?? [];
  // Hash password using SHA256
  static String hashPassword(String password) =>
      sha256.convert(utf8.encode(password)).toString();

  Map<String, dynamic> toJson() => {
    'username': username,
    'passwordHash': passwordHash,
    'balance': balance,
    'transactions': transactions.map((t) => t.toJson()).toList(),
  };

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json['username'],
    passwordHash: json['passwordHash'],
    balance: (json['balance'] ?? 0.0).toDouble(),

    transactions:
        (json['transactions'] as List?)
            ?.map((t) => Transaction.fromJson(t))
            .toList() ??
        [],
  );
}

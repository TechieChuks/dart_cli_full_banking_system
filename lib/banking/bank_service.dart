import 'package:dart_cli_full_banking_system/banking/models/transaction.dart';
import 'package:dart_cli_full_banking_system/banking/models/user.dart';

import '../utils/storage.dart';

class BankService {
  final Storage storage;
  List<User> _users = [];

  BankService(this.storage);

  // Load users from JSON
  Future<void> loadUsers() async {
    _users = await storage.readUsers();
  }

  // Register a new user
  Future<bool> register(String username, String password) async {
    if (_users.any((u) => u.username == username)) return false;
    final hashed = User.hashPassword(password);
    final user = User(username: username, passwordHash: hashed);
    _users.add(user);
    await storage.saveUsers(_users);
    return true;
  }

  // Authenticate user
  User? login(String username, String password) {
    final hashed = User.hashPassword(password);
    try {
      return _users.firstWhere(
        (u) => u.username == username && u.passwordHash == hashed,
      );
    } catch (e) {
      return null;
    }
  }

  // Deposit money
  Future<void> deposit(User user, double amount) async {
    // Simulate async operation
    await Future.delayed(Duration(milliseconds: 500));
    user.balance += amount;
    user.transactions.add(Transaction(type: 'deposit', amount: amount));
    await storage.saveUsers(_users);
  }

  // Withdraw money
  Future<bool> withdraw(User user, double amount) async {
    await Future.delayed(Duration(milliseconds: 500));
    if (user.balance < amount) return false;
    user.balance -= amount;
    user.transactions.add(Transaction(type: 'withdraw', amount: amount));
    await storage.saveUsers(_users);
    return true;
  }

  // Check balance
  double checkBalance(User user) => user.balance;
  List<Transaction> getTransactionHistory(User user) => user.transactions;
}

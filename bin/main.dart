import 'dart:io';

import 'package:dart_cli_full_banking_system/banking/bank_service.dart';
import 'package:dart_cli_full_banking_system/banking/models/user.dart';
import 'package:dart_cli_full_banking_system/utils/storage.dart';

void main() async {
  final storage = Storage();
  final bank = BankService(storage);

  await bank.loadUsers();

  print('=== CLI Banking System ===');

  while (true) {
    print('\n1. Register');
    print('2. Login');
    print('3. Exit');
    stdout.write('Choice: ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await registerCLI(bank);
        break;
      case '2':
        await loginCLI(bank);
        break;
      case '3':
        print('Goodbye!');
        exit(0);
      default:
        print('Invalid choice.');
    }
  }
}

Future<void> registerCLI(BankService bank) async {
  stdout.write('Username: ');
  final username = stdin.readLineSync()!;
  stdout.write('Password: ');
  final password = stdin.readLineSync()!;
  final success = await bank.register(username, password);
  print(success ? 'Registration successful!' : 'Username already exists.');
}

Future<void> loginCLI(BankService bank) async {
  stdout.write('Username: ');
  final username = stdin.readLineSync()!;
  stdout.write('Password: ');
  final password = stdin.readLineSync()!;
  final user = bank.login(username, password);

  if (user == null) {
    print('Login failed!');
    return;
  }

  print('Welcome ${user.username}!');
  await userMenu(bank, user);
}

Future<void> userMenu(BankService bank, User user) async {
  while (true) {
    print('\n1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Logout');
    stdout.write('Choice: ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Amount to deposit: ');
        final amount = double.tryParse(stdin.readLineSync()!) ?? 0;
        await bank.deposit(user, amount);
        print('Deposited \$${amount.toStringAsFixed(2)}');
        break;
      case '2':
        stdout.write('Amount to withdraw: ');
        final amount = double.tryParse(stdin.readLineSync()!) ?? 0;
        final success = await bank.withdraw(user, amount);
        print(
          success
              ? 'Withdrawn \$${amount.toStringAsFixed(2)}'
              : 'Insufficient balance.',
        );
        break;
      case '3':
        print('Balance: \$${bank.checkBalance(user).toStringAsFixed(2)}');
        break;
      case '4':
        print('Logged out.');
        return;
      default:
        print('Invalid choice.');
    }
  }
}

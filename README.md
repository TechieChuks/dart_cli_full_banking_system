# Dart CLI Banking System

A simple **Command-Line Banking Application** built with Dart.
It supports user authentication, deposits, withdrawals, and balance checks, while saving user data securely in a JSON file.

---

## Project Structure

```
dart_cli_banking_system/
├── bin/
│   └── main.dart               # CLI entry point
├── lib/
│   ├── models/
│   │   └── user.dart           # User model
│   ├── services/
│   │   └── bank_service.dart   # Banking logic
│   └── utils/
│       └── storage.dart        # File I/O utility
├── data/
│   └── users.json              # User data storage
├── pubspec.yaml
```

---

## Features

* **Register & Login** with username/password
* **Multiple Users** supported
* **Deposit & Withdraw** funds
* **Check Balance** anytime
* **Data Persistence** using JSON (`users.json`)
* **Interactive CLI**

---

## Usage

### 1. Clone Repository

```bash
git clone https://github.com/TechieChuks/dart_cli_full_banking_system.git
cd dart_cli_full_banking_system
```

### 2. Run Application

```bash
dart run bin/main.dart
```

---

## Example Run

```
=== Welcome to Dart CLI Banking System ===

1. Register
2. Login
3. Exit
Choose option: 1
Username: TechieChuks
Password: 1234
Registration successful!

1. Register
2. Login
3. Exit
Choose option: 2
Username: TechieChuks
Password: 1234
Login successful! Welcome alice

1. Deposit
2. Withdraw
3. Check Balance
4. Logout
Choose option: 1
Enter amount to deposit: 200
Deposited $200.00
```

---

## Concepts Practiced

* File I/O in Dart
* JSON persistence
* Authentication flow (simple username/password)
* CLI interactivity with `dart:io`

---

## License

MIT License.

class Transaction {
  final String type; // deposit or withdraw
  final double amount;
  final DateTime date;

  Transaction({required this.type, required this.amount, DateTime? date})
    : date = date ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'type': type,
    'amount': amount,
    'date': date.toIso8601String(),
  };

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    type: json['type'],
    amount: (json['amount'] ?? 0.0).toDouble(),
    date: DateTime.parse(json['date']),
  );
}

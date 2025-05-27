class Transaction {
  final String type; // 'deposit' or 'withdrawal'
  final double amount;
  final DateTime timestamp;

  Transaction({
    required this.type,
    required this.amount,
    required this.timestamp,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      type: json['type'],
      amount: json['amount'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'amount': amount,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  @override
  String toString() {
    return '$type of \$${amount.toStringAsFixed(2)} on ${timestamp.toLocal()}';
  }
}

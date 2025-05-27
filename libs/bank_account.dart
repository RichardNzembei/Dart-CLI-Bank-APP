import 'transaction.dart';

class BankAccount {
  final String accountNo;
  String name;
  String pin;
  double balance;
  List<Transaction> history;

  BankAccount({
    required this.accountNo,
    required this.name,
    required this.pin,
    required this.balance,
    required this.history,
  });

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      final tx = Transaction(
        type: 'deposit',
        amount: amount,
        timestamp: DateTime.now(),
      );
      history.add(tx);
      print('Deposited \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid amount.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      final tx = Transaction(
        type: 'withdrawal',
        amount: amount,
        timestamp: DateTime.now(),
      );
      history.add(tx);
      print('Withdrew \$${amount.toStringAsFixed(2)}');
    } else {
      print('Invalid or insufficient amount.');
    }
  }

  void printHistory() {
    print('Transaction History:');
    if (history.isEmpty) {
      print('No transactions yet.');
    } else {
      for (var tx in history) {
        print('- $tx');
      }
    }
  }

  factory BankAccount.fromJson(String accountNo, Map<String, dynamic> json) {
    return BankAccount(
      accountNo: accountNo,
      name: json['name'],
      pin: json['pin'],
      balance: json['balance'],
      history:
          (json['history'] as List)
              .map((e) => Transaction.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pin': pin,
      'balance': balance,
      'history': history.map((e) => e.toJson()).toList(),
    };
  }
}

// bank_account.dart

class BankAccount {
  String owner;
  double _balance = 0;
  List<String> _transactionHistory = [];

  BankAccount(this.owner);

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      _transactionHistory.add('Deposited: KES ${amount.toStringAsFixed(2)}');
      print('Deposit successful.');
    } else {
      print('Deposit amount must be positive.');
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      _transactionHistory.add('Withdrew: KES ${amount.toStringAsFixed(2)}');
      print('Withdrawal successful.');
    } else {
      print('Invalid withdrawal amount.');
    }
  }

  void showBalance() {
    print('Current balance:KES ${_balance.toStringAsFixed(2)}');
  }

  void showHistory() {
    if (_transactionHistory.isEmpty) {
      print('No transactions yet.');
    } else {
      print('Transaction History:');
      for (var entry in _transactionHistory) {
        print(entry);
      }
    }
  }
}

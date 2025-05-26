class BankAccount {
  final String owner;
  double _balance;

  BankAccount({required this.owner, required double balance})
    : _balance = balance;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be positive');
    }
    _balance += amount;
    print('Deposited KES $amount. New balance: KES $_balance');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Amount must be positive.');
    }
    if (amount > _balance) {
      throw InsufficientBalanceException(
        'Not enough balance to withdraw KES $amount.',
      );
    }
    _balance -= amount;
    print('Withdrew KES $amount. New balance: KES $_balance');
  }
}

class InsufficientBalanceException implements Exception {
  final String message;
  InsufficientBalanceException(this.message);
}

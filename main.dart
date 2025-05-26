import 'dart:io';
import './libs/bank_account.dart';

void main() {
  final account = BankAccount(owner: 'Richard Nzembei', balance: 21000);
  print('Welcome to Dart Bank, ${account.owner}');
  print('Your starting balance is: KES ${account.balance}');
  print('------------------------------------------');

  while (true) {
    print(
      '\nChoose an operation:\n1. Deposit\n2. Withdraw\n3. Check Balance\n4. Exit',
    );
    stdout.write('Enter choice (1-4)');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter amount to deposit: ');
        final input = stdin.readLineSync();
        try {
          final amount = double.parse(input!);
          account.deposit(amount);
        } catch (e) {
          print('Invalid deposit: $e');
        }
        break;

      case '2':
        stdout.write('Enter amount to withdraw: ');
        final input = stdin.readLineSync();
        try {
          final amount = double.parse(input!);
          account.withdraw(amount);
        } on InsufficientBalanceException catch (e) {
          print('Withdrawal failed: ${e.message}');
        } catch (e) {
          print('invalid withdrawal: $e');
        }
        break;

      case '3':
        print('Your balance is: KES ${account.balance}');
        break;

      case '4':
        print('Thanks for using Dart Bank');
        return;

      default:
        print('Invalid Option. Try again');
    }
  }
}

import 'dart:io';
import '../libs/bank_account.dart';
import '../libs/styling.dart';

void main() {
  showHeader('Welcome to Dart CLI Bank');

  stdout.write('Enter your name: ');
  final name = stdin.readLineSync() ?? 'Guest';
  final account = BankAccount(name);

  while (true) {
    print('\nHi $name! What would you like to do?');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. View History');
    print('5. Exit');
    stdout.write('Enter choice: ');
    final input = stdin.readLineSync();

    switch (input) {
      case '1':
        stdout.write('Enter amount to deposit: ');
        final amount = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        account.deposit(amount);
        break;
      case '2':
        stdout.write('Enter amount to withdraw: ');
        final amount = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        account.withdraw(amount);
        break;
      case '3':
        account.showBalance();
        break;
      case '4':
        account.showHistory();
        break;
      case '5':
        print('Thanks for using Dart Bank!');
        return;
      default:
        print('Invalid option. Try again.');
    }
  }
}

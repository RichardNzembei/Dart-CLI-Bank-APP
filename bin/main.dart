import 'dart:convert';
import 'dart:io';
import '../libs/bank_account.dart';
import '../libs/styling.dart';

Future<void> main() async {
  showHeader("Welcome to Dart CLI Bank");
  final accounts = await loadAccounts();

  final loggedInAccountNo = await login(accounts);
  if (loggedInAccountNo == null) return;

  final account = BankAccount.fromJson(
    loggedInAccountNo,
    accounts[loggedInAccountNo],
  );

  while (true) {
    print('\n--- Menu ---');
    print('1. View Balance');
    print('2. Deposit');
    print('3. Withdraw');
    print('4. View History');
    print('5. Exit');

    stdout.write('Choose an option: ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Balance: \$${account.balance}');
        break;
      case '2':
        stdout.write('Enter amount to deposit: ');
        final amount = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        account.deposit(amount);
        break;
      case '3':
        stdout.write('Enter amount to withdraw: ');
        final amount = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        account.withdraw(amount);
        break;
      case '4':
        account.printHistory();
        break;
      case '5':
        await saveAccount(account);
        print('Goodbye!');
        return;
      default:
        print('Invalid option.');
    }
  }
}

Future<Map<String, dynamic>> loadAccounts() async {
  final file = File('../public/accounts.json');
  if (!await file.exists()) {
    await file.writeAsString('{}');
  }
  return jsonDecode(await file.readAsString());
}

Future<String?> login(Map<String, dynamic> accounts) async {
  stdout.write('Enter account number: ');
  final accountNo = stdin.readLineSync();

  if (accountNo == null || !accounts.containsKey(accountNo)) {
    print('Account not found.');
    return null;
  }

  stdout.write('Enter PIN: ');
  final pin = stdin.readLineSync();

  if (pin == accounts[accountNo]['pin']) {
    print('Login successful. Welcome ${accounts[accountNo]['name']}!');
    return accountNo;
  } else {
    print('Incorrect PIN.');
    return null;
  }
}

Future<void> saveAccount(BankAccount account) async {
  final file = File('accounts.json');
  final content = jsonDecode(await file.readAsString());

  content[account.accountNo] = account.toJson();
  await file.writeAsString(JsonEncoder.withIndent('  ').convert(content));
}

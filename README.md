# Dart Bank App 🏦

A simple command-line banking application built in Dart.

This app supports **multiple user accounts**, **secure login using PIN**, **balance management**, and **persistent transaction history** — all stored in a JSON file.

---

## ✨ Features

- 🔐 **Login System**  
  Secure login using account number and a 4-digit PIN.

- 👥 **Multiple Accounts Support**  
  All user accounts are stored and managed in a single `accounts.json` file.

- 💰 **Deposit & Withdraw**  
  Users can deposit or withdraw funds. Balances are updated immediately.

- 📜 **Transaction History**  
  Every account logs all transactions with type, amount, and timestamp.

- 💾 **Persistent Storage**  
  Data is stored in `accounts.json` and preserved across sessions.

- 🧱 **Modular Code**  
  Clean architecture using a `BankAccount` class in a separate Dart file.

---

## 🗂 Project Structure
```
Dart-CLI-Bank-APP/
├── bin/
│ └── main.dart # App entry point
├── libs/
│ └── bank_account.dart # Contains the BankAccount class
| └── transactions.dart # Contains the Transaction data
| └── styling.dart # Contains Stling for the Header in Main.dart
├── public/
│ └── accounts.json # Stores user accounts and history
```

---
## 🚀 Run the App

Make sure Dart is installed, then run:

```bash
dart run bin/main.dart

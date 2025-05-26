void showHeader(String title) {
  print('\n+${'-' * 40}+');
  print('|${title.padLeft((title.length + 40) ~/ 2).padRight(40)}|');
  print('+${'-' * 40}+');
}

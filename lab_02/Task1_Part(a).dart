import 'dart:io';

void main() {
  // Take user input for name
  stdout.write('Enter your Name: ');
  String? userName = stdin.readLineSync();

  // Check if the user provided a name
  if (userName == "") {
    userName = 'Guest';
  }

  // Print the welcome message
  print('Hello $userName, welcome to Flutter!');
}

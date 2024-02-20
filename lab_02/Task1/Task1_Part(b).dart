import 'dart:io';

void main() {
  // Take user input for name
  stdout.write('Enter your Name: ');
  String? userName = stdin.readLineSync();

  // Check if the user provided a name
  if (userName == "") {
    greetUser();
  }
  else {
    greetUser(userName);
  }
}

void greetUser([String? userName]) {
   // Print the welcome message
  print('Hello ${userName ?? 'Guest'}, welcome to Flutter!');
}

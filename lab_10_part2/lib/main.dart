import 'package:flutter/material.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 10_Part2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      initialRoute: "/",
      routes: {
        "/login": (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

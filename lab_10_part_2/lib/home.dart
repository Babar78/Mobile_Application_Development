import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences?
      prefs; // Declare a variable to store SharedPreferences instance

  @override
  void initState() {
    super.initState();
    initializePrefs(); // Call to initialize SharedPreferences on widget initialization
  }

  Future<void> initializePrefs() async {
    prefs = await SharedPreferences
        .getInstance(); // Get an instance of SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Screen',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  // Clear 'isLoggedIn' flag in SharedPreferences on logout
                  prefs?.setBool('rememberMe', false);
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}

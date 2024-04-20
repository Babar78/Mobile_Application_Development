import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 09',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  fetchUsername() async {
    return Future.delayed(
       const Duration(
          seconds: 3,
        ),
        () => 'Muhammad Babar');
  }

  addHello(user) {
    return 'Hello $user';
  }

  greetUser() async {
    String username = await fetchUsername();
    return addHello(username);
  }

  sayGoodbye() async {
    try {
      String result = await logoutUser();
      return '$result Thanks, see you next time';
    } catch (e) {
      return 'Caught error: ${e.toString()}';
    }
  }

  logoutUser() async {
    return Future.delayed(const Duration(milliseconds: 500), () => 'Muhammad Babar');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1 (Part 03)',
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder(
          future: greetUser(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator(
                      color: Colors.blue,
                    )
                  : snapshot.connectionState == ConnectionState.done
                      ? Text('${snapshot.data}')
                      : const Text('Error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          String message = await sayGoodbye();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

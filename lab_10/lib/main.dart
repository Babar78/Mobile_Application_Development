import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:store_data/models/search.dart';
import 'package:store_data/services/fetchSearchData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 10',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Search> searchString = [];

  @override
  void initState() {
    super.initState();
    fetchDataAndSaveToFile();
  }

  Future<void> fetchDataAndSaveToFile() async {
    try {
      if (searchString.isEmpty) {
        final fetchedData = await fetchSearchData();
        final jsonData = fetchedData.map((search) => search.toJson()).toList();
        await writeToFile(jsonData);
      }
      readJsonFile();
    } catch (e) {
      print('Error fetching and saving data: $e');
    }
  }

  Future<void> writeToFile(List<Map<String, dynamic>> data) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/searchlist.json');
      await file.writeAsString(jsonEncode(data));
    } catch (e) {
      print('Error writing to file: $e');
    }
  }

  Future<void> readJsonFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/searchlist.json');
      final data = await file.readAsString();
      setState(() {
        searchString =
            List<Search>.from(jsonDecode(data).map((x) => Search.fromJson(x)));
      });
    } catch (e) {
      print('Error reading JSON file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lab 10 (Store Data)',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: FutureBuilder<List<Search>>(
          future:
              Future.delayed(const Duration(seconds: 1), () => searchString),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Colors.blue,
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List<Search>? searchData = snapshot.data;
              return Column(
                children: [
                  const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Task 1: (Part 2)',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text(
                            'Muhammad Babar\nmbabar.bese20seecs@seecs.edu.pk\n335375',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    child: Container(
                      color: Colors.grey.shade200,
                      child: ListView.builder(
                        itemCount: searchData!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: ListTile(
                                title: Text(searchData[index].title),
                                subtitle: Text(searchData[index].date),
                                trailing: Text(searchData[index].contentType),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const Text('No data');
            }
          },
        ),
      ),
    );
  }
}

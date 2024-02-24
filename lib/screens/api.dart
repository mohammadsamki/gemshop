import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

String apiUrl = 'https://api.publicapis.org/entries';

class DataNew {
  String? API;
  String? Description;
  String? Auth;
  bool? HTTPS;
  String? Cors;
  String? Link;
  String? Category;

  DataNew({
    this.API,
    this.Description,
    this.Auth,
    this.HTTPS,
    this.Cors,
    this.Link,
    this.Category,
  });

  factory DataNew.fromJson(Map<String, dynamic> json) {
    return DataNew(
      API: json['API'],
      Description: json['Description'],
      Auth: json['Auth'],
      HTTPS: json['HTTPS'],
      Cors: json['Cors'],
      Link: json['Link'],
      Category: json['Category'],
    );
  }
}

Future<List<DataNew>> fetchData() async {
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body)['entries'];
    return data.map((json) => DataNew.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<DataNew>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data'),
      ),
      body: FutureBuilder<List<DataNew>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                DataNew data = snapshot.data![index];
                return ListTile(
                  title: Text(data.API ?? 'N/A'),
                  subtitle: Text(data.Description ?? 'N/A'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
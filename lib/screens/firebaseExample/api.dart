import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String apiUrl = 'https://api.publicapis.org/entries';

class Data {
  String? API;
  String? Description;
  String? Auth;
  String? HTTPS;
  String? Link;
  String? Category;

  Data({
    this.API,
    this.Description,
    this.Auth,
    this.HTTPS,
    this.Link,
    this.Category,
  });
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      API: json['API'],
      Description: json['Description'],
      Auth: json['Auth'],
      HTTPS: json['HTTPS'],
      Link: json['Link'],
      Category: json['Category'],
    );
  }
}

Future<List<Data>> getData() async {
  final response = await http.get(Uri.parse(apiUrl));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map<Data>((i) => Data.fromJson(i)).toList();
  } else {
    throw Exception('failed to load data');
  }
}

class DataFromApi extends StatefulWidget {
  @override
  _DataFromApiState createState() => _DataFromApiState();
}

class _DataFromApiState extends State<DataFromApi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data From API"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Data From API"),
            ElevatedButton(
                onPressed: () {
                  print(getData());
                },
                child: Text("Get Data From API"))
          ],
        ),
      ),
    );
  }
}

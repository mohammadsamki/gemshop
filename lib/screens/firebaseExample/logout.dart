import 'package:flutter/material.dart';
import 'auth_service.dart'; // Assume this is the file where your signOut function is located.

class HomeScreen extends StatelessWidget {
  void _logout(BuildContext context) async {
    String? result = await signOut();
    if (result == null) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Check if the user is already logged in
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // If the user is logged in, take them to the HomeScreen
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed('/home');
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
            ),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.of(context).pushNamed('/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}

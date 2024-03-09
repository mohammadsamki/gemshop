import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth_service.dart'; // Make sure this is the correct path to your AuthService class
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginWithEmail() async {
    String? result = await mailSignIn(
      _emailController.text,
      _passwordController.text,
    );
    if (result == null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result)));
    }
  }

  void _loginWithGoogle() async {
    UserCredential? result = await googleSignIn();
    if (result == null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('result')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _loginWithEmail,
              child: Text('Login with Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: Icon(Icons.login, color: Colors.white),
              label: Text('Sign in with Google'),
              onPressed: _loginWithGoogle,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Corrected parameter
                // onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

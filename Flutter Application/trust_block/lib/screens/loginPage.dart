import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:flutter/material.dart';
import 'package:trust_block/api/local_auth_api.dart';
import 'package:trust_block/screens/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  Future<bool> _authenticate() async {
    bool authenticated = false;
    try {
      if (!await LocalAuth.authenticate()) return false;

      authenticated = await LocalAuth.authenticate();
    } catch (e) {
      debugPrint('error $e');
      return false;
    }
    return authenticated;
  }

  void _login(BuildContext context) async {
    bool authenticated = await _authenticate();
    if (authenticated) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardDemo()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Authenticate'),
          onPressed: () => _login(context),
        ),
      ),
    );
  }
}

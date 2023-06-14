import 'package:flutter/material.dart';
import 'package:tp_twitter/auth/lopin-form.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [LoginForm()],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 10,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.grey[500], fontFamily: "Bassem"),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("welcome to login screen", style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}

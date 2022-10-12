import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Email"),
            TextField(
              controller: email,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Password"),
            TextField(
              controller: password,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () async {
                  try {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("added successfully")));
                    var authObject = FirebaseAuth.instance;
                    UserCredential myUser =
                        await authObject.createUserWithEmailAndPassword(
                            email: email.text, password: password.text);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Sorry this email already exists")));
                  }
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}

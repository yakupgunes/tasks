// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          title: Center(
            child: Text(
              "Giriş yapılan hesap: " + user.email!,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ],
        ));
  }
}

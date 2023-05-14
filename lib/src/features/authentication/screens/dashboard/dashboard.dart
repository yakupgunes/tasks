// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: InkWell(
              onTap: () {
                AuthenticationRepository.instance.logout();
              },
              child: Text("çıkış")),
        ),
      ),
    );
  }
}

//yeniden başlatılıp denenecek olmazsa signup screendeki final _formKey = GlobalKey<FormState>(); static yapılarak üste alınacak öyle Denenecek(),

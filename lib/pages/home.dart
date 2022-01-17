import 'package:flutter/material.dart';

import 'login.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Fest !"),
            const SizedBox(height: 50,),
            OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                },
                icon: const Icon(
                  Icons.exit_to_app,
                  size: 18,),
                label: const Text("Se déconnecter"))
          ],
        ),
      ),
    );
  }
}

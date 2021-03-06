import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.network("https://pbs.twimg.com/profile_images/1383911916188291081/cGRm2J6o_400x400.jpg", width: 200,
                      fit:BoxFit.fill),
                const SizedBox(height: 45,),
                const Text("Ragnar"),
                const SizedBox(height: 45,),
                Image.network("data:image/jpeg;base64,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", width: 200,
                    fit:BoxFit.fill),
                const SizedBox(height: 45,),
                const Text("Renaud"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (emailController.text.isNotEmpty) {
      if (passwordController.text.isNotEmpty) {
        var reponse = await http.post(
            Uri.parse("https://reqres.in/api/login"), body: ({
          'email': emailController.text,
          'password': passwordController.text
        }));
        if (reponse.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  "L'identifiant et/ou le mot de passe est incorrect.")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Le mot de passe ne peux ??tre vide."),));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("L'identifiant ne peux ??tre vide."),));
    }
  }
}

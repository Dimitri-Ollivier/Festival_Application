import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
                  ),
                const SizedBox(height: 18,),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      labelText: "Mot de passe",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.password)),
                ),
                const SizedBox(height: 45,),
                OutlinedButton.icon(
                    onPressed: () {
                      login();
                    },
                    icon: const Icon(
                        Icons.login,
                        size: 18,),
                        label: const Text("Se connecter")),
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
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Le mot de passe ne peux être vide."),));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("L'identifiant ne peux être vide."),));
    }
  }
}

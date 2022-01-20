import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Festival App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: DataFromAPI(),
    );
  }
}

class DataFromAPI extends StatefulWidget {
  const DataFromAPI({Key? key}) : super(key: key);

  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  getUserData() async {
    var reponse = await http.get(Uri.parse('http://localhost:3000/api/v1/users/'));
    var jsonData = jsonDecode(reponse.body);
    List<User> users = [];

    for(var u in jsonData) {
      User user = User(u["id"], u["name"], u["email"], u["statut"], u["password"], u["picture"]);
      users.add(user);
    }

    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste utilisateur')),
        body: Container(
          child: Card(child: FutureBuilder(
            future: getUserData(),
            builder: (context, AsyncSnapshot snapshot) {
              if(snapshot.data == null) {
                return Container(child: const Center(
                  child: Text('Loading...'),
                ),
                );
              } else {
                return ListView.builder(itemCount: snapshot.data.length, itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(snapshot.data[i].name),
                    subtitle: Text(snapshot.data[i].email),
                  );
                },)
              }
            },
          ),),
        ));
  }
}

class User {
  int id;
  String name;
  String email;
  int statut;
  String password;
  String picture;

  User(this.id, this.name, this.email, this.statut, this.password, this.picture);
}
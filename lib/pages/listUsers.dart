import 'dart:convert';

import 'package:festival_application/models/users.dart';
import 'package:festival_application/services/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListUsers extends StatefulWidget {
  const ListUsers({Key? key}) : super(key: key);

  @override
  _ListUsers createState() => _ListUsers();
}

class _ListUsers extends State<ListUsers> {
  getUsers() async {
    var client = http.Client();
    var reponse = await client.get(Uri.parse(Routes.usersRoute));
    var jsonData = jsonDecode(reponse.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u['id'], u['name'], u['email'], u['statut'], u['password'], u['picture']);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Membres"),),
      body: Container(
        child: Card(child: FutureBuilder<List<User>>(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].email),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      )
      ),
    );
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
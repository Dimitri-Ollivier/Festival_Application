import 'package:festival_application/services/api_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:festival_application/models/events.dart';

class ListEvents extends StatefulWidget {
  const ListEvents({Key? key}) : super(key: key);

  @override
  _ListEvents createState() => _ListEvents();
}

class _ListEvents extends State<ListEvents> {
  late Future<Events> _events;

  @override
  void initState() {
    _events = API_Manager().getEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Evénements à venir"),),
      body: FutureBuilder<Events>(
        future: _events,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.toJson().length,
                itemBuilder: (context, index) {
              return Container(
                height: 100,
                child: Row(
                  children: const <Widget>[
                    Text("test"),
                  ],
                ),
              );
            });
          } else {
            return const Center(child:  CircularProgressIndicator());
          }
        },
      ),
      );
  }
}
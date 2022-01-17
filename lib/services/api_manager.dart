import 'dart:convert';

import 'package:festival_application/services/routes.dart';
import 'package:festival_application/models/users.dart';
import 'package:festival_application/models/events.dart';
import 'package:http/http.dart' as http;

class API_Manager {
  Future<Events> getEvents() async {
    var client = http.Client();
    var eventsModel;

    try {
      var response = await client.get(Uri.parse(Routes.eventsRoute));

      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        eventsModel = Events.fromJson(jsonMap);
      }
    } on Exception {
      return eventsModel;
    }

    return eventsModel;
  }
}
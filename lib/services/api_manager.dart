import 'package:http/http.dart' as http;

class API_Manager {
  void getEvents() {
    var client = http.Client();
    client.get('')
  }
}
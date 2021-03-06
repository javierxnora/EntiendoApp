import 'dart:convert';

import 'package:entiendo/Event/model/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

export 'package:entiendo/Event/model/event_model.dart';

class EventProvider extends ChangeNotifier {
  String _url = '192.168.1.87:3333';

  String date = DateFormat("dd-MM-yyyy").format(
    DateTime.parse(
      DateTime.now().toString(),
    ),
  );

  List<Event> events = [];
  Event event = Event();

  Future<List<Event>> getEventsFromDb(String date) async {
    final url = Uri.http(_url, '/events', {'eventDate': date});
    final response = await http.get(url);
    final decodedResponse = json.decode(response.body);

    events = event.getEventosFromJsonList(decodedResponse);

    return events;
  }

  Future changeEventStatus(Event event) async {
    final url = Uri.http(_url, '/events/${event.id}',
        {'eventStatusId': event.eventStatus.id.toString()});
    final response = await http.put(url);
    notifyListeners();
  }

  Future deleteEvent(Event event) async {
    final url = Uri.http(_url, '/events/${event.id}');
    final response = await http.delete(url);
    notifyListeners();
  }

  void changeDate(String newDate) {
    date = newDate;
    notifyListeners();
  }
}
